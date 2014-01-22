package newmscwebsite

public enum ProgramReporting {
	PATROL_FOOT("Patrol - Foot"), 
	PATROL_BIKE("Patrol - Bike"), 
	PATROL_HORSE("Patrol - Horse"), 
	PATHFINDERS("Pathfinder Program"), 
	CONSTRUCTION_AND_MAINTENANCE("Construction/Maintenance Program"), 
	HIKE("Hike Program"), 
	STEWARD_EDUCATION("Steward Education Program"), 
	CITIZEN_SCIENCE("Citizen Science"),
	COMMUNITY_RELATIONS("Community Relations Program"),
	FUNDRAISING("Fundraising Program"), 
	NATURE_GUIDES("Nature Guide Program"),  
	VOLUNTEER_SUPPORT("Volunteer Support Program"), 
	CORE_LEADERSHIP_TEAM("Core Leadership Team"), 
	OFFICE_AND_WEB_WORK("Office and Web Work"), 
	BOARD("Board of Directors"), 
	TOUR_DE_SCOTTSDALE("Tour de Scottsdale"), 
	PRE2010("Pre 2010", false)

	private final String value
	private final Boolean show
	
	ProgramReporting(String value) {
		this.value = value
		this.show = true
	}
	
	ProgramReporting(String value, Boolean show) {
		this.value = value
		this.show = show
	}
	
	String value() {
		value
	}
	
	Boolean isShowable() {
		show
	}
	
	String representation() {
		value
	}
}
