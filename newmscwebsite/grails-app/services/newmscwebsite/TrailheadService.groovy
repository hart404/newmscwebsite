package newmscwebsite

import simple.cms.SCMSHTMLWidget
import simple.cms.SCMSStaticPage

class TrailheadService {

    def brownsRanch() {
		Trailhead.findByNameLike("Brown's Ranch%")
    }
	
	def gateway() {
		Trailhead.findByNameLike("Gateway%")
	}
	
	def lostDog() {
		Trailhead.findByNameLike("Lost Dog%")
	}
	
	def tomsThumb() {
		Trailhead.findByNameLike("Tom's Thumb%")
	}
	
	def ringtail() {
		Trailhead.findByNameLike("Ringtail%")
	}
	
	def generateWidgetForTrailheadPage() {
		def page = new SCMSStaticPage(link: 'trailheadsMap')
		generateTrailheadTextWidget(page)
		page.save(failOnError: true)
		page
	}
	
	def generateTrailheadTextWidget(page) {
		def htmlWidget = new SCMSHTMLWidget(htmlText: "<h1>Trailheads</h1>", widgetId: "trailheadsMap")
		page.addToWidgets(htmlWidget)
	}
	
}
