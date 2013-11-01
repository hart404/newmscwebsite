package newmscwebsite
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class VolunteerSession {
        Integer version = 0
	BigDecimal hours
        LocalDate date
	Integer time
	String program
	
//	List<TrailSection> trailSections
//	static hasMany = [
//		trailsSections: TrailSection	
//	]

    static constraints = {
//		trailSections(size: 0..100)
                version(nullable: false)
                hours(nullable: false)
                date(nullable: false)
                time(nullable: false)
                program(nullable: false)
    }
}
