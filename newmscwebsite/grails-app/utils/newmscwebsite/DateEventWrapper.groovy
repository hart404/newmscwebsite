package newmscwebsite

import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter

class DateEventWrapper {
	LocalDate date
	int day
	boolean hasEvents = false
	boolean previousMonth = false
	boolean nextMonth = false

	void setToHasEvents() {
		hasEvents = true
	}
	
	String getTagID() {
		// Generate a unique tag id for JavsScript integration.
		// Will generate MMdd which is sufficient for a monthly calendar
		// that will potentially show some of the previous and next months dates
		DateTimeFormatter formatter = DateTimeFormat.forPattern("MMdd")
		formatter.print(date)
	}
	
	String getStyle() {
		if (previousMonth) return "previousMonth" + (hasEvents ? "HasEvents" : "")
		if (nextMonth) return "nextMonth" + (hasEvents ? "HasEvents" : "")
		"currentMonth" + (hasEvents ? "HasEvents" : "")
	}

	String getFormattedDate() {
		DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy")
		formatter.print(date)
	} 

	String toString() {
		"${getFormattedDate()} ${hasEvents ? 'Yes' : 'No'} ${previousMonth ? 'Previous' : 'Current'} ${nextMonth ? 'Next' : 'Current'}"
	}
}
