package newmscwebsite;

public enum Category {
	FAMILY, FITNESS, HIKE, CLASS_OR_LECTURE, SPECIAL_EVENT, VOLUNTEER_EVENT 
	
	static Category fromString(String categoryString) {
		switch(categoryString.toLowerCase()) {
			case "family":
				return FAMILY
			case "fitness":
				return FITNESS
			case "hike":
				return HIKE
			case "classorlecture":
				return CLASS_OR_LECTURE
			case "specialevent":
				return SPECIAL_EVENT
			case "volunteerevent":
				return VOLUNTEER_EVENT
			default:
				return null
		}
	}
	
	def formatted() {
		switch(this) {
			case FAMILY:
				return "Family"
			case FITNESS:
				return "Fitness"
			case HIKE:
				return "Hike"
			case CLASS_OR_LECTURE:
				return "Class/Lecture"
			case SPECIAL_EVENT:
				return "Special Event"
			case VOLUNTEER_EVENT:
				return "Volunteer Event"
		}
	}
}
