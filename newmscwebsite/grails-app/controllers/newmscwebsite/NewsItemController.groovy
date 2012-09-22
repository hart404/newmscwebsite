package newmscwebsite

import org.springframework.dao.DataIntegrityViolationException

import simple.cms.SCMSPhoto

class NewsItemController {
	
	def newsItemService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        [newsItems: newsItemService.getAllCurrentNewsItems(params), newsItemCount: newsItemService.countAllCurrentNewsItems()]
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newsItemInstanceList: NewsItem.list(params), newsItemInstanceTotal: NewsItem.count()]
    }

    def create() {
        [newsItemInstance: new NewsItem(params)]
    }

    def save() {
		def photo = SCMSPhoto.get(params.photoId)
        def newsItemInstance = new NewsItem(params)
		newsItemInstance.photo = photo
        if (!newsItemInstance.save(flush: true)) {
            render(view: "create", model: [newsItemInstance: newsItemInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), newsItemInstance.id])
        redirect(action: "show", id: newsItemInstance.id)
    }

    def show() {
        def newsItemInstance = NewsItem.get(params.id)
        if (!newsItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "list")
            return
        }

        [newsItemInstance: newsItemInstance]
    }

    def edit() {
        def newsItemInstance = NewsItem.get(params.id)
        if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "list")
            return
        }

        [newsItemInstance: newsItemInstance]
    }

    def update() {
        def newsItemInstance = NewsItem.get(params.id)
  		if (params.photoId != newsItemInstance.photo?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			newsItemInstance.photo = photo
		}
		if (!newsItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (newsItemInstance.version > version) {
                newsItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'newsItem.label', default: 'NewsItem')] as Object[],
                          "Another user has updated this NewsItem while you were editing")
                render(view: "edit", model: [newsItemInstance: newsItemInstance])
                return
            }
        }

        newsItemInstance.properties = params

        if (!newsItemInstance.save(flush: true)) {
            render(view: "edit", model: [newsItemInstance: newsItemInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), newsItemInstance.id])
        redirect(action: "show", id: newsItemInstance.id)
    }

    def delete() {
        def newsItemInstance = NewsItem.get(params.id)
        if (!newsItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "list")
            return
        }

        try {
            newsItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'newsItem.label', default: 'NewsItem'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def displayNewsItem = {
		[newsItem: NewsItem.get(params.id)]
	}
}
