package newmscwebsite

class TrailSection {
        GeographicCoordinates pinLocation
        String pinName
        String notes
		String description
		Boolean enabled
		String iconURL
        
        static embedded = ['pinLocation']
		
		static constraints = {
			notes(nullable: true) 
			iconURL(nullable: true)
		}
}
