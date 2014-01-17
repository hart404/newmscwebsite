package newmscwebsite



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VolunteerSessionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VolunteerSession.list(params), model:[volunteerSessionInstanceCount: VolunteerSession.count()]
    }

    def show(VolunteerSession volunteerSessionInstance) {
		println "In Show"
        respond volunteerSessionInstance
    }

    def create() {
        respond new VolunteerSession(params)
    }

    @Transactional
    def save(VolunteerSession volunteerSessionInstance) {
        if (volunteerSessionInstance == null) {
            notFound()
            return
        }

        if (volunteerSessionInstance.hasErrors()) {
            respond volunteerSessionInstance.errors, view:'create'
            return
        }

        volunteerSessionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'volunteerSessionInstance.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
                redirect volunteerSessionInstance
            }
            '*' { respond volunteerSessionInstance, [status: CREATED] }
        }
    }

    def edit(VolunteerSession volunteerSessionInstance) {
        respond volunteerSessionInstance
    }

    @Transactional
    def update(VolunteerSession volunteerSessionInstance) {
        if (volunteerSessionInstance == null) {
            notFound()
            return
        }

        if (volunteerSessionInstance.hasErrors()) {
            respond volunteerSessionInstance.errors, view:'edit'
            return
        }

        volunteerSessionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VolunteerSession.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
                redirect volunteerSessionInstance
            }
            '*'{ respond volunteerSessionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VolunteerSession volunteerSessionInstance) {

        if (volunteerSessionInstance == null) {
            notFound()
            return
        }

        volunteerSessionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VolunteerSession.label', default: 'VolunteerSession'), volunteerSessionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'volunteerSessionInstance.label', default: 'VolunteerSession'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
