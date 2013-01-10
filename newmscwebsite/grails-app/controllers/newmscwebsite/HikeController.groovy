package newmscwebsite

import org.springframework.dao.DataIntegrityViolationException

class HikeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [hikeInstanceList: Hike.list(params), hikeInstanceTotal: Hike.count()]
    }

    def create() {
        [hikeInstance: new Hike(params)]
    }

    def save() {
        def hikeInstance = new Hike(params)
        if (!hikeInstance.save(flush: true)) {
            render(view: "create", model: [hikeInstance: hikeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'hike.label', default: 'Hike'), hikeInstance.id])
        redirect(action: "show", id: hikeInstance.id)
    }

    def show() {
        def hikeInstance = Hike.get(params.id)
        if (!hikeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "list")
            return
        }

        [hikeInstance: hikeInstance]
    }

    def edit() {
        def hikeInstance = Hike.get(params.id)
        if (!hikeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "list")
            return
        }

        [hikeInstance: hikeInstance]
    }

    def update() {
        def hikeInstance = Hike.get(params.id)
        if (!hikeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (hikeInstance.version > version) {
                hikeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hike.label', default: 'Hike')] as Object[],
                          "Another user has updated this Hike while you were editing")
                render(view: "edit", model: [hikeInstance: hikeInstance])
                return
            }
        }

        hikeInstance.properties = params

        if (!hikeInstance.save(flush: true)) {
            render(view: "edit", model: [hikeInstance: hikeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'hike.label', default: 'Hike'), hikeInstance.id])
        redirect(action: "show", id: hikeInstance.id)
    }

    def delete() {
        def hikeInstance = Hike.get(params.id)
        if (!hikeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "list")
            return
        }

        try {
            hikeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hike.label', default: 'Hike'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
