package newmscwebsite
import org.joda.time.LocalDate
import org.joda.time.LocalTime


class VolunteerSession {
	BigDecimal hours = 0
    LocalDate date
	String program
	Date dateCreated
	Date lastUpdated
	Person person
	
	List<TrailSection> trailSections
	static hasMany = [
		trailsSections: TrailSection	
	]

    static constraints = {
		trailSections(size: 0..100)
        hours(nullable: false)
        date(nullable: false)
        program(nullable: false)
		person(nullable: false)
    }
}
