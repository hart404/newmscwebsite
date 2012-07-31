package newmscwebsite

import simple.cms.SCMSHTMLWidget

class HomeController {
	
	static navigation = [
		group:'navigationBar',
		order:1,
		title:'Home',
		action:'index'
	]

    def index = {
		// Retrieve priority 1 events. That is, the ones that should be displayed on the home page
		[events: Event.findAllByEventPriority(1), newsItems: NewsItem.findAllByImportant(true)]
	}
	
}
