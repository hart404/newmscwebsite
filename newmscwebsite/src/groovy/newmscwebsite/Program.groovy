package newmscwebsite

public enum Program {
	PATROL, NATURE_GUIDES, PATHFINDERS, BOARD, CORE_LEADERSHIP_TEAM, PARTNERSHIP_DEVELOPMENT, 
	COMMUNITY_RELATIONS, STEWARD_EDUCATION, CONSTRUCTION_AND_MAINTENANCE, HIKE, RESEARCH_FIELD_ANALYSIS, 
	MSC_CHALLENGE, VOLUNTEER_SUPPORT, RESEARCH_PROGRAM_SUPPORT, BIKE_PATROL
	
	def titles = ["Patrol", "Nature Guides", "Pathfinders", "Board", "Core Leadership Team", "Fundraising", 
		"Community Relations", "Steward Education", "Construction and Maintenance", "Hike", "Research - Field Analysis", 
		"MSC Challenge", "Volunteer Support", "Research Program - Support", "Bike Patrol"]
	
	def title() {
		titles[this.ordinal()]
	}
}
