package newmscwebsite

import groovy.transform.InheritConstructors



class Steward extends Person {
	String tshirtSize
	String emergencyContact
	String emergencyRelationship
	String emergencyPhone
	Photo photoLocation
	boolean masterSteward = false
	String CLTPosition = ""
	int classNumber

    static constraints = {
		tshirtSize(inList: ["Y", "S", "M", "L", "XL", "XXL"])
    }
}
