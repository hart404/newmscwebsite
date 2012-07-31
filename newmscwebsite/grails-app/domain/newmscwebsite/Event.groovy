package newmscwebsite

import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter


class Event {
	String title
	String shortDescription
	String moreInformation
	DateTime startTime
	DateTime endTime
	LocalDate startDate
	Date dateCreated
	Date lastUpdated
	// Priority of 1 means event will be displayed on home page
	int eventPriority = 10
	Trailhead location
	Photo mainPhoto
	
	static transients = ['calendarIcon']
	
	List<Category> categories = []
	List<Person> attendees = []
	List<Photo> photos
	List<Photo> additionalPhotos = []
	static hasMany = [
		categories: Category, 
		attendees: Person, 
		photos: Photo,
		additionalPhotos: Photo
	]
	
    static constraints = {
		title(blank: false, nullable: false)
		shortDescription(blank: true, size: 1..500)
		moreInformation(blank: true, nullable: true, size: 1..2000)
		location(nullable: true)
		startTime(nullable: false)
		startDate(nullable: true)
		endTime(nullable: true)
		location(nullable: true)
		eventPriority(range: 1..10)
		dateCreated(display: false)
		lastUpdated(display: false)
		mainPhoto(nullable:true)
    }
	
	public String formattedStartTime() {
		DateTimeFormatter formatter = DateTimeFormat.forPattern("MMMMM dd, yyyy h:mm aa")
		formatter.print(startTime)
	}
	
	public String formattedDateOnly() {
		DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy")
		formatter.print(startTime)
	}
	
	public String formattedTimeOnly() {
		DateTimeFormatter formatter = DateTimeFormat.forPattern("hh:mmaa")
		formatter.print(startTime)
	}
	
	public String toString() {
		"${title} ${formattedStartTime()}"
	}
	
	def beforeInsert = {
		startDate = new LocalDate(startTime)
	}
	
	def beforeUpdate = {
		startDate = new LocalDate(startTime)
	}
	
}
