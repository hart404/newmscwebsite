package newmscwebsite

import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

import simple.cms.SCMSPhoto

import com.vinomis.authnet.AuthorizeNet

class DonateController {

	def donateService
	def mailService

	def index = { }

	def mainDonate = {
		[donation: new Donation(), eCards: SCMSPhoto.findAllByDescription("eCard")]
	}

	def takeDonation() {
		println params

		def s = new AuthorizeNet()
		s.authorizeAndCapture {
			description params.description
			firstName params.firstName
			lastName params.lastName
			address params.street
			city params.city
			state params.state
			amount params.actualDonationAmount
			zip params.zip
			phone params.phone
			country params.country
			ccNumber params.cardNumber
			cvv params.ccv
			ccExpDate params.expirationMonth + params.expirationYear
			email params.email
		}
		def anr = s.submit()

		println "ANR: ${anr}"
		println "Response Reason Code: ${anr.responseReasonCode}"
		println "Response Reason Text: ${anr.responseReasonText}"
		// 4007000000027
		// Note that the actualDOnationAmount is now not being stored in the DB for security reasons
		if (anr.responseReasonText.contains("This transaction has been approved.")) {
			println "SUCCESS"
			def donation = new Donation(firstName: params.firstName, lastName: params.lastName,
			email: params.email, city: params.city, state: params.state,
			zip: params.zip, country: params.country,
			phone: params.phone, actualDonationAmount: 0 as Double,
			tributeDonation:true, street: params.street,
			transactionId: anr.transactionId,
			recipientName:"McDowell Sonoran Conservancy")
			if (donation.save(flush:true)) {
				flash.message = "This transaction has been approved."
			} else {
				donation.errors.allErrors.each { println it }
			}
			render "Thanks for your donation!"
		} else {
			println "FAIL"
			flash.message = "${anr.responseReasonText} code: ${anr.responseReasonCode}"
			render flash.message
		}

		if (params.tributeDonation) {
			sendTribute(params.firstName, params.lastName, params.email, params.eCardSelection, params.tributeBody, params.tributeSubject, params.recipientName, params.recipientEmail)
		}

		redirect(action: "thankYouForYourDonation")
	}

	def sendTribute(firstName, lastName, email, ecardSelection, tributeBody, tributeSubject, recipientName, recipientEmail) {
		List eCards = SCMSPhoto.findAllByDescription("eCard") as List
		def eCard = eCards[ecardSelection as Integer]
		mailService.sendMail {
			to recipientEmail
			from "donate@mcdowellsonoran.org"
			cc email
			subject tributeSubject
			body (
					view: "mailTemplate",
					model: [firstName: firstName, lastName: lastName, eCard: eCard, recipientName: recipientName, tributeBody: tributeBody]
					)
		}
	}

	def thankYouForYourDonation() {

	}
}
