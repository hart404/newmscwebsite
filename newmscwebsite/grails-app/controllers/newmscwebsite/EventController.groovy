package newmscwebsite

import simple.cms.SCMSMenu
import simple.cms.SCMSPhoto
import groovy.json.JsonSlurper
import org.joda.time.LocalDate


class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", index: "GET", displayItem: "GET"]
	
	EventService eventService
	
	def index = {
		def generator = new DateGenerator(eventService)
		def events = eventService.findAllAfterTodayInitial()
		[events: events, 
			rows: generator.getCalendarRows(), 
			year: generator.getYear(), 
			month: generator.getMonthName(), 
			monthNumber: generator.getMonthNumber(),
			offset: 0,
			max: 5,
			eventCount: eventService.countAllAfterToday()]
	}
	
	def calendarPreviousMonth = {
		def year = params.year as int
		def monthNumber = params.monthNumber as int
		// Deal with year wrap around
		if (monthNumber == 1) {
			monthNumber = 12
			year--
		} else {
			monthNumber--
		}
		def generator = new DateGenerator(monthNumber, year, eventService)
		render(template:"/event/calendarTemplate", model:[rows: generator.getCalendarRows(), year: generator.getYear(), month: generator.getMonthName(), monthNumber: generator.getMonthNumber()])		
	}

	def calendarNextMonth = {
		def year = params.year as int
		def monthNumber = params.monthNumber as int
		// Deal with year wrap around
		if (monthNumber == 12) {
			monthNumber = 1
			year++
		} else {
			monthNumber++
		}
		def generator = new DateGenerator(monthNumber, year, eventService)
		render(template:"/event/calendarTemplate", model:[rows: generator.getCalendarRows(), year: generator.getYear(), month: generator.getMonthName(), monthNumber: generator.getMonthNumber()])		
	}
	
	def getEventsForDates = {
		def jsonDateList = new JsonSlurper().parseText(params.dates)
		def dateList = jsonDateList.dates.collect {
			new LocalDate(it.year, it.monthNumber, it.day)
		}
		def jsonCategories = new JsonSlurper().parseText(params.categories)
		def categories = jsonCategories.categories.collect { category -> Category.fromString(category)}
		def events = eventService.findAllInDateListAndCategories(dateList, categories)
		def eventCount = events.size()
		def startEvent = params.offset as Integer
		def endEvent = startEvent + (params.max as Integer) - 1
		endEvent = Math.min(eventCount - 1, endEvent)
		if (!events.isEmpty()) {
			events = events[startEvent..endEvent]
		}
		params.offset = params.offset as Integer
		params.max = params.max as Integer
		render(template:"/event/eventsTemplate", model:["events": events, "eventCount": eventCount, offset: params.offset, max: params.max])
	}
	
	def getEventsAfterToday() {
		def events = []
		if (!params.categories) {
			events = eventService.findAllAfterToday()
		} else {
			def jsonCategories = new JsonSlurper().parseText(params.categories)
			def categories = jsonCategories.categories.collect { category -> Category.fromString(category)}
			events = eventService.findAllAfterToday(categories)
    	}
		def eventCount = events.size()
		def startEvent = params.offset as Integer
		def endEvent = startEvent + (params.max as Integer) - 1
		endEvent = Math.min(eventCount - 1, endEvent)
		def myParams = params
		if (!events.isEmpty()) {
			events = events[startEvent..endEvent]
		}
		params.offset = params.offset as Integer
		params.max = params.max as Integer
		render(template:"/event/eventsTemplate", model:[events: events, "eventCount": eventCount, offset: params.offset, max: params.max])
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventInstanceList: Event.list(params), eventInstanceTotal: Event.count()]
    }

    def create = {
        def eventInstance = new Event()
        eventInstance.properties = params
        return [eventInstance: eventInstance]
    }

    def save = {
		def photo = SCMSPhoto.get(params.photoId)
        def eventInstance = new Event(params)
		eventInstance.mainPhoto = photo
		eventInstance.categories.clear()
		def categories = getCategoriesFrom(params)
		categories.each { category ->
			eventInstance.addToCategories(category)
		}
        if (eventInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])}"
            redirect(action: "show", id: eventInstance.id)
        }
        else {
            render(view: "create", model: [eventInstance: eventInstance])
        }
    }
	
	def getCategoriesFrom(map) {
		def result = []
		map.each { key, value ->
			if (value == "on") {
				def category = Category.fromString(key)
				if (category) {
					result << Category.fromString(key)
				}
			}
		}
		result
	}

    def show = {
        def eventInstance = Event.get(params.id)
        if (!eventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "list")
        }
        else {
            [eventInstance: eventInstance]
        }
    }

    def edit = {
        def eventInstance = Event.get(params.id)
        if (!eventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [eventInstance: eventInstance]
        }
    }

    def update = {
        def eventInstance = Event.get(params.id)
		if (params.photoId != eventInstance.mainPhoto?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			eventInstance.mainPhoto = photo
		}
		eventInstance.categories.clear()
		def categories = getCategoriesFrom(params)
		categories.each { category ->
			eventInstance.addToCategories(category)
		}
        if (eventInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (eventInstance.version > version) {
                    
                    eventInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'event.label', default: 'Event')] as Object[], "Another user has updated this Event while you were editing")
                    render(view: "edit", model: [eventInstance: eventInstance])
                    return
                }
            }
            eventInstance.properties = params
            if (!eventInstance.hasErrors() && eventInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])}"
                redirect(action: "show", id: eventInstance.id)
            }
            else {
                render(view: "edit", model: [eventInstance: eventInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def eventInstance = Event.get(params.id)
        if (eventInstance) {
            try {
                eventInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def displayEvent = {
		[event : Event.findById(params.id)]
	}
	
	def stewardOnlyEvents() {
		if (!params.max) {
			params.max = 20
		} else {
			params.max = params.max as Integer
		}
		if (!params.offset) {
			params.offset = 0
		} else {
			params.offset = params.offset as Integer
		}
		[stewardOnlyEvents: eventService.stewardOnlyEvents(params), countStewardOnlyEvents: eventService.countStewardOnlyEvents(), menu: obtainStewardMenu()]
	}
	
	def obtainStewardMenu() {
		def stewardMenu = SCMSMenu.findByTitle("Steward")
		if (stewardMenu == null) {
			stewardMenu = new SCMSMenu(title: "Steward")
		}
		stewardMenu
	}
	
}
