package newmscwebsite

class NewsItem {
	String title
	String summary
	String moreInformation
	URL photo
	boolean important = false
	Date dateCreated
	Date lastUpdated

    static constraints = {
		title(blank: false, nullable: false, size: 1..100)
		summary(blank: false, nullable: false, size: 1..1000)
		moreInformation(blank: false, nullable: false, size: 1..10000)
		important(nullable: false)
		photo(nullable: true)
    }
	
	public String toString() {
		return "${title}: ${summary}"
	}
}
