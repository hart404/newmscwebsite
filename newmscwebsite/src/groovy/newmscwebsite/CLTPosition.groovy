package newmscwebsite

public enum CLTPosition {
	CHAIR, HIKE, IT, COMMUNITY_RELATIONS, RESEARCH, CONSTRUCTION_AND_MAINTENANCE,
	NATURE_GUIDES, PARTNERSHIP_DEVELOPMENT, VOLUNTEER_SUPPORT, PATROL, PATHFINDERS, 
	STEWARD_EDUCATION, ASSISTANT, BIKE_PATROL
	
	def titles = ["CLT Chair", "Hike", "IT", "Community Relations", "Research", 
		"Construction and Maintenance", "Nature Guides", "Partnership Development",
		"Volunteer Support", "Patrol", "Pathfinders", "Steward Education", "Assistant", "Bike Patrol"]
	
	String toString() {
		titles[this.ordinal()]
	}

}
