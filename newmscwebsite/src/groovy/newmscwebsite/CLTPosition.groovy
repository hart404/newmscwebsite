package newmscwebsite

public enum CLTPosition {
	CHAIR, HIKE, IT, COMMUNITY_RELATIONS, RESEARCH, CONSTRUCTION_AND_MAINTENANCE,
	NATURE_GUIDES, FUNDRAISING, VOLUNTEER_SUPPORT, PATROL, PATHFINDERS, 
	STEWARD_EDUCATION, ASSISTANT, BIKE_PATROL, PARTNERSHIP_DEVELOPMENT
	
	def titles = ["CLT Chair", "Hike", "IT", "Community Relations", "Research", 
		"Construction and Maintenance", "Nature Guides", "Fundraising",
		"Volunteer Support", "Patrol", "Pathfinders", "Steward Education", "Assistant", "Bike Patrol", "Fundraising"]
	
	String toString() {
		titles[this.ordinal()]
	}

}
