package newmscwebsite

import org.joda.time.LocalDate

import simple.cms.SCMSStaticPage

class HomeController {
	
	def homeService
	def eventService
	
	static navigation = [
		group:'navigationBar',
		order:1,
		title:'Home',
		action:'index'
	]

    def index = {
		def events = eventService.findEventsForHomePage()
		def map = [events: events, newsItems: NewsItem.findAllByImportant(true)]
		addWidgetsToMap(map)
		map
	}
	
	def addWidgetsToMap(map) {
		def page = SCMSStaticPage.findByLink('home')
		if (page == null) {
			page = homeService.generateHomePage()
		}
		page.widgets.each { widget ->
			map[widget.widgetId] = widget
		}
	} 
	
	def search() {
		params
	}
	
}
