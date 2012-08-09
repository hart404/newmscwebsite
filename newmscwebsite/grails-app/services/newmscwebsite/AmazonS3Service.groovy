package newmscwebsite

import org.jets3t.service.acl.AccessControlList
import org.jets3t.service.impl.rest.httpclient.*
import org.jets3t.service.model.*
import org.jets3t.service.security.*

class AmazonS3Service {

	static String accessKey="AKIAJOBKCYNV42347HUA"
	static String secretKey="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"
	static RestS3Service s3 = new RestS3Service(new AWSCredentials(accessKey, secretKey))
	boolean transactional = false
	String rootBucketPath="conservancyImages"
	String defaultBucketLocation=S3Bucket.LOCATION_US

	Map mimeExtensionMap = [
		"png" : "image/png",
		"jpg": "image/jpeg",
		"gif": "image/gif",
		"tiff": "image/tiff",
		"pdf": "application/pdf",
		"mpeg": "video/mpeg",
		"mp4": "video/mp4",
		"mov": "video/quicktime",
		"wmv": "video/x-ms-wmv",
		"html": "text/html",
		"xml": "text/xml",
		"mp3": "audio/mpeg",
		"flv": "application/octet-stream"
	]

	S3Bucket makeBucket(uid) {
		S3Bucket bucket = s3.getOrCreateBucket((rootBucketPath + uid), defaultBucketLocation)
		bucket.setAcl AccessControlList.REST_CANNED_PUBLIC_READ
		return bucket
	}
	
	void putFile(File file) {
		def inputStream = file.newInputStream()
		def fileName = file.name
		def parts = fileName.tokenize('.')
		def extension = parts[1]
		put(inputStream, file.name, "", extension, file.size())
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
			s3.putObject bucket, up
		}
	}
	
	void putXML(text, name, uid) {
		String mime = mimeExtensionMap["xml"];
		S3Bucket bucket = makeBucket(uid)
		S3Object up = new S3Object(bucket, name, text)
		up.setAcl AccessControlList.REST_CANNED_PUBLIC_READ
		up.setContentLength text.length()
		up.setContentType mime
		s3.putObject bucket, up
	}
}

