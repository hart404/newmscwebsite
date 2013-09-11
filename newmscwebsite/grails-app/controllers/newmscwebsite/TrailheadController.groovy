package newmscwebsite

import simple.cms.SCMSStaticPage

class TrailheadController {
	
	TrailheadService trailheadService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def mapOfThePreserve = {
		def map = [:]
		map.currentView = "mapOfThePreserve"
		addWidgetsToMap(map)
		map
	}
	
	def addWidgetsToMap(map) {
		def page = SCMSStaticPage.findByLink('trailheadsMap')
		if (page == null) {
			page = trailheadService.generateWidgetForTrailheadPage()
		}
		page.widgets.each { widget ->
			map[widget.widgetId] = widget
		}
		SCMSStaticPage.currentPage = page
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
        [trailheadInstanceList: Trailhead.list(params), trailheadInstanceTotal: Trailhead.count()]
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
        return [trailheadInstance: locationInstance]
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
            render(view: "create", model: [trailheadInstance: locationInstance])
        }
    }

    def show = {
        def locationInstance = Trailhead.get(params.id)
        if (!locationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
        else {
            [trailheadInstance: locationInstance]
        }
    }

    def edit = {
        def locationInstance = Trailhead.get(params.id)
		def addressInstance = locationInstance.address
		def coordinatesInstance = locationInstance.coordinates
        if (!locationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [trailheadInstance: locationInstance, geographicCoordinatesInstance: coordinatesInstance, streetAddressInstance: addressInstance]
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
                    render(view: "edit", model: [locationInstance: locationInstance, geographicCoordinatesInstance: coordinatesInstance, streetAddressInstance: addressInstance])
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
                render(view: "edit", model: [trailheadInstance: locationInstance, geographicCoordinatesInstance: coordinatesInstance, streetAddressInstance: addressInstance])
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
		def trailhead = Trailhead.get(params.id)
		[location: trailhead, currentView: trailhead.internalName, mapName: trailhead.mapName]
	}
	
	def displayHike = {
		def hike = Hike.get(params.id)
		[hike: hike]
	}
}
