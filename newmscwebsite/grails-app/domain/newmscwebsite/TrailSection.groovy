package newmscwebsite

class TrailSection {
        GeographicCoordinates pinLocation
        String pinName
        String notes
        
        static embedded = ['pinLocation']
		
		static constraints = {
			notes(nullable: true) 
		}
}
