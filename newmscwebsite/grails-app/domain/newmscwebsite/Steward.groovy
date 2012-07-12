package newmscwebsite

import groovy.transform.InheritConstructors

@InheritConstructors
class Steward extends Person {
	String tshirtSize
	String emergencyContact
	String emergencyRelationship
	String emergencyPhone
	Photo photoLocation
	boolean isMasterSteward = false
	String cltPosition = ""
	int classNumber

    static constraints = {
		tshirtSize(inList: ["Y", "S", "M", "L", "XL", "XXL"])
    }
}
