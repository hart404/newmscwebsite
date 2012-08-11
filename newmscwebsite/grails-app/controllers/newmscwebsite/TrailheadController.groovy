package newmscwebsite

class TrailheadController {
	
	TrailheadService trailheadService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def mapOfThePreserve = {
		[currentView: "mapOfThePreserve"]
	}
	
	def brownsRanch = {
		redirect(action: "displayLocation", params: [id: trailheadService.brownsRanch().id])
	}
	
	def gateway = {
		redirect(action: "displayLocation", params: [id: trailheadService.gateway().id])
	}
	
	def lostDog = {
		redirect(action: "displayLocation", params: [id: trailheadService.lostDog().id])
	}
	
	def tomsThumb = {
		redirect(action: "displayLocation", params: [id: trailheadService.tomsThumb().id])
	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [locationInstanceList: Trailhead.list(params), locationInstanceTotal: Trailhead.count()]
    }

    def create = {
        def locationInstance = new Trailhead()
		def addressInstance = new StreetAddress()
		def coordinatesInstance = new GeographicCoordinates()
		locationInstance.address = addressInstance
		locationInstance.coordinates = coordinatesInstance
        locationInstance.properties = params
		addressInstance.properties = params
		coordinatesInstance.properties = params
        return [locationInstance: locationInstance]
    }

    def save = {
        def locationInstance = new Trailhead(params)
		def addressInstance = new StreetAddress(params)
		def coordinatesInstance = new GeographicCoordinates(params)
		locationInstance.address = addressInstance
		locationInstance.coordinates = coordinatesInstance
        if (locationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])}"
            redirect(action: "show", id: locationInstance.id)
        }
        else {
            render(view: "create", model: [locationInstance: locationInstance])
        }
    }

    def show = {
        def locationInstance = Trailhead.get(params.id)
        if (!locationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
        else {
            [locationInstance: locationInstance]
        }
    }

    def edit = {
        def locationInstance = Trailhead.get(params.id)
        if (!locationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [locationInstance: locationInstance]
        }
    }

    def update = {
        def locationInstance = Trailhead.get(params.id)
		def addressInstance = locationInstance.address
		def coordinatesInstance = locationInstance.coordinates
        if (locationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (locationInstance.version > version) {
                    
                    locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'location.label', default: 'Location')] as Object[], "Another user has updated this Location while you were editing")
                    render(view: "edit", model: [locationInstance: locationInstance])
                    return
                }
            }
            locationInstance.properties = params
			addressInstance.properties = params
			coordinatesInstance.properties = params
            if (!locationInstance.hasErrors() && locationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])}"
                redirect(action: "show", id: locationInstance.id)
            }
            else {
                render(view: "edit", model: [locationInstance: locationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def locationInstance = Trailhead.get(params.id)
        if (locationInstance) {
            try {
                locationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def displayLocation = {
		def trailhead = Trailhead.findById(params.id)
		["location": trailhead, currentView: trailhead.internalName]
	}
	
	def displayHike = {
		def hike = Hike.findById(params.id)
		["hike": hike]
	}
}
