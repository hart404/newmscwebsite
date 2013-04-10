package newmscwebsite

public enum Interest {
	BIKE_PATROL, COMMUNITY_RELATIONS, CONSTRUCTION_AND_MAINTENANCE, HIKE, 
	NATURE_GUIDES, INFORMATION_TECHNOLOGY, PARTNERSHIP_DEVELOPMENT, 
	PATHFINDERS, PATROL, RESEARCH, STEWARD_EDUCATION,  
	VOLUNTEER_SUPPORT
	
	static Map<String, Interest> interestMap = [
		bikePatrol: BIKE_PATROL,
		communityRelations: COMMUNITY_RELATIONS,
		constructionAndMaintenance: CONSTRUCTION_AND_MAINTENANCE,
		hike: HIKE,
		natureGuides: NATURE_GUIDES,
		informationTechnology: INFORMATION_TECHNOLOGY,
		partnershipDevelopment: PARTNERSHIP_DEVELOPMENT,
		pathfinders: PATHFINDERS,
		patrol: PATROL,
		research: RESEARCH,
		stewardEducation: STEWARD_EDUCATION,
		volunteerSupport: VOLUNTEER_SUPPORT
	]
	
	static Interest fromString(String interestString) {
		switch(interestString.toLowerCase()) {
			case "bikepatrol":
				return BIKE_PATROL
			case "communityrelations":
				return COMMUNITY_RELATIONS
			case "constructionandmaintenance":
				return CONSTRUCTION_AND_MAINTENANCE
			case "hike":
				return HIKE
			case "natureguides":
				return NATURE_GUIDES
			case "informationtechnology":
				return INFORMATION_TECHNOLOGY
			case "partnershipdevelopment":
				return PARTNERSHIP_DEVELOPMENT
			case "pathfinders":
				return PATHFINDERS
			case "patrol":
				return PATROL
			case "research":
				return RESEARCH
			case "stewardeducation":
				return STEWARD_EDUCATION
			case "volunteersupport":
				return VOLUNTEER_SUPPORT
			default:
				return null
		}
	}
	

	def titles = [
		"Bike Patrol", "Community Relations", "Construction and Maintenance", "Hike", 
		"Nature Guides", "Information Technology", "Partnership Development", 
		"Pathfinders", "Patrol",  "Research", "Steward Education", 
		"Volunteer Support"
	]
	
	def title() {
		titles[this.ordinal()]
	}
}
