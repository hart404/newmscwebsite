package newmscwebsite

import simple.cms.SCMSHTMLWidget
import simple.cms.SCMSPhoto
import simple.cms.SCMSPhotoWidget
import simple.cms.SCMSStaticPage

class HomeService {
	
	String defaultHTMLText = """
<p>The McDowell Sonoran Conservancy is a non-profit conservation organization that engages the community to protect the McDowell Sonoran Preserve.  
Your support will ensure that the Preserve continues to be a natural open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>"""
	
	def generateHomePage() {
		def page = new SCMSStaticPage(link: 'home')
		generateDonateTextWidget(page)
		generateDonatePhotoWidget(page)
		page.save(failOnError: true)
		page
	}
	
	def generateDonateTextWidget(page) {
		def htmlWidget = new SCMSHTMLWidget(htmlText: defaultHTMLText, widgetId: "donateText")
		page.addToWidgets(htmlWidget)
	}
	
	def generateDonatePhotoWidget(page) {
		def serverURL = "http://mcdowellsonoran.org"
		def donatePhoto = new SCMSPhoto(description: "Donate", source: serverURL, path: "images/layout", originalFileName: "img_hike-105x104.png", fileName: "img_hike-105x104.png", width: 105, height: 104, keywords: ["donate"], allKeywords: "donate", artist: "Phil", copyright: "None")
		donatePhoto.save(failOnError: true, flush: true)		
		def donatePhotoWidget = new SCMSPhotoWidget(photo: donatePhoto, widgetId: "donatePhoto")
		page.addToWidgets(donatePhotoWidget)
	}

}
