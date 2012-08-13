package newmscwebsite

import org.joda.time.LocalDate

import simple.cms.SCMSHardCodedPage

class HomeController {
	
	def homeService
	
	static navigation = [
		group:'navigationBar',
		order:1,
		title:'Home',
		action:'index'
	]

    def index = {
		// Retrieve priority 1 events. That is, the ones that should be displayed on the home page
		def events = Event.findAllByEventPriority(1) as List
		events = events.findAll { event -> event.startDate >= LocalDate.now()}
		def map = [events: events, newsItems: NewsItem.findAllByImportant(true)]
		addWidgetsToMap(map)
		map
	}
	
	def addWidgetsToMap(map) {
		def page = SCMSHardCodedPage.findByUri('home')
		if (page == null) {
			page = homeService.generateHomePage()
		}
		page.widgets.each { widget ->
			map[widget.widgetId] = widget
		}
	} 
	
}
