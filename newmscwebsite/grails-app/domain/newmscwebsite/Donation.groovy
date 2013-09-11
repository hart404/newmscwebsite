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
	String recurringType
	Date recurringDate
	String country
	String phone
	BigDecimal actualDonationAmount
	// Note that no credit card information is stored
	boolean tributeDonation = false
	String recipientName
	String recipientEmail
	String tributeSubject
	String tributeBody
	SCMSPhoto selectedECard
	Date dateCreated
	String transactionId
	
	static constraints = {
		title(nullable: true)
		zip(nullable:true)
		firstName(nullable: true, blank: true)
		lastName(nullable: true, blank: true)
		street(nullable: true, blank: true)
		apartment(nullable: true)
		city(nullable: true, blank: true)
		state(nullable: true, blank: true)
		country(nullable: true, blank: true)
		phone(nullable: true, blank: true)
		recipientName(nullable: true)
		recipientEmail(nullable: true)
		tributeSubject(nullable: true)
		tributeBody(nullable: true)
		selectedECard(nullable: true)
		transactionId(nullable: true)
		recurringType(nullable: true)
	}

}
