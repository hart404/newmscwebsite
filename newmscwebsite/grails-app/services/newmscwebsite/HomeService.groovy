package newmscwebsite

import simple.cms.SCMSHTMLWidget
import simple.cms.SCMSHardCodedPage

class HomeService {
	
	String defaultHTMLText = """
<p>The McDowell Sonoran Conservancy is a non-profit conservation organization that engages the community to protect the McDowell Sonoran Preserve.  
Your support will ensure that the Preserve continues to be a natural open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>"""
	
	def generateHomePage() {
		def page = new SCMSHardCodedPage(uri: 'home')
		def widget = new SCMSHTMLWidget(htmlText: defaultHTMLText, widgetId: "donateText")
		page.addToWidgets(widget)
		page.save(failOnError: true)
		page
	}

}
