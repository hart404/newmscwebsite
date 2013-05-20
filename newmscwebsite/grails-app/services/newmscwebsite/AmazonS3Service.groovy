package newmscwebsite

import org.jets3t.service.acl.AccessControlList
import org.jets3t.service.impl.rest.httpclient.*
import org.jets3t.service.model.*
import org.jets3t.service.security.*

class AmazonS3Service {
	
	def grailsApplication

	RestS3Service s3
	boolean transactional = false
	String rootBucketPath="McDowellSonoranConservancyImages"
	String defaultBucketLocation=S3Bucket.LOCATION_US

	Map mimeExtensionMap = [
		'png' : 'image/png',
		'jpg': 'image/jpeg',
		'gif': 'image/gif',
		'tiff': 'image/tiff',
		'pdf': 'application/pdf',
		'mpeg': 'video/mpeg',
		'mp4': 'video/mp4',
		'mov': 'video/quicktime',
		'wmv': 'video/x-ms-wmv',
		'html': 'text/html',
		'xml': 'text/xml',
		'mp3': 'audio/mpeg',
		'flv': 'application/octet-stream',
		'doc': 'application/msword',
		'docx': 'application/msword',
		'xls': 'application/vnd.msexcel',
		'xlsx': 'application/vnd.msexcel',
		'ppt': 'application/vnd.mspowerpoint',
		'pptx': 'application/vnd.mspowerpoint',
		'kml': 'application/vnd.google-earth.kml+xml',
		'kmz': 'application/vnd.google-earth.kmz'
		
	]

	S3Bucket makeBucket(uid) {
		S3Bucket bucket = getS3Service().getOrCreateBucket((rootBucketPath + uid), defaultBucketLocation)
		bucket.setAcl AccessControlList.REST_CANNED_PUBLIC_READ
		return bucket
	}
	
	void putFile(File file) {
		def inputStream = file.newInputStream()
		def fileName = file.name
		def parts = fileName.tokenize('.')
		def extension = parts[-1]
		put(inputStream, file.name, '', extension, file.size())
	}

	void put(inputstream, name, uid, ext, length) {
		if (mimeExtensionMap.containsKey(ext.toLowerCase())) {
			String mime = mimeExtensionMap[ext.toLowerCase()];
			S3Bucket bucket = makeBucket(uid)
			S3Object up = new S3Object()
			up.setAcl AccessControlList.REST_CANNED_PUBLIC_READ
			up.setContentLength length
			up.setContentType mime
			up.setDataInputStream inputstream
			up.setKey name
			up.setBucketName bucket.getName()
			getS3Service().putObject(bucket, up)
		} else {
			log.error "File extension \"${ext}\" rejected"
		}
	}
	
	void putXML(text, name, uid) {
		String mime = mimeExtensionMap["xml"];
		S3Bucket bucket = makeBucket(uid)
		S3Object up = new S3Object(bucket, name, text)
		up.setAcl AccessControlList.REST_CANNED_PUBLIC_READ
		up.setContentLength text.length()
		up.setContentType mime
		getS3Service().putObject(bucket, up)
	}
	
	RestS3Service getS3Service() {
		if (s3 == null) {
			s3 = new RestS3Service(new AWSCredentials(grailsApplication.config.aws.accessKey, grailsApplication.config.aws.secretKey))
		}
		s3
	}
}

