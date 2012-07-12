package newmscwebsite

import org.joda.time.LocalDate

import groovy.json.JsonSlurper

class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", index: "GET", displayItem: "GET"]
	
	EventService eventService
	
	def index = {
		def generator = new DateGenerator(eventService)
		[events: eventService.findAllAfterToday(), 
			rows: generator.getCalendarRows(), 
			year: generator.getYear(), 
			month: generator.getMonthName(), 
			monthNumber: generator.getMonthNumber()]
	}
	
	def challenge = {
		
	}
	
	def wildflowers = {
		
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
		println year + " " + monthNumber
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
		println year + " " + monthNumber
		render(template:"/event/calendarTemplate", model:[rows: generator.getCalendarRows(), year: generator.getYear(), month: generator.getMonthName(), monthNumber: generator.getMonthNumber()])		
	}
	
	def getEventsForDates = {
		def jsonDateList = new JsonSlurper().parseText(params.dates)
		def dateList = jsonDateList.dates.collect {
			new LocalDate(it.year, it.monthNumber, it.day)
		}
		def events = eventService.findAllInDateList(dateList)
		render(template:"/event/eventsTemplate", model:["events": events])
	}
	
	def getEventsAfterToday() {
		render(template:"/event/eventsTemplate", model:[events: eventService.findAllAfterToday()])
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventInstanceList: Event.list(params), eventInstanceTotal: Event.count()]
    }

    def create = {
        def eventInstance = new Event()
		println params
        eventInstance.properties = params
        return [eventInstance: eventInstance]
    }

    def save = {
        def eventInstance = new Event(params)
		println params
        if (eventInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])}"
            redirect(action: "show", id: eventInstance.id)
        }
        else {
            render(view: "create", model: [eventInstance: eventInstance])
        }
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
}
