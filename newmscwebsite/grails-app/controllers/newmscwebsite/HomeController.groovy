package newmscwebsite

import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.volunteersession.VolunteerSession

import java.text.DateFormat
import java.text.SimpleDateFormat

import grails.converters.JSON
import groovy.sql.Sql
import simple.cms.SCMSStaticPage
import com.vinomis.authnet.AuthorizeNet

class HomeController {

	def homeService
	def eventService
	def newsItemService

	def index = {
		def events = eventService.findEventsForHomePage()
		def map = [events: events, newsItems: newsItemService.getHomePageNewsItems()]
		addWidgetsToMap(map)
		map
	}


	def search() {
		params
	}

	def addWidgetsToMap(map) {
		def page = SCMSStaticPage.findByLink('home')
		if (page == null) {
			page = homeService.generateHomePage()
		}
		page.widgets.each { widget ->
			map[widget.widgetId] = widget
		}
		SCMSStaticPage.currentPage = page
	}
}