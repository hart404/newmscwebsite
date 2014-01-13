package newmscwebsite

public enum ProgramReporting {
	PATROL_BIKE("Patrol - Bike"), PATROL_FOOT("Patrol - Foot"), PATROL_HORSE("Patrol - Horse"), 
	STEWARD_EDUCATION("Steward Education Program"), HIKE("Hike Program"), 
	BOARD("Board of Directors"), CITIZEN_SCIENCE("Citizen Science"),
	VOLUNTEER_SUPPORT("Volunteer Support Program"), TOUR_DE_SCOTTSDALE("Tour de Scottsdale"), 
	CORE_LEADERSHIP_TEAM("Core Leadership Team"), 
	CONSTRUCTION_AND_MAINTENANCE("Construction/Maintenance Program"), OFFICE_AND_WEB_WORK("Office and Web Work"), 
	PATHFINDERS("Pathfinder Program"), NATURE_GUIDES("Nature Guide Program"),  
	FUNDRAISING("Fundraising Program"), COMMUNITY_RELATIONS("Community Relations Program")

	private final String value
	
	ProgramReporting(String value) {
		this.value = value
	}
	
	String value() {
		value
	}
	
	String representation() {
		value
	}
}
