package newmscwebsite

import org.joda.time.LocalDate

class AdSpacePhoto {
	
	String title
	String description
	LocalDate displayStartDate = LocalDate.now()
	LocalDate displayEndDate = new LocalDate(2050, 12, 31)
	Photo photo
	String link
	
	static constraints = {
		title(blank: false)
		description(nullable: true)
		photo(nullable: false)
		displayStartDate(nullable: false)
		displayEndDate(nullable: false)
		link(nullable: false)
	}

}
