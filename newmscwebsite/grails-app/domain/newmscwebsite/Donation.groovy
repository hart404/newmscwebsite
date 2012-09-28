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
	boolean tributeDonation
	String Name
	String recipientEmail
	String tributeSubject
	String tributeBody
	SCMSPhoto SelectedECard
	Date dateCreated

}
