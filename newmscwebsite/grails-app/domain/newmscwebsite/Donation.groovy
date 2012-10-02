package newmscwebsite

import simple.cms.SCMSPhoto

class Donation {
	
	String title
	String firstName
	String lastName
	String street
	String apartment
	String city
	String state
	String zip
	boolean recurring = false
	Date recurringDate
	String country
	String phone
	BigDecimal donationAmount
	// Note that no credit card information is stored
	boolean tributeDonation = false
	String recipientName
	String recipientEmail
	String tributeSubject
	String tributeBody
	SCMSPhoto selectedECard
	Date dateCreated
	
	static constraints = {
		title(nullable: true)
		firstName(nullable: false, blank: false)
		lastName(nullable: false, blank: false)
		street(nullable: false, blank: false)
		apartment(nullable: true)
		city(nullable: false, blank: false)
		state(nullable: false, blank: false)
		country(nullable: false, blank: false)
		phone(nullable: false, blank: false)
		recipientName(nullable: true)
		recipientEmail(nullable: true)
		tributeSubject(nullable: true)
		tributeBody(nullable: true)
		selectedECard(nullable: true)
	}

}
