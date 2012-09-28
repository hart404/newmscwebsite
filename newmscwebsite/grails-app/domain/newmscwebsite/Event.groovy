package newmscwebsite

import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter

import simple.cms.SCMSPhoto


class Event {
	String title
	String shortDescription
	String moreInformation
	DateTime startTime
	DateTime endTime
	LocalDate startDate
	Date dateCreated
	Date lastUpdated
	boolean showOnHomePage = false
	Trailhead location
	SCMSPhoto mainPhoto
	boolean stewardOnly = false;
	String otherLocation = ""
	String stewardOnlyInformation
	
	static transients = ['calendarIcon']
	
	List<Category> categories = []
	List<Person> attendees = []
	List<SCMSPhoto> photos
	List<SCMSPhoto> additionalPhotos = []
	static hasMany = [
		categories: Category, 
		attendees: Person, 
		photos: SCMSPhoto,
		additionalPhotos: SCMSPhoto
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
		dateCreated(display: false)
		lastUpdated(display: false)
		mainPhoto(nullable: true)
		otherLocation(nullable: true)
		categories validator: { list ->
			if (list.isEmpty()) return false
		}
		stewardOnlyInformation(nullable: true, size: 0..2000)
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
	
	def formattedCategories() {
		if (categories?.isEmpty()) {
			return "No categories selected for this event"
		} else {
			def result = ""
			categories.each { category ->
				result += category.formatted()
				result += ", "
			}
			return result [0..-3]
		}
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
	
	boolean isFamily() {
		categories.contains(Category.FAMILY)
	}
	
	boolean isHike() {
		categories.contains(Category.HIKE)
	}
	
	boolean isFitness() {
		categories.contains(Category.FITNESS)
	}
	
	boolean isClassOrLecture() {
		categories.contains(Category.CLASS_OR_LECTURE)
	}
	
	boolean isSpecialEvent() {
		categories.contains(Category.SPECIAL_EVENT)
	}
	
	boolean isVolunteerEvent() {
		categories.contains(Category.VOLUNTEER_EVENT)
	}
	
}
