package newmscwebsite

import net.authorize.Environment
import net.authorize.Merchant

class DonateController {
	
	def donateService

    def index = { }
	
	def newIndex = {}
	
	def takeDonation() {
		[donation: new Donation()]
	}
}
