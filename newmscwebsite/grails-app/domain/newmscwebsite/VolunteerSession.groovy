package newmscwebsite
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class VolunteerSession {
	BigDecimal hours
	LocalDate date
	LocalTime time
	Program program
	
	List<TrailSection> trailSections
	static hasMany = [
		trailsSections: TrailSection	
	]

    static constraints = {
		trailSections(size: 0..100)
    }
}
