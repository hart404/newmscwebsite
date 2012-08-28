package newmscwebsite

import org.joda.time.LocalDate

import simple.cms.SCMSPhoto

class NewsItem {
	String title
	String summary
	String moreInformation
	SCMSPhoto photo
	boolean important = false
	Date dateCreated
	Date lastUpdated
	LocalDate displayStartDate
	LocalDate displayEndDate

    static constraints = {
		title(blank: false, nullable: false, size: 1..100)
		summary(blank: false, nullable: false, size: 1..1000)
		moreInformation(blank: false, nullable: false, size: 1..10000)
		important(nullable: false)
		photo(nullable: true)
		displayStartDate(nullable: false)
		displayEndDate(nullable: false)
    }
	
	public String toString() {
		return "${title}: ${summary}"
	}
}
