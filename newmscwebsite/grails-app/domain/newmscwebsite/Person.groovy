package newmscwebsite

import groovy.transform.InheritConstructors


class Person extends SecUser {
	String firstName
	String lastName
	StreetAddress address
	String email
	Phone homePhone
	Phone cellPhone
	
	static embedded = ['address', 'homePhone', 'cellPhone']

	static constraints = {
		homePhone(nullable: true)
		cellPhone(nullable: true)
	}
}
