package newmscwebsite

import simple.cms.SCMSPhoto

class DonateController {
	
	def donateService

    def index = { }

	def mainDonate = {
		[donation: new Donation(), eCards: SCMSPhoto.findAllByDescription("eCard")]
	}
	
	def takeDonation() {
		println params
		redirect(action: "thankYouForYourDonation")
	}
	
	def thankYouForYourDonation() {
		
	}
}
