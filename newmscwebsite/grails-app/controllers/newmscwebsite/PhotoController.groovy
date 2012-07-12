package newmscwebsite

import grails.converters.JSON
import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile

import com.drew.imaging.ImageMetadataReader
import com.drew.metadata.Directory
import com.drew.metadata.Metadata
import com.drew.metadata.Tag
import com.drew.metadata.exif.ExifIFD0Directory
import com.drew.metadata.iptc.IptcDirectory
import com.drew.metadata.jpeg.JpegDirectory

import javax.servlet.http.HttpServletRequest

class PhotoController {
	// Remember to terminate the path with a '/'
	def rootDirectory = "./web-app"
	def defaultUploadDirectory = "/images/uploaded/"

	def uploadPhotos = {
	}
	
	def show = {
		[photo: Photo.get(params.id)]
	}

	def upload = {
		try {
			File uploaded = createTemporaryFile()
			InputStream inputStream = selectInputStream(request)
			uploadFile(inputStream, uploaded)
			def newFile = new File(rootDirectory + defaultUploadDirectory + params.qqfile)
			if (newFile.isFile()) {
				log.error("File already exists.")
				throw new FileUploadException("File already exists")
			} else {
				newFile.createNewFile()
				copyFile(uploaded, newFile)
				createPhotoForFile(newFile, defaultUploadDirectory)
			}
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch (FileUploadException e) {
			log.error("Failed to upload file.", e)
			return render(text: [success:false, message: e.message] as JSON, contentType:'text/json')	
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
		uploaded = File.createTempFile(uuid.toString(), '.tmp')
		return uploaded
	}

	private  void uploadFile(InputStream inputStream, File file) {
		try {
			file << inputStream
		} catch (Exception e) {
			throw new FileUploadException(e)
		}
	}

	private boolean copyFile(File source, File destination) {
		def reader = source.newReader()
		destination.withWriter { writer -> writer << reader }
		reader.close()
	}
	
	private void createPhotoForFile(File source, String defaultUploadDirectory) {
		Metadata metadata = ImageMetadataReader.readMetadata(source)
		for (Directory directory : metadata.getDirectories()) {
			for (Tag tag : directory.getTags()) {
				System.out.println(tag)
			}
		}
		def metadataMap = [path: defaultUploadDirectory, fileName: source.getName()]
		addJPEGItems(metadataMap, metadata)
		addEXIFItems(metadataMap, metadata)
		addIPTCItems(metadataMap, metadata)
		new Photo(metadataMap).save(failOnError: true)
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
