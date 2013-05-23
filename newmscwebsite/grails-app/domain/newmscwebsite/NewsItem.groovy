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
	String descriptionMetadata
	String keywordsMetadata
	String authorName
	String blogURL

    static constraints = {
		title(blank: false, nullable: false, size: 1..100)
		summary(blank: false, nullable: false, size: 1..1000)
		moreInformation(blank: false, nullable: false, size: 1..10000)
		important(nullable: false)
		photo(nullable: true)
		displayStartDate(nullable: false)
		displayEndDate(nullable: false)
		descriptionMetadata(nullable: true, size: 0..156)
		keywordsMetadata(nullable: true, size: 0..2048)
		authorName(nullable: true, size: 0..100)
		blogURL(nullable: true, size: 0..100)
    }
	
	public String toString() {
		return "${title}: ${summary}"
	}
}
