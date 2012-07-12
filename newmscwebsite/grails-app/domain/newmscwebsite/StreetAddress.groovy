package newmscwebsite

class StreetAddress {
	String street
	String city = "Scottsdale"
	String state = "AZ"
	String zip

    static constraints = {
		street(size: 10..70)
		city(size: 4..30)
		state(size: 2..2)
		zip(size: 5..10)
    }
	
	String toString()
	{
		return "$street, $city, $state, $zip"
	}
}
