package newmscwebsite
import static java.util.Calendar.YEAR

import org.joda.time.LocalDate

class VolunteerSessionService {
	
	def totalHoursForSteward(steward) {
		VolunteerSession.executeQuery('select sum(hours) from VolunteerSession vs where vs.person = :steward', [steward: steward])
	}
	
	def totalHoursForStewardYearToDate(steward) {
		def today = new Date()
		def newYears = new LocalDate(today[YEAR], 1, 1)
		VolunteerSession.executeQuery('select sum(hours) from VolunteerSession vs where vs.person = :steward and vs.date >= :newYears', [steward: steward, newYears: newYears])
	}
	
	def totalHoursForStewardByProgram(steward) {
		def criteria = VolunteerSession.createCriteria()
		def result = criteria.list {
			eq("person", steward)
			projections {
				sum("hours")
				groupProperty("program")
			}
		}
		result
	}
	
	def totalHoursForStewardByProgramYearToDate(steward) {
		def today = new Date()
		println today[YEAR]
		def newYears = new LocalDate(today[YEAR], 1, 1)
		def criteria = VolunteerSession.createCriteria()
		def result = criteria.list {
			and {
				eq("person", steward)
				ge("date", newYears)
			}
			projections {
				sum("hours")
				groupProperty("program")
			}
		}
		result
	}
	
	def sessionsBySteward(steward, params) {
		def criteria = VolunteerSession.createCriteria()
		def result = criteria.list {
			eq("person", steward)
			firstResult(params.offset as Integer ?: 0)
			maxResults(params.max as Integer?: 50)
			order(params.sort ?: "date", params.order ?: "desc")
		}
		result
	}
	
	def countSessionsBySteward(steward) {
		def criteria = VolunteerSession.createCriteria()
		def result = criteria.list {
			eq("person", steward)
		}
		result.size()
	}
}