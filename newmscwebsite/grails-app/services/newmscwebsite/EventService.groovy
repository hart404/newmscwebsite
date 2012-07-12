package newmscwebsite

import org.joda.time.LocalDate

class EventService {

	def findAll() {
		Event.findAll()
	}

	def findAllInDateList(List<LocalDate> dateList) {
		def criteria = Event.createCriteria()
		criteria {
			'in'("startDate", dateList)
			order("startDate", "asc")
		}
	}

	def findAllAfterToday() {
		def today = new LocalDate()
		def criteria = Event.createCriteria()
		criteria {
			ge("startDate", today)
			order("startDate", "asc")
		}
	}
	
	def findAllInDateRange(dateRange) {
		def criteria = Event.createCriteria()
		criteria {
			'in'("startDate", dateRange)
			order("startDate", "asc")
		}
	}
}
