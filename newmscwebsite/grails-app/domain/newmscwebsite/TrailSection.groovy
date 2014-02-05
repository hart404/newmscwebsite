package newmscwebsite

import org.joda.time.LocalDate

class TrailSection {
        GeographicCoordinates pinLocation
        String pinName
		String trailName
        String notes
		String description
		String color
		Boolean enabled = true
		Boolean usedForReporting = true
		String iconURL
		Integer anchorX = 0
		Integer anchorY = 0
		Boolean northPins = false
		Boolean southPins = false
		LocalDate lastPatrolled
		Date dateCreated
		Date lastUpdated
		PatrolFrequency frequency
        
        static embedded = ['pinLocation']
		
		static constraints = {
			pinName(nullable: false)
			trailName(nullable: false)
			notes(nullable: true) 
			description(nullable: true)
			color(nullable: true)
			enabled(nullable: false)
			usedForReporting(nullable: false)
			anchorX(range: -200..200)
			anchorY(range: -200..200)
			iconURL(nullable: true)
			lastPatrolled(nullable: true)
			frequency(nullable: true)
		}
}
