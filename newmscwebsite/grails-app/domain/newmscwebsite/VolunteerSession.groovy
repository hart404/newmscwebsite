package newmscwebsite
import org.joda.time.LocalDate
import org.joda.time.LocalTime

class VolunteerSession {
	BigDecimal hours
	LocalDate date
	LocalTime time
	List<TrailSection> trailSections
	Program program

    static constraints = {
		trailSections(size: 0..100)
    }
}
