package newmscwebsite

import org.codehaus.groovy.grails.commons.GrailsApplication
import org.joda.time.DateTime
import org.joda.time.LocalDate

class DateGenerator {
	
	GrailsApplication grailsApplication
	def eventService
	
	// Always set to the first day of the month
	Date target
	
	public DateGenerator(eventService) {
		this.eventService = eventService
		target = new Date()
		target = new Date(target.year, target.month, 1)
	}
	
	public DateGenerator(int month, int year, eventService) {
		this.eventService = eventService
		// month is 1..12
		target = new Date(year - 1900, month - 1, 1)
	}
	
	int getYear() {
		target.year + 1900
	}
	
	String getMonthName() {
		target.format('MMMMMMMMMM')
	}
	
	int getMonthNumber() {
		target.getMonth() + 1
	}
	
	int getDaysToDisplayInPreviousMonth() {
		target.getDay()
	}
	
	int getDaysToDisplayInNextMonth() {
		def daysInCurrentMonthOnLastRow = (getDaysToDisplayInPreviousMonth() + getDaysInMonth()) % 7 
		daysInCurrentMonthOnLastRow ? 7 - daysInCurrentMonthOnLastRow : 0
	}
	
	int getTotalNumberOfDaysToDisplay() {
		getDaysToDisplayInPreviousMonth() + getDaysInMonth() + getDaysToDisplayInNextMonth()
	}
	
	int getNumberOfWeeksToDisplay() {
		getTotalNumberOfDaysToDisplay() / 7 as int
	}
	
	int getDaysInMonth() {
		new GregorianCalendar(getYear(), target.month, 1).getActualMaximum(Calendar.DAY_OF_MONTH)
	}
	
	List getCalendarRows() {
		def dateEvents = getDateEvents()
		if (getDaysToDisplayInPreviousMonth() != 0) {
			dateEvents[0..getDaysToDisplayInPreviousMonth() - 1]*.previousMonth = true
		}
		if (getDaysToDisplayInNextMonth() != 0) {
			dateEvents[0 - getDaysToDisplayInNextMonth()..-1]*.nextMonth = true
		}
		def rows = []
		for (int startIndex = 0; startIndex < getTotalNumberOfDaysToDisplay(); startIndex += 7) {
			rows.add(dateEvents[startIndex..startIndex + 6])
		} 
		rows
	}
	
	List getDateEvents() {
		def dateRange = new LocalDate(target - getDaysToDisplayInPreviousMonth()).. new LocalDate((target + getDaysInMonth() + (getDaysToDisplayInNextMonth() - 1)))
		def events = eventService.findAllInDateRange(dateRange)
		def dateMap = [:]
		for (date in dateRange) {
			dateMap[date] = new DateEventWrapper(date: date, day: date.dayOfMonth, hasEvents: false)
		}
		for (Event event in events) {
			dateMap[event.startDate].hasEvents = true
		}
		dateMap.values() as List
	}

}
