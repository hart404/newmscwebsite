package newmscwebsite

import org.joda.time.LocalDate

class HomeController {
	
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
		[events: events, newsItems: NewsItem.findAllByImportant(true)]
	}
	
}
