package newmscwebsite

import org.joda.time.LocalDate

class EventService {

	def findAll() {
		Event.findAll()
	}

	def findAllInDateList(List<LocalDate> dateList) {
		if (dateList.isEmpty()) return findAllAfterToday()
		def criteria = Event.createCriteria()
		criteria {
			'in'("startDate", dateList)
			order("startDate", "asc")
		}
	}

	def findAllInDateListAndCategories(List<LocalDate> dateList, categories) {
		def events = findAllInDateList(dateList)
		events = events.findAll { event -> !(event.categories.disjoint(categories))}
		events
	}

	def findAllAfterTodayInitial() {
		def today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria {
			ge("startDate", today)
			order("startDate", "asc")
			maxResults(5)
		}
	}
	
	def findAllAfterToday() {
		def today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria {
			ge("startDate", today)
			order("startDate", "asc")
		}
	}

	def countAllAfterToday() {
		def today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria.count {
			ge("startDate", today)
		}
	}
	
	def findAllAfterToday(categories) {
		def events = findAllAfterToday()
		events = events.findAll { event -> !(event.categories.disjoint(categories))}
		events
	}
	
	def findAllInDateRange(dateRange) {
		def criteria = Event.createCriteria()
		criteria {
			'in'("startDate", dateRange)
			order("startDate", "asc")
		}
	}
	
	def findEventsForHomePage() {
		LocalDate today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria {
			and {
				ge("startDate", today)
				eq("showOnHomePage", true)
			}
			order("startDate", "asc")
		}
	}
}
