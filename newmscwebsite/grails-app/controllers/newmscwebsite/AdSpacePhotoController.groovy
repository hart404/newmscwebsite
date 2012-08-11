package newmscwebsite

import org.codehaus.groovy.grails.web.json.JSONArray
import org.joda.time.LocalDate
import org.springframework.dao.DataIntegrityViolationException

class AdSpacePhotoController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def adSpacePhotos() {
		def photos = AdSpacePhoto.list()
		def yesterday = LocalDate.now().minusDays(1)
		def today = LocalDate.now()
		photos = photos.findAll { photo -> photo.displayStartDate.isAfter(yesterday) && today.isBefore(photo.displayEndDate)}
		render(contentType: "text/json") {
			renderPhotosAsJSON(photos)
		}
	}
	
	def renderPhotosAsJSON(adSpacePhotos) {
		def result = []
		adSpacePhotos.each { adSpacePhoto ->
			def photo = adSpacePhoto.photo
			def map = [
				thumb: 'images/adspace/img_adspace-thumbnail-16x16.png',
				image: "${photo.fullPath()}",
				title: "${adSpacePhoto.title}",
				description: "${adSpacePhoto.description}",
				link: "${adSpacePhoto.link}",
			]			
			result << map
		}
		result
		
	}
	
	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[adSpacePhotoInstanceList: AdSpacePhoto.list(params), adSpacePhotoInstanceTotal: AdSpacePhoto.count()]
	}

	def create() {
		[adSpacePhotoInstance: new AdSpacePhoto(params)]
	}

	def save() {
		def adSpacePhotoInstance = new AdSpacePhoto(params)
		def photo = Photo.get(params.photoId)
		adSpacePhotoInstance.photo = photo
		if (!adSpacePhotoInstance.save(flush: true)) {
			render(view: "create", model: [adSpacePhotoInstance: adSpacePhotoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), adSpacePhotoInstance.id])
		redirect(action: "show", id: adSpacePhotoInstance.id)
	}

	def show() {
		def adSpacePhotoInstance = AdSpacePhoto.get(params.id)
		if (!adSpacePhotoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "list")
			return
		}

		[adSpacePhotoInstance: adSpacePhotoInstance]
	}

	def edit() {
		def adSpacePhotoInstance = AdSpacePhoto.get(params.id)
		if (!adSpacePhotoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "list")
			return
		}

		[adSpacePhotoInstance: adSpacePhotoInstance]
	}

	def update() {
		def adSpacePhotoInstance = AdSpacePhoto.get(params.id)
		if (!adSpacePhotoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (adSpacePhotoInstance.version > version) {
				adSpacePhotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'person.label', default: 'AdSpacePhoto')] as Object[],
						  "Another user has updated this AdSpacePhoto while you were editing")
				render(view: "edit", model: [adSpacePhotoInstance: adSpacePhotoInstance])
				return
			}
		}

		adSpacePhotoInstance.properties = params

		if (!adSpacePhotoInstance.save(flush: true)) {
			render(view: "edit", model: [adSpacePhotoInstance: adSpacePhotoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), adSpacePhotoInstance.id])
		redirect(action: "show", id: adSpacePhotoInstance.id)
	}

	def delete() {
		def adSpacePhotoInstance = AdSpacePhoto.get(params.id)
		if (!adSpacePhotoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "list")
			return
		}

		try {
			adSpacePhotoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'AdSpacePhoto'), params.id])
			redirect(action: "show", id: params.id)
		}
	}

}
