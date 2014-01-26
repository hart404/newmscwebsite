package newmscwebsite

import org.springframework.dao.DataIntegrityViolationException

class TrailSectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [trailSectionInstanceList: TrailSection.list(params), trailSectionInstanceTotal: TrailSection.count()]
    }

    def create() {
        [trailSectionInstance: new TrailSection(params)]
    }

    def save() {
        def trailSectionInstance = new TrailSection(params)
        if (!trailSectionInstance.save(flush: true)) {
            render(view: "create", model: [trailSectionInstance: trailSectionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), trailSectionInstance.id])
        redirect(action: "show", id: trailSectionInstance.id)
    }

    def show() {
        def trailSectionInstance = TrailSection.get(params.id)
        if (!trailSectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "list")
            return
        }

        [trailSectionInstance: trailSectionInstance]
    }

    def edit() {
        def trailSectionInstance = TrailSection.get(params.id)
        if (!trailSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "list")
            return
        }

        [trailSectionInstance: trailSectionInstance]
    }

    def update() {
        def trailSectionInstance = TrailSection.get(params.id)
        if (!trailSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (trailSectionInstance.version > version) {
                trailSectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'trailSection.label', default: 'TrailSection')] as Object[],
                          "Another user has updated this TrailSection while you were editing")
                render(view: "edit", model: [trailSectionInstance: trailSectionInstance])
                return
            }
        }

        trailSectionInstance.properties = params

        if (!trailSectionInstance.save(flush: true)) {
            render(view: "edit", model: [trailSectionInstance: trailSectionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), trailSectionInstance.id])
        redirect(action: "show", id: trailSectionInstance.id)
    }

    def delete() {
        def trailSectionInstance = TrailSection.get(params.id)
        if (!trailSectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "list")
            return
        }

        try {
            trailSectionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trailSection.label', default: 'TrailSection'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
