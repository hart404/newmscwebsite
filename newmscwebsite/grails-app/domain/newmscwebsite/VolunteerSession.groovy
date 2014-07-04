package newmscwebsite
import org.joda.time.LocalDate
import org.mcdowellsonoran.trailreporting.TrailReport


class VolunteerSession {
	BigDecimal hours = 0
    LocalDate date
	String program
	Date dateCreated
	Date lastUpdated
	Person person
	
	List<TrailReport> trailReports
	static hasMany = [
		trailReports: TrailReport	
	]

    static constraints = {
		trailReports(size: 0..100)
        hours(nullable: false)
        date(nullable: false)
        program(nullable: false)
		person(nullable: false)
    }
}
