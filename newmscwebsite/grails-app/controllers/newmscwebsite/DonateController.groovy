package newmscwebsite

import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

import simple.cms.SCMSPhoto

import com.vinomis.authnet.AuthorizeNet

class DonateController {
	
	def donateService

    def index = { }

	def mainDonate = {
		[donation: new Donation(), eCards: SCMSPhoto.findAllByDescription("eCard")]
	}
	
	def takeDonation() {
		println params
		/*
		def jsonObj = JSON.parse(params.data)
		String donateOption = jsonObj.donateOption
		println ":::::::::::::::::::::::::::::::::::::::::"+donateOption
		String date = jsonObj.month.toString()+jsonObj.year.toString().substring(2)
		DateFormat dfDate = new SimpleDateFormat("MM-dd-yyyy");
		def currentdate = dfDate.format(new Date());
		java.util.Date parsedUtilDate = dfDate.parse(currentdate);
		java.sql.Timestamp from_d= new java.sql.Timestamp(parsedUtilDate.getTime());
		println date

		def s = new AuthorizeNet()
		//NOTE: If you need to override the login and transaction keys from the configuration, you can do it here:
		//                 s.login = '6pKhTc8S9PC'
		//         s.transactionKey = '8W3jsZ8U8k7b3ZhY'
		s.authorizeAndCapture {
			description jsonObj.description.toString()
			firstName jsonObj.firstName.toString()
			lastName jsonObj.lastName.toString()
			address jsonObj.address.toString()
			city jsonObj.city.toString()
			state jsonObj.state.toString()
			amount jsonObj.amount.toString()
			zip jsonObj.zip.toString()
			phone jsonObj.phone.toString()
			country jsonObj.country.toString()
			ccNumber jsonObj.cardnumber.toString()
			cvv jsonObj.cvc.toString()
			ccExpDate date.toString()
			email jsonObj.email.toString()
		}
		def anr = s.submit()

		println "ANR: ${anr}"
		println "Response Reason Code: ${anr.responseReasonCode}"

		boolean recuringType
		if (jsonObj.recuringType == "One-time") {
			recuringType = false
		} else {
			recuringType = true
		}
		
		println "Recurring type: ${recuringType}"

		if (anr.responseReasonText.contains("This transaction has been approved.")) {
			println "SUCCESS"
			def donateinst
			if (donateOption == "all") {
				donateinst = new Donation(firstName:jsonObj.firstName,lastName:jsonObj.lastName,email:jsonObj.email,city:jsonObj.city,state:jsonObj.state,
				zip:jsonObj.zip,recurring:recuringType,recurringDate:from_d,country:jsonObj.country,
				phone:jsonObj.phone,actualDonationAmount:Double.parseDouble(jsonObj.amount.toString()),tributeDonation:true,
				street:jsonObj.address,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")
			} else if (donateOption == "ne"){
				donateinst = new Donation(firstName:jsonObj.firstName,lastName:jsonObj.lastName,email:jsonObj.email,recurring:recuringType,recurringDate:from_d,
				actualDonationAmount:Double.parseDouble(jsonObj.amount.toString()),tributeDonation:true,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")
			} else if (donateOption == "no"){
				donateinst = new Donation(recurring:recuringType,recurringDate:from_d,
				actualDonationAmount:Double.parseDouble(jsonObj.amount.toString()),tributeDonation:true,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")
			}
			if (donateinst.save(flush:true)) {
				flash.message = "This transaction has been approved."
				//                                redirect(controller:"home" ,action: "index")
			} else {
				//                         redirect(controller:"home" ,action: "index")
			}
			render donateService.processDonation(jsonObj.cardnumber,jsonObj.month,jsonObj.year)
		} else {
			println "FAIL"
			flash.message = anr.responseReasonText
			println flash.message
			render flash.message
		}
		*/

		redirect(action: "thankYouForYourDonation")
	}
	
	def thankYouForYourDonation() {
		
	}
}
