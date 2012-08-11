package newmscwebsite

import simple.cms.SCMSPhoto



class Steward extends Person {
	String tshirtSize
	String emergencyContact
	String emergencyRelationship
	String emergencyPhone
	SCMSPhoto photoLocation
	boolean masterSteward = false
	String CLTPosition = ""
	int classNumber

    static constraints = {
		tshirtSize(inList: ["Y", "S", "M", "L", "XL", "XXL"])
    }
}
