package newmscwebsite

import simple.cms.SCMSPhoto;
import groovy.transform.InheritConstructors


class Person extends SecUser {
	String firstName
	String middleInitial
	String lastName
	StreetAddress address
	Phone homePhone
	Phone cellPhone
	String tshirtSize
	String emergencyContact
	String emergencyRelationship
	String emergencyPhone
	SCMSPhoto photo
	boolean masterSteward = false
	boolean leadSteward = false
	CLTPosition position
	String classNumber
	boolean wantsWeeklyEmail
	Boolean hasStewardRole = false
	Date dateOfBirth
	Person mentor
	boolean stewardInTraining = false
	Date graduationDate
	
	static embedded = ['address', 'homePhone', 'cellPhone']
	
	static hasMany = [
		volunteerSessions: VolunteerSession,
		interests: Interest
	]

	static constraints = {
		firstName(nullable: false, size: 1..30)
		middleInitial(nullable: true, size: 1..4)
		lastName(nullable: false, size: 1..50)
		address(nullable: true)		
		homePhone(nullable: true)
		cellPhone(nullable: true)
		photo(nullable: true)
		tshirtSize(inList: ["Y", "S", "M", "L", "XL", "XXL"], nullable: true)
		position(nullable: true)
		classNumber(nullable: true)
		emergencyContact(nullable: true)
		emergencyPhone(nullable: true)
		emergencyRelationship(nullable: true)
		hasStewardRole(nullable: false)
		dateOfBirth(nullable: true)
		volunteerSessions(size: 0..100000)
		mentor(nullable: true)
		leadSteward(nullable: true)
		interests(nullable: true)
		graduationDate(nullable: true)
		stewardInTraining(nullable: true)
	}
	
	static mapping = {
		sort lastName: "asc"
		photo cascade: "all"
	}
	
	public String toString() {
		firstName + " " + lastName
	}
	
	def leadershipPosition() {
		def leadershipPosition = null
		if (hasAuthority("ROLE_BOARD")) {
			leadershipPosition = "Director"
		}
		if (position) {
			if (leadershipPosition) {
				leadershipPosition += "/" + position
			} else {
				leadershipPosition = position
			}
		}
		leadershipPosition
	}
	
	def hasInterest(String interestName) {
		if (!interests) return false
		interests.contains(Interest.fromString(interestName))
	}
	
}
