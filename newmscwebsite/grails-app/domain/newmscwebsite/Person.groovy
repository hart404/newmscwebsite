package newmscwebsite

import groovy.transform.InheritConstructors

@InheritConstructors
class Person extends SecUser {
	String firstName
	String lastName
	StreetAddress address
	String email

	static constraints = {
	}
}
