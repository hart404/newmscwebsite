package newmscwebsite

class StreetAddress {
	String street
	String apartment
	String city = "Scottsdale"
	String state = "AZ"
	String zip

    static constraints = {
		street(blank: true)
		apartment(blank: true)
		city(blank: true)
		state(blank: true)
		zip(blank: true)
    }
	
}
