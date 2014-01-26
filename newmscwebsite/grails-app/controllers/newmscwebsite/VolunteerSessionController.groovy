package newmscwebsite

import org.joda.time.LocalDate
import org.springframework.dao.DataIntegrityViolationException

class VolunteerSessionController {
	
	def volunteerSessionService
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [volunteerSessionInstanceList: VolunteerSession.list(params), volunteerSessionInstanceTotal: VolunteerSession.count()]
    }

    def create() {
        [volunteerSessionInstance: new VolunteerSession(params)]
    }

    def save() {
        def volunteerSessionInstance = new VolunteerSession(params)
        if (!volunteerSessionInstance.save(flush: true)) {
            render(view: "create", model: [volunteerSessionInstance: volunteerSessionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
        redirect(action: "show", id: volunteerSessionInstance.id)
    }

    def show() {
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
            return
        }

        [volunteerSessionInstance: volunteerSessionInstance]
    }

    def edit() {
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
            return
        }

        [volunteerSessionInstance: volunteerSessionInstance]
    }

    def userEdit() {
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
            return
        }

        [volunteerSessionInstance: volunteerSessionInstance]
    }

    def userUpdate() {
		// Workaround for a JODA issue in Grails 2.3.0+
		LocalDate updatedDate = new LocalDate(params.'date_year' as Integer, params.'date_month' as Integer, params.'date_day' as Integer)
		params.date = updatedDate
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(controller: "person", action: "showStewardReportingSummary")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (volunteerSessionInstance.version > version) {
                volunteerSessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'volunteerSession.label', default: 'VolunteerSession')] as Object[],
                          "Another user has updated this VolunteerSession while you were editing")
                render(view: "userEdit", model: [volunteerSessionInstance: volunteerSessionInstance])
                return
            }
        }

        volunteerSessionInstance.properties = params

        if (!volunteerSessionInstance.save(flush: true)) {
            render(view: "userEdit", model: [volunteerSessionInstance: volunteerSessionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
        redirect(controller: "person", action: "showStewardReportingSummary")
    }

     def update() {
		// Workaround for a JODA issue in Grails 2.3.0+
		LocalDate updatedDate = new LocalDate(params.'date_year' as Integer, params.'date_month' as Integer, params.'date_day' as Integer)
		params.date = updatedDate
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (volunteerSessionInstance.version > version) {
                volunteerSessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'volunteerSession.label', default: 'VolunteerSession')] as Object[],
                          "Another user has updated this VolunteerSession while you were editing")
                render(view: "edit", model: [volunteerSessionInstance: volunteerSessionInstance])
                return
            }
        }

        volunteerSessionInstance.properties = params

        if (!volunteerSessionInstance.save(flush: true)) {
            render(view: "edit", model: [volunteerSessionInstance: volunteerSessionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
        redirect(action: "show", id: volunteerSessionInstance.id)
    }

   def delete() {
        def volunteerSessionInstance = VolunteerSession.get(params.id)
        if (!volunteerSessionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
            return
        }

        try {
            volunteerSessionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'volunteerSession.label', default: 'VolunteerSession'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
   
   def downloadVolunteerSessionsAsCSV() {
	   response.setHeader "Content-disposition", "attachment; filename=volunteerHours.csv"
	   response.contentType = 'text/csv'
	   def steward = (Person)springSecurityService.currentUser
	   createCSVFileVolunteerSessions(steward, response.outputStream)
	   response.outputStream.flush()
   }

   def createCSVFileVolunteerSessions(steward, outputStream) {
	   def volunteerSessions = volunteerSessionService.sessionsBySteward(steward, 0, 100000, [:])
	   volunteerSessions.each { VolunteerSession session ->
		   outputStream << "'${((ProgramReporting)session.program).value()}',"
		   outputStream << "'${session.date}',"
		   outputStream << "'${session.hours}'"
		   outputStream << "\n"
	   }
   }
   
}
