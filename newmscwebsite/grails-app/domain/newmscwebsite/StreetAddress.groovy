package newmscwebsite

import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class StreetAddress {
	String street
	String apartment = " "
	String city = "Scottsdale"
	String state = "AZ"
	String zip

    static constraints = {
		street(blank: true)
		apartment(nullable: true)
		city(blank: true)
		state(blank: true)
		zip(blank: true)
    }
	
	String toString() {
		StringBuffer buffer = new StringBuffer()
		if (street) {
			buffer.append(street)
			buffer.append(", ")
		}
		if (apartment) {
			buffer.append(apartment)
			buffer.append(", ")
		}
		if (city) {
			buffer.append(city)
			buffer.append(", ")
		}
		if (state) {
			buffer.append(state)
			buffer.append(", ")
		}
		if (zip) {
			buffer.append(zip)
		}
		buffer.toString()
	}
	
}
