package newmscwebsite

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.joda.time.LocalDate

class EventService {
	
	def springSecurityService

	def findAll() {
		Event.findAll()
	}

	def findAllInDateList(List<LocalDate> dateList) {
		if (dateList.isEmpty()) return findAllAfterToday()
		def criteria = Event.createCriteria()
		criteria {
			'in'("startDate", dateList)
			order("startDate", "asc")
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
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
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
		}
	}
	
	def findAllAfterToday() {
		def today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria {
			ge("startDate", today)
			order("startDate", "asc")
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
		}
	}

	def countAllAfterToday() {
		def today = LocalDate.now()
		def criteria = Event.createCriteria()
		criteria.count {
			ge("startDate", today)
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
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
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
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
			if (!SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
				eq("stewardOnly", false)
			}
			order("startDate", "asc")
		}
	}
	
	def stewardOnlyEvents(params) {
		LocalDate today = LocalDate.now()
		if (SpringSecurityUtils.ifNotGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
			// Return empty list of no access allowed
			return []
		}
		def criteria = Event.createCriteria()
		criteria {
			and {
				ge("startDate", today)
				or {
					eq("stewardOnly", true)
					isNotNull("stewardOnlyInformation")
				}
			}
			maxResults(params.max)
			firstResult(params.offset)
			order("startDate", "asc")
		}
	}
	
	def countStewardOnlyEvents() {
		LocalDate today = LocalDate.now()
		if (SpringSecurityUtils.ifNotGranted("ROLE_WEB,ROLE_ADMIN,ROLE_STEWARD")) {
			return 0
		}
		def criteria = Event.createCriteria()
		criteria.count {
			and {
				ge("startDate", today)
				or {
					eq("stewardOnly", true)
					isNotNull("stewardOnlyInformation")
				}
			}
		}
	}
}
