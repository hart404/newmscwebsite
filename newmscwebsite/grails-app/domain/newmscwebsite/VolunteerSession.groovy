package newmscwebsite
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class VolunteerSession {
	BigDecimal hours = 0
    LocalDate date
	Integer time
	String program
	Person person
	
	List<TrailSection> trailSections
	static hasMany = [
		trailsSections: TrailSection	
	]

    static constraints = {
				trailSections(size: 0..100)
                hours(nullable: false)
                date(nullable: false)
                time(nullable: false)
                program(nullable: false)
    }
}
