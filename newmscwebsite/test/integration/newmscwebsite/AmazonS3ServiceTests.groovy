package newmscwebsite

class AmazonS3ServiceTests {
	
	def amazonS3Service

	void testCreation() {
		assert AmazonS3Service.s3 != null
	}
}
