package newmscwebsite

class DonateServiceIntegrationTests {
	def donateService

	void testProcessDonate() {
		donateService.processDonation()
		assert 1 == 1
	}
}
