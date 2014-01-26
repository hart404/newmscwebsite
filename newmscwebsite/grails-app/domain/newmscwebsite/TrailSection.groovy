package newmscwebsite

class TrailSection {
        GeographicCoordinates pinLocation
        String pinName
        String notes
		String description
		Boolean enabled = true
		Boolean usedForReporting = true
		String iconURL
		Integer anchorX = 0
		Integer anchorY = 0
        
        static embedded = ['pinLocation']
		
		static constraints = {
			pinName(nullable: false)
			notes(nullable: true) 
			description(nullable: true)
			enabled(nullable: false)
			usedForReporting(nullable: false)
			anchorX(range: -200..200)
			anchorY(range: -200..200)
			iconURL(nullable: true)
		}
}
