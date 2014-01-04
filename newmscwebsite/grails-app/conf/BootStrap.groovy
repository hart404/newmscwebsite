import newmscwebsite.Activity
import newmscwebsite.Amenity
import newmscwebsite.Category
import newmscwebsite.Event
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Hike
import newmscwebsite.NewsItem
import newmscwebsite.Person
import newmscwebsite.Phone
import newmscwebsite.SecRole
import newmscwebsite.SecUser
import newmscwebsite.SecUserSecRole
import newmscwebsite.StreetAddress
import newmscwebsite.Trailhead
import newmscwebsite.TrailheadService

import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat
import org.springframework.core.io.ClassPathResource

import simple.cms.SCMSAdSpacePhoto
import simple.cms.SCMSMenu
import simple.cms.SCMSMenuBar
import simple.cms.SCMSMenuItem
import simple.cms.SCMSPhoto

import groovy.sql.Sql

class BootStrap {

	TrailheadService trailheadService
	def springSecurityService
	def grailsApplication

	def init = { servletContext ->
		println "Running bootstrap..."
		println "Root directory: ${System.getProperty("user.home")}"
		println "apikey=${grailsApplication.config.constant_contact.apikey}"
		println "accesstoken=${grailsApplication.config.constant_contact.accesstoken}"
		updateSql()
		createRoles()
		createAdminUser()
		createMenus()
		createECards()
		createLocations()
		createHikes()
		websiteUpdates()
	}
	
	def createECards() {
		def eCards = SCMSPhoto.findAllByDescription("eCard")
		if (eCards.isEmpty()) {
			def serverURL = "http://mcdowellsonoran.org"
			def imagePath = "images/eCards"
			def eCard = new SCMSPhoto(description: "eCard", source: serverURL, path: imagePath, originalFileName: "javalina.jpg", fileName: "javalina.jpg", width: 432, height: 288, keywords: ["eCard javalina"], allKeywords: "eCard javalina", artist: "Debra Doss", copyright: "McDowell Sonoran Preserve")
			eCard.save(failOnError: true, flush: true)
			eCard = new SCMSPhoto(description: "eCard", source: serverURL, path: imagePath, originalFileName: "sympathy_bird.jpg", fileName: "sympathy_bird.jpg", width: 432, height: 288, keywords: ["eCard sympathy bird"], allKeywords: "eCard sympathy bird", artist: "Debra Doss", copyright: "McDowell Sonoran Preserve")
			eCard.save(failOnError: true, flush: true)
			eCard = new SCMSPhoto(description: "eCard", source: serverURL, path: imagePath, originalFileName: "sympathy_mtnsunset.jpg", fileName: "sympathy_mtnsunset.jpg", width: 432, height: 288, keywords: ["eCard sympathy mountain sunset"], allKeywords: "eCard sympathy mountain sunset", artist: "Debra Doss", copyright: "McDowell Sonoran Preserve")
			eCard.save(failOnError: true, flush: true)
			eCard = new SCMSPhoto(description: "eCard", source: serverURL, path: imagePath, originalFileName: "trail.jpg", fileName: "trail.jpg", width: 432, height: 288, keywords: ["eCard trail"], allKeywords: "eCard trail", artist: "Debra Doss", copyright: "McDowell Sonoran Preserve")
			eCard.save(failOnError: true, flush: true)
			eCard = new SCMSPhoto(description: "eCard", source: serverURL, path: imagePath, originalFileName: "yellow_flower.jpg", fileName: "yellow_flower.jpg", width: 432, height: 288, keywords: ["eCard yellow flower"], allKeywords: "eCard yellow flower", artist: "Debra Doss", copyright: "McDowell Sonoran Preserve")
			eCard.save(failOnError: true, flush: true)
			println "Created 5 eCards."
		}
	}

	void createRoles() {
		println "Roles: ${SecRole.count()}"
		if (!SecRole.count()) {
			println "Creating Roles"
			def roles = ["ROLE_ADMIN", "ROLE_GUEST","ROLE_USER","ROLE_STEWARD", "ROLE_LEADER", "ROLE_BOARD", "ROLE_STAFF", "ROLE_WEB"]
			roles.each { role ->
				new SecRole(authority: role).save(failOnError: true)
			}
		}
	}

	def createAdminUser() {
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		def webRole = SecRole.findByAuthority('ROLE_WEB') ?: new SecRole(authority: 'ROLE_WEB').save(failOnError: true)
		def adminUser = SecUser.findByUsername('admin@mcdowellsonoran.org') ?: new SecUser(
				username: 'admin@mcdowellsonoran.org',
				password: 'admin',
				enabled: true).save(failOnError: true)
		if (!adminUser.authorities.contains(adminRole)) {
			SecUserSecRole.create adminUser, adminRole
		}
		if (!adminUser.authorities.contains(webRole)) {
			SecUserSecRole.create adminUser, webRole
		}
	}
	
	def createMenus() {
		SCMSMenuBar menuBar = SCMSMenuBar.findByWidgetId("mainNavigationBar")
		if (menuBar == null) {
			menuBar = new SCMSMenuBar(widgetId: "mainNavigationBar")
			addHome(menuBar)
			addVisitThePreserve(menuBar)
			addAboutUs(menuBar)
			addEducationAndResearch(menuBar)
			addVolunteer(menuBar)
			addSupportUs(menuBar)
			addAdministration(menuBar)
			menuBar.save(failOnError: true)
		}
	}
	
	def addHome(menuBar) {
		SCMSMenu home = new SCMSMenu(title: "Home", link: "/home")
		menuBar.addToMenus(home)
	}
	
	def addVisitThePreserve(menuBar) {
		// Plan Your Visit, Trailheads and Directions, Recreation, Photo Gallery
		SCMSMenu visitThePreserve = new SCMSMenu(title: "Visit the Preserve")
		SCMSMenu planYourVisit = new SCMSMenu(title: "Plan Your Visit")
		addPlanYourVisitSubItems(planYourVisit)
		visitThePreserve.addToMenuItems(planYourVisit)
		visitThePreserve.addToMenuItems(new SCMSMenu(title: "Trailheads & Directions", link: "trailhead/mapOfThePreserve"))
		visitThePreserve.addToMenuItems(new SCMSMenu(title: "Recreation", link: "content/pages/recreation"))
		visitThePreserve.addToMenuItems(new SCMSMenu(title: "PhotoGallery", link: "photoGallery"))
		menuBar.addToMenus(visitThePreserve)
	}
	
	def addPlanYourVisitSubItems(planYourVisit) {
		// Pathfinders, Nature Guides, Family Passport, Know Before You Go
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Pathfinders", link: "content/pages/pathfinders"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Nature Guides", link: "content/pages/natureGuides"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Family Passport", link: "content/pages/familyPassport"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Know Before You Go", link: "content/pages/knowBeforeYouGo"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "FAQs", link: "content/pages/faqs"))
	}
	
	def addAboutUs(menuBar) {
		def aboutUs = new SCMSMenu(title: "About Us", link: "aboutUs")
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Mission and Vision", link: "content/pages/missionAndVision"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "History", link: "content/pages/history"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "People", link: "content/pages/people"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Gift Shop", link: "content/pages/giftShop"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Mountain Lines Magazine", link: "content/pages/mountainLines"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Press Kit", link: "content/pages/pressKit"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Contact", link: "content/pages/contact"))
		aboutUs.addToMenuItems(new SCMSMenuItem(title: "Annual Reports", link: "content/pages/annualReports"))
		menuBar.addToMenus(aboutUs)
	}
	
	def addEducationAndResearch(menuBar) {
		SCMSMenu educationAndResearch = new SCMSMenu(title: "Education & Research")
		educationAndResearch.addToMenuItems(new SCMSMenu(title: "Adult Learning", link: "#"))
		educationAndResearch.addToMenuItems(new SCMSMenu(title: "School Groups & Youth", link: "#"))
		educationAndResearch.addToMenuItems(new SCMSMenu(title: "Online Learning", link: "#"))
		educationAndResearch.addToMenuItems(new SCMSMenu(title: "Field Institute", link: "#"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Conservation", link: "content/pages/herpatology"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Publications & News", link: "content/pages/herpatology"))
		menuBar.addToMenus(educationAndResearch)
	}
	
	def addVolunteer(menuBar) {
		menuBar.addToMenus(new SCMSMenu(title: "Volunteer", link: "content/pages/volunteer"))
	}
	
	def addSupportUs(menuBar) {
		menuBar.addToMenus(new SCMSMenu(title: "Support Us", link: "supportUs"))
	}
	
	def addAdministration(menuBar) {
		// Manage Users, Photos, Manage Events, Manage AdSpace, Manage News Items
		def administration = new SCMSMenu(title: "Administration")
		administration.addToRoles("ROLE_ADMIN")
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage Users", link: "person/list"))
		SCMSMenu photoMenu = new SCMSMenu(title: "Photos")
		addPhotoMenuItems(photoMenu)
		administration.addToMenuItems(photoMenu)
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage Ad Space", link: "adSpacePhoto/list"))
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage News Items", link: "newsItem/list"))
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage Events", link: "event/list"))
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage Pages", link: "page/list"))
		administration.addToMenuItems(new SCMSMenuItem(title: "Manage Menus", link: "menuBar/list"))
		administration.addToMenuItems(new SCMSMenuItem(title: "Search", link: "searchable"))
		menuBar.addToMenus(administration)
	}
	
	def addPhotoMenuItems(photoMenu) {
		// Photo list, upload photos
		photoMenu.addToMenuItems(new SCMSMenuItem(title: "Manage Photos", link: "photo/list"))
		photoMenu.addToMenuItems(new SCMSMenuItem(title: "Upload Photos", link: "photo/uploadPhotos"))
	}
	void createLocations() {
		println "Locations: ${Trailhead.count()}"
		if (!Trailhead.count()) {
			println "Creating Locations"
			def amenities = [
				Amenity.DIRECTORY,
				Amenity.HORSE_TRAILS,
				Amenity.INFORMATION,
				Amenity.RESTROOM,
				Amenity.SEATING,
				Amenity.SHELTER,
				Amenity.WATER
			]
			def activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.FAMILY,
				Activity.HANDICAP,
				Activity.HIKING
			]
			def addressInstance = new StreetAddress(street: "18333 N. Thompson Peak Rd", zip: "85255")
			def coordinatesInstance = new GeographicCoordinates(latitude: 33.647900, longitude: -111.862236)
			def locationInstance = new Trailhead(name: "Gateway Trailhead", internalName: "gateway", description: "The Gateway Trailhead, located on the east side of Thompson Peak Rd. between Legacy Blvd. and Bell Rd., is fully barrier-free and has all the amenities an outdoor recreation enthusiast could want.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = []
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "North Side of Bell Rd at 104th St", zip: "85255")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.640317786387236, longitude: -111.8566131591797)
			locationInstance = new Trailhead(name: "Bell Road Trailhead", internalName: "bellRoad", description: "This minor access point, located on Bell Rd. east of Thompson Peak, has very limited parking and no amenities. This trailhead provides direct access to the Levee Trail that connects to the Paradise Trail.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = [
				Amenity.DIRECTORY,
				Amenity.HORSE_TRAILS,
				Amenity.SEATING
			]
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "10440 East Via Linda", zip: "85258")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.596276, longitude: -111.768048)
			locationInstance = new Trailhead(name: "Sunrise Access Area", internalName: "sunrise", description: "Sunrise Area is located at Via Linda and 145th Way.   There is an auxiliary lot just south of the entrance for equestrians.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = [Amenity.DIRECTORY]
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "12300 N. 128th St", zip: "85259")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.599343, longitude: -111.804630)
			locationInstance = new Trailhead(name: "Ringtail Trailhead", internalName: "ringtail", description: "", address: addressInstance, coordinates: coordinatesInstance)
			locationInstance.save(failOnError: true)
			amenities = [
				Amenity.DIRECTORY,
				Amenity.HORSE_TRAILS,
				Amenity.RESTROOM,
				Amenity.SEATING,
				Amenity.SHELTER,
				Amenity.WATER
			]
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "North 124th Street", zip: "85259")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.599552, longitude: -111.812910)
			locationInstance = new Trailhead(name: "Lost Dog Wash Trailhead", internalName: "lostDog", description: "The Lost Dog Wash Access Area, Located at the north end of 124th Street just beyond Anasazi Elementary School, is one of the major access points for the Preserve. This award winning trailhead provides extensive vehicle and equestrian parking along with a gathering area and and other amenities.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = [Amenity.DIRECTORY]
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "104th St and McDowell Mountain Ranch Rd", zip: "85255")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.626447, longitude: -111.856962)
			locationInstance = new Trailhead(name: "Quartz Trailhead", internalName: "quartz", description: "About 5-miles round trip to and from a quartz outcropping on the western edge of the McDowells. A steady but not steep climb much of the way.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = [
				Amenity.DIRECTORY,
				Amenity.HORSE_TRAILS,
				Amenity.INFORMATION,
				Amenity.RESTROOM,
				Amenity.SHELTER,
				Amenity.WATER
			]
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.FAMILY,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "9809 E McDowell Mountain Ranch Rd", zip: "85260")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.630748, longitude: -111.869698)
			locationInstance = new Trailhead(name: "Westworld Trailhead", internalName: "westworld", description: "The trailhead includes separate parking areas for equestrians and other trail users. Amenities include a water trough and lighting. Riders must fill the water trough.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = []
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.HIKING,
				Activity.CLIMBING
			]
			addressInstance = new StreetAddress(street: "128th St and Paraiso", zip: "85255")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.689148, longitude: -111.801306)
			locationInstance = new Trailhead(name: "Tom's Thumb Trailhead", internalName: "tomsThumb", description: "Offers access to many important features such as Tom's Thumb, Windgate Overlook, Gardener's Wall, Sven Slab, Mesquite Canyon and the Windmill Trail.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = []
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HORSES,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "30301 N Alma School Pkwy", zip: "85262")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.755755, longitude: -111.843926)
			locationInstance = new Trailhead(name: "Brown's Ranch", internalName: "brownsRanch", description: "The Brown's Ranch Trailhead will be the first trailhead to provide access to the northern region of the McDowell Sonoran Preserve.  The Trailhead will be located approximately 1.25 miles north of the intersection of Alma School Parkway and Dynamite Boulevard.", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
			amenities = []
			activities = [
				Activity.BIKING,
				Activity.DOGS,
				Activity.HIKING
			]
			addressInstance = new StreetAddress(street: "136th St North of Via Linda", zip: "85259")
			coordinatesInstance = new GeographicCoordinates(latitude: 33.595192, longitude: -111.786597)
			locationInstance = new Trailhead(name: "136th St Access", internalName: "136thSt", description: "The 136th Street spur is a less traveled and rugged trail that eventually joins the Sunrise Peak Trail. For the suburban hiker, this is a quick way to transition from the safety and sanctity of the gated community to the hot, wild, and deserted desert. Driving through the gates of the entrance brings an immediate change from community to nature as if walking onto a movie set. ", address: addressInstance, coordinates: coordinatesInstance, "amenities": amenities, "activities": activities)
			locationInstance.save(failOnError: true)
		}
	}

	void createNews() {
	}
	
	void createHikes() {
		println "Hikes: ${Hike.count()}"
		if (!Hike.count()) {
			println "Creating Hikes"
			def lostDog = trailheadService.lostDog()
			def gateway = trailheadService.gateway()
			def brownsRanch = trailheadService.brownsRanch()
			def tomsThumb = trailheadService.tomsThumb()
			def bajadaNatureTrail = new Hike(
				name: "Bajada Nature Trail",
				description: "A barrier-free semi-loop trail with a smooth, solid surface; &frac14 and &frac12 mile loops available.",
				noteworthyFeatures: "Interpretive trail with signs explaining many aspects of the Sonoran Desert; beautiful mountain views.",
				directions: "Follow the trail to the...",
				kmlFileName: "BajadaNatureTrail.kml",
				elevationGain: 0,
				roundTripDistance: 0.5
			)
			def horseshoeLoop = new Hike(
				name: "Horseshoe Loop",
				description: "Very gentle loop trail that crosses several small washes; rocky in places.",
				noteworthyFeatures: "Typical bajada vegetation, interesting desert wash crossings, great mountain views.",
				directions: "Follow the trail to the...",
				kmlFileName: "HorseshoeLoop.kml",
				elevationGain: 100,
				roundTripDistance: 1.7
			)
			def inspirationPoint = new Hike(
				name: "Inspiration Point",
				description: "Wide, generally moderate out-and-back hike with a few steep sections; rocky",
				noteworthyFeatures: "Viewpoint off the main trail with expansive views, stone benches.",
				directions: "Follow the trail to the...",
				kmlFileName: "InspirationPoint.kml",
				elevationGain: 1000,
				roundTripDistance: 5.8
			)
			def bellPassWindgatePassLoop = new Hike(
				name: "Bell Pass/Windgate Pass Loop",
				description: "Challenging semi-loop hike with two passes to climb and steep sections; rocky in places.",
				noteworthyFeatures: "Exceptional views eastward from the passes; area east of the passes is little-used and feels remote; different vegetation at different elevations.",
				directions: "Follow the trail to the...",
				kmlFileName: "BellPassWindgatePassLoop.kml",
				elevationGain: 1900,
				roundTripDistance: 9.6
			)
			def gatewayLoop = new Hike(
				name: "Gateway Loop",
				description: "Wide, generally moderate semi-loop trail that climbs/descends steadily; rocky.",
				noteworthyFeatures: "Variety of vistas, parallels a major drainage, crosses a scenic saddle; one of the most popular trails in the Preserve; great wildflowers in spring.",
				directions: "Follow the trail to the...",
				kmlFileName: "GatewayLoop.kml",
				elevationGain: 650,
				roundTripDistance: 4.5
			)
			gateway.addToHikes(bajadaNatureTrail)
			gateway.addToHikes(horseshoeLoop)
			gateway.addToHikes(inspirationPoint)
			gateway.addToHikes(bellPassWindgatePassLoop)
			gateway.addToHikes(gatewayLoop)
			gateway.save(failOnError: true)
			def oldJeepLoop = new Hike(
				name: "Old Jeep Trail",
				description: "Moderate semi-loop trail with steeper sections; very rocky stretches.",
				noteworthyFeatures: "The Old Jeep Trail portion is little-used and feels very remote; passes near several ancient tool-making sites and an WWII-era plane crash site.",
				directions: "Follow the trail to the...",
				kmlFileName: "OldJeepLoop.kml",
				elevationGain: 450,
				roundTripDistance: 4.1
			)
			def taliesinOverlook = new Hike(
				name: "Taliesin Overlook",
				description: "Gentle out-and-back trail that crosses several small washes; rocky in places.",
				noteworthyFeatures: "Taliesin Overlook has extensive views northwest and looks down onto Frank Lloyd Wright's Taliesin West, his winter home and school. Taliesin is still active as a school of architecture.",
				directions: "Follow the trail to the...",
				kmlFileName: "TaliesinOverlook.kml",
				elevationGain: 350,
				roundTripDistance: 4.0
			)
			def sunriseEast = new Hike(
				name: "Sunrise Trail East (from Sunrise Trailhead)",
				description: "Challenging out-and-back hike with many steep sections; rocky in places",
				noteworthyFeatures: "Sunrise Peak is one of very few Preserve peaks with a trail to the top, from which there are expansive views in all directions; beautiful granite formations; lots of spring wildflowers; excellent for fast exercise without the crowds.",
				directions: "Follow the trail to the...",
				kmlFileName: "SunriseEast.kml",
				elevationGain: 1150,
				roundTripDistance: 4.0
			)
			def ringtailLoop = new Hike(
				name: "Ringtail Trail",
				description: "Gentle semi-loop trail with a few moderate sections, several wash crossings; rocky in places.",
				noteworthyFeatures: "Follows a major wash; Lost Dog Overlook has excellent views south and is an ancient tool-making site�some of the rock flakes are from prehistoric tool-making work; great wildflower trail in spring.",
				directions: "Follow the trail to the...",
				kmlFileName: "RingtailLoop.kml",
				elevationGain: 250,
				roundTripDistance: 2.4
			)
			lostDog.addToHikes(oldJeepLoop)
			lostDog.addToHikes(taliesinOverlook)
			lostDog.addToHikes(sunriseEast)
			lostDog.addToHikes(ringtailLoop)
			lostDog.save(failOnError: true)
			def brownsRanchHike = new Hike(
				name: "Brown's Ranch",
				description: "Gentle out-and-back hike on a very wide trail with occasional sandy stretches; crosses one wash.",
				noteworthyFeatures: "Ends at the location of Brown's Ranch, with many ranching structures still visible. This area was used for ranching from the later 1800s until the mid-1950s. Site of Scottsdale Community College Center for Native and Urban Wildlife experiments to determine how best to restore this grazed area. Excellent wildflowers in spring.",
				directions: "Follow the trail to the...",
				kmlFileName: "BrownsRanch.kml",
				elevationGain: 100,
				roundTripDistance: 3.1
			)
			brownsRanch.addToHikes(brownsRanchHike)
			brownsRanch.save(failOnError: true)
			def marcusLandslide = new Hike(
				name: "Marcus Landslide",
				description: "Gentle out-and-back hike with optional small loop; a few moderate sections.",
				noteworthyFeatures: "Interpretive geology trail starting at trailhead and ending beside or on top of the second largest landslide in AZ; remote area with many beautiful rock formations; excellent wildflowers in spring.",
				directions: "Follow the trail to the...",
				kmlFileName: "MarcusLandslide.kml",
				elevationGain: 300,
				roundTripDistance: 3.7
			)
			def tomsThumbEastEndLoop = new Hike(
				name: "Tom's Thumb/East End Loop",
				description: "Extremely challenging semi-loop hike with many very steep and loose sections; three major climbs.",
				noteworthyFeatures: "Exceptional views throughout the hike; dramatic rock formations and changes in rock/trail composition in transition between granitic and metamorphic rock; changes in vegetation and wildflowers as elevation changes; seldom-used sections offer great solitude; crosses one of the few springs in the Preserve.",
				directions: "Follow the trail to the...",
				kmlFileName: "TomsThumbEastEndLoop.kml",
				elevationGain: 2500,
				roundTripDistance: 11.1
			)
			def lookoutViewpoint = new Hike(
				name: "Lookout Viewpoint",
				description: "Challenging out-and-back hike with many very steep and loose sections; spur trail to viewpoint is narrow and rocky.",
				noteworthyFeatures: "Best viewpoint in the McDowell Mountains, with extensive views east and west from top of a cliff; trail crosses boundary between granite and metamorphic rock, with obvious differences in trail composition and nearby rock; spectacular rock formations; unusual vegetation and flowers found only at high elevation.",
				directions: "Follow the trail to the...",
				kmlFileName: "LookoutViewpoint.kml",
				elevationGain: 1100,
				roundTripDistance: 5.7
			)
			tomsThumb.addToHikes(marcusLandslide)
			tomsThumb.addToHikes(tomsThumbEastEndLoop)
			tomsThumb.addToHikes(lookoutViewpoint)
			tomsThumb.save(failOnError: true)
		}
	}
	 
	def createAdSpace() {
	}
		
	def updateSql() {
		/*
		def updateSQL = "update mscmsc.sec_user set lead_steward = 0"
		def db = [url:'jdbc:mysql://mscmsc.clchcirmqiuh.us-west-1.rds.amazonaws.com/mscmsc', user:'root', password:'uni-dev01', driver:'com.mysql.jdbc.Driver']
		def sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
		sql.execute(updateSQL)
		*/ 
	}
	
	def websiteUpdates() {
	}
		
	def destroy = {
	}

}