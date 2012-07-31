package newmscwebsite

import grails.converters.JSON

import javax.servlet.http.HttpServletRequest

import org.grails.s3.*
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.drew.imaging.ImageMetadataReader
import com.drew.metadata.Directory
import com.drew.metadata.Metadata
import com.drew.metadata.Tag
import com.drew.metadata.exif.ExifIFD0Directory
import com.drew.metadata.iptc.IptcDirectory
import com.drew.metadata.jpeg.JpegDirectory

class PhotoController {
	static final String DEFAULT_S3_SOURCE = 'https://s3.amazonaws.com/conservancyImages/'
	
	def amazonS3Service
	
	// Remember to terminate the path with a '/'
	def rootDirectory = System.getProperty("user.home")
	def defaultUploadDirectory = '/upload/'

	def uploadPhotos = {
	}
	
	def show = {
		[photo: Photo.get(params.id)]
	}

	def upload = {
		println "Root Directory: ${rootDirectory}"	
		try {
			createUploadDirectory()
			File uploaded = createTemporaryFile()
			InputStream inputStream = selectInputStream(request)
			uploadFile(inputStream, uploaded)
			createPhotoForFile(uploaded, DEFAULT_S3_SOURCE + uploaded.name, params.qqfile)
			transferFileToS3(uploaded)
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch (FileUploadException e) {
			log.error("Failed to upload file.", e)
			return render(text: [success:false, message: e.message] as JSON, contentType:'text/json')	
		}
	}
	
	def transferFileToS3(file) {
		amazonS3Service.putFile(file)
	}
	
	def createUploadDirectory() {
		// Create the defaultUploadDirectory if necessary
		def directory = new File(rootDirectory + defaultUploadDirectory)
		if (!directory.isDirectory()) {
			log.info("Creating temporary directory")
			directory.mkdir()
		}
	}

	private InputStream selectInputStream(HttpServletRequest request) {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
			return uploadedFile.inputStream
		}
		return request.inputStream
	}

	private File createTemporaryFile() {
		File uploaded
		UUID uuid = UUID.randomUUID()
		try {
			uploaded = File.createTempFile(uuid.toString(), '.jpg')
		} catch (IOException e) {
			// Using CloudFoundry, the temp directory is protected
			// Create a file in a directory beneath root
			log.info("Could not create temporary file")
			createUploadDirectory()
			uploaded = new File(rootDirectory + defaultUploadDirectory, uuid)
			uploaded.createNewFile()
		}
		return uploaded
	}

	private  void uploadFile(InputStream inputStream, File file) {
		try {
			file << inputStream
		} catch (Exception e) {
			throw new FileUploadException(e)
		}
	}

	private void createPhotoForFile(File source, String sourceURL, String originalFileName) {
		Metadata metadata = ImageMetadataReader.readMetadata(source)
		def metadataMap = [path: defaultUploadDirectory, fileName: source.getName()]
		addJPEGItems(metadataMap, metadata)
		addEXIFItems(metadataMap, metadata)
		addIPTCItems(metadataMap, metadata)
		def photo = new Photo(metadataMap)
		photo.source = sourceURL
		photo.originalFileName = originalFileName
		photo.save(failOnError: true)
	}
	
	private void addJPEGItems(metadataMap, metadata) {
		Directory directory = metadata.getDirectory(JpegDirectory.class)
		metadataMap["width"] = directory.getInt(JpegDirectory.TAG_JPEG_IMAGE_WIDTH)
		metadataMap["height"] = directory.getInt(JpegDirectory.TAG_JPEG_IMAGE_HEIGHT)		
	}
	
	private void addEXIFItems(metadataMap, metadata) {
		Directory directory = metadata?.getDirectory(ExifIFD0Directory.class)
		metadataMap["artist"] = directory?.getString(ExifIFD0Directory.TAG_ARTIST) ?: "No Artist"
		String copyright = directory?.getString(ExifIFD0Directory.TAG_COPYRIGHT)
		if (copyright == null) {
			copyright = "No copyright"
		} else {
			copyright = copyright[1..-1] 
		}
		metadataMap["copyright"] =  copyright
	}
	
	private void addIPTCItems(metadataMap, metadata) {
		Directory directory = metadata.getDirectory(IptcDirectory.class)
		metadataMap["dateCreated"] = directory?.getDate(IptcDirectory.TAG_DATE_CREATED) ?: new Date()
		metadataMap["keywords"] = (directory?.getStringArray(IptcDirectory.TAG_KEYWORDS) ?: []) as List
		metadataMap["allKeywords"] = directory?.getString(IptcDirectory.TAG_KEYWORDS) ?: ""
		// metadataMap["usageRights"] = directory?.getString(IptcDirectory.TAG_) ?: ""
	}
}
