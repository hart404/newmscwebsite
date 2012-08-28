import newmscwebsite.Activity
import newmscwebsite.Amenity
import newmscwebsite.Category
import newmscwebsite.Event
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Hike
import newmscwebsite.NewsItem
import newmscwebsite.SecRole
import newmscwebsite.SecUser
import newmscwebsite.SecUserSecRole
import newmscwebsite.StreetAddress
import newmscwebsite.Trailhead
import newmscwebsite.TrailheadService

import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat

import simple.cms.SCMSAdSpacePhoto
import simple.cms.SCMSMenu
import simple.cms.SCMSMenuBar
import simple.cms.SCMSMenuItem
import simple.cms.SCMSPhoto


class BootStrap {

	TrailheadService trailheadService
	def springSecurityService

	def init = { servletContext ->
		println "Root directory: ${System.getProperty("user.home")}"
		createRoles()
		createAdminUser()
		createLocations()
		createEvents()
		createNews()
		createHikes()
		createAdSpace()
		createMenus()
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
		visitThePreserve.addToMenuItems(new SCMSMenuItem(title: "Trailheads & Directions", link: "trailhead/mapOfThePreserve"))
		visitThePreserve.addToMenuItems(new SCMSMenuItem(title: "Recreation", link: "content/recreation"))
		visitThePreserve.addToMenuItems(new SCMSMenuItem(title: "PhotoGallery", link: "photoGallery"))
		menuBar.addToMenus(visitThePreserve)
	}
	
	def addPlanYourVisitSubItems(planYourVisit) {
		// Pathfinders, Nature Guides, Family Passport, Know Before You Go
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Pathfinders", link: "content/pathfinders"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Nature Guides", link: "content/natureGuides"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Family Passport", link: "content/familyPassport"))
		planYourVisit.addToMenuItems(new SCMSMenuItem(title: "Know Before You Go", link: "content/knowBeforeYouGo"))
	}
	
	def addAboutUs(menuBar) {
		menuBar.addToMenus(new SCMSMenu(title: "About Us", link: "aboutUs"))
	}
	
	def addEducationAndResearch(menuBar) {
		SCMSMenu educationAndResearch = new SCMSMenu(title: "Education & Research")
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Birds", link: "content/birds"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Small Mammals", link: "content/smallMammals"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Large Mammals", link: "content/largeMammals"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Flora", link: "content/flora"))
		educationAndResearch.addToMenuItems(new SCMSMenuItem(title: "Herpatology", link: "content/herpatology"))
		menuBar.addToMenus(educationAndResearch)
	}
	
	def addVolunteer(menuBar) {
		menuBar.addToMenus(new SCMSMenu(title: "Volunteer", link: "content/volunteer"))
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

	void createEvents() {
		// Create some events
		println "Events: ${Event.count()}"
		if (!Event.count()) {
			println "Creating Events"
			def formatter = DateTimeFormat.forPattern("MM/dd/yyyy HH:mm")
			def today = LocalDate.now()
			def todayFormatter = DateTimeFormat.forPattern("MM/dd/yyyy")
			def event = new Event(title: "Public Hike: Two Mountain Loop", shortDescription: "Two Mountain Loop",
					moreInformation: "Two Mountain Loop. This 8 mile hike around Cone Mountain and Brown's Mountain reveals a wide variety of Sonoran Desert plants and rock formations. Little elevation change but many slippery ups and downs. Allow 5 hours. Bring lunch. Please arrive at the Brown's Ranch Trailhead by 8:45 am.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(2)) + " 9:00"),
					location: trailheadService.brownsRanch())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FITNESS)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: All Things Arizona", shortDescription: "All Things Arizona",
					moreInformation: "This hike on the Old Jeep Trail is a wonderful celebration of Arizona's 100th birthday and ties in beautifully with fourth grade Arizona heritage curriculum. Learn about the state flower, state tree, state bird, and more. This 4 mile hike on a trail that feels very remote and has beautiful views. Moderate uphill sections, some of it on rocky terrain. Allow 3 hours. Please arrive at the Lost Dog Wash Trailhead by 8:45 am. Appropriate for ages 8 and up.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(3)) + " 9:00"),
					location: trailheadService.lostDog())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: Hiking Equipment and Technique", shortDescription: "Hiking Equipment and Technique",
					moreInformation: "Learn how to make your hiking experience more pleasurable with the proper equipment and supplies, how to pace yourself, and even learn the difference between a stick and a pole on this approximate 4 mile hike. Mostly gradual inclines with a couple of short steep areas. Allow 2 hours. Please arrive at Gateway Trailhead by 8:45 am. Appropriate for ages 8 and up.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(6)) + " 9:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.save(failOnError: true)
			event = new Event(title: "Herpetology Survey Training", shortDescription: "Training for reptile portion of the flora & fauna survey",
					moreInformation: "Dave Weber, Principal Investigator for the reptile & amphibian portion of the flora & fauna baseline survey, will be holding a training on safety and data collection methods. This is a mandatory training if you wish to participate in the reptile project. Location TBD",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(10)) + " 10:00"))
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.save(failOnError: true)
			event = new Event(title: "First Friday Family Series", shortDescription: "Crawly Creatures of the Sonoran Desert",
					moreInformation: "More reptiles, please! Ranger Amy Ford from the McDowell Mountain Regional Park next door brings her collection of snakes and desert tortoise to share with us. What a nice neighbor!",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(14)) + " 16:30"),
					showOnHomePage: true, location: trailheadService.gateway())
			event.addToCategories(Category.FAMILY)
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.save(failOnError: true)
			event = new Event(title: "Trailside Naturalist", shortDescription: "Take a guided tour through aspects of the preserve's fauna and flora",
					moreInformation: "'Plants and wildflowers of the Preserve.' Trailside Naturalist station at the jct. of the Bajada Nature Trail and amphitheater",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(18)) + " 9:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Trailside Naturalist", shortDescription: "Take a guided tour through aspects of the preserve's fauna and flora",
					moreInformation: "'Plants and wildflowers of the Preserve.' Trailside Naturalist station at the jct. of the Bajada Nature Trail and amphitheater",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(8)) + " 9:00"),
					showOnHomePage: true, location: trailheadService.gateway())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: Wildflowers on the Old Jeep Trail", shortDescription: "Come see the preserve's wonderful display of wildflowers",
					moreInformation: "Wildflowers on the Old Jeep Trail A 4 mile hike on a remote, peaceful trail with beautiful views and wildflower identification. Moderate uphill sections, some of it on rocky terrain. Allow 3 hours. Please arrive at the Lost Dog Wash Trailhead by 7:45 am. Appropriate for ages 8 and up.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(8)) + " 8:00"),
					location: trailheadService.lostDog())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: Marcus Landslide", shortDescription: "Witness the largest landslide in Arizona!",
					moreInformation: "Marcus Landslide Pre-registration required. A moderate 4 mile hike to the second largest landslide in Arizona on the east side of East End mountain including a discussion of the geological history of the area. This 2 hour hike is suitable for all hikers. Please arrive at Brown's Ranch Trailhead by 7:45 am. Maximum 20 people. Call Jill at 480-998-7971 x104 to pre-register. ",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(8)) + " 8:00"),
					location: trailheadService.brownsRanch())
			event.addToCategories(Category.HIKE)
			event.save(failOnError: true)
			event = new Event(title: "Trailside Naturalist", shortDescription: "Take a guided tour through aspects of the preserve's fauna and flora",
					moreInformation: "Stop by the Trailside Naturalist Station for a 'Taste of the Desert'. Master Steward Alice Demetra puts out a culinary spread of edible cacti. Learn about how you can incorporate these spiny plants into your diet. Trailside Naturalist station at jct. of Bajada Nature Trail and amphitheater.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(20)) + " 9:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Photo Workshop", shortDescription: "Photo Workshop Part I",
					moreInformation: "Join expert outdoor photographer and Conservancy steward Richard Buchbinder for a two-day photography workshop in the McDowell Sonoran Preserve that will both sharpen your artistic eye and technical skills with your camera.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(22)) + " 17:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.addToCategories(Category.SPECIAL_EVENT)
			event.save(failOnError: true)
			event = new Event(title: "Photo Workshop", shortDescription: "Photo Workshop Part II",
					moreInformation: "Join expert outdoor photographer and Conservancy steward Richard Buchbinder for a two-day photography workshop in the McDowell Sonoran Preserve that will both sharpen your artistic eye and technical skills with your camera.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(24)) + " 6:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.addToCategories(Category.SPECIAL_EVENT)
			event.save(failOnError: true)
			event = new Event(title: "Flying insect survey training", shortDescription: "Learn how to do real research into creepy crawlies",
					moreInformation: "Presentation followed by in-the-field training led by Principal Investigator, Ron Rutowski. Location TBD. Please contact Lesley@mcdowellsonoran.org or at x 105 for details.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(28)) + " 10:00"),
					location: trailheadService.gateway())
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: Wildflower Walk on Sunrise Trail", shortDescription: "Come see the preserve's wonderful display of wildflowers",
					moreInformation: "Wildflower Walk on Sunrise Trail Join Botany Expert, Steve Jones and photographer/author of Wildflowers and More Marianne Skov Jensen as we hunt for wildflowers on the Sunrise Trail. Along the way, you'll hear interesting tidbits about the wildflowers we find and also learn simple tips for taking better flower photos. A 3 mile hike on gently but steadily rising terrain, with a few steeper areas. Poles recommended. Allow 3 1/2 hours. Please arrive at Ringtail Trailhead by 7:45 am. Appropriate for children ages 8 and up",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(30)) + " 8:00"),
					location: trailheadService.ringtail())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
			event = new Event(title: "Public Hike: Birding in the Preserve", shortDescription: "Join us for a light hike and learn about some of the preserve's birds.",
					moreInformation: "Birding in the Preserve This 3 mile hike (it may be less depending on what we see) follows the Quartz Trail and the Paradise Trail up Ironwood Wash and allows for seeing and hearing a variety of desert birds. Allow 2 hours. Please arrive at the Quartz Trailhead by 7:45 am. Appropriate for ages 10 and up. Please note that this is a birding hike that involves lots of stopping and starting. Expect that you will spend 2/3 of the time stationary.",
					startTime: formatter.parseDateTime(todayFormatter.print(today.plusDays(31)) + " 8:00"),
					showOnHomePage: true, location: trailheadService.gateway())
			event.addToCategories(Category.HIKE)
			event.addToCategories(Category.CLASS_OR_LECTURE)
			event.addToCategories(Category.FAMILY)
			event.save(failOnError: true)
		}
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
			addressInstance = new StreetAddress(street: "11300 N Alma School Pkwy", zip: "85262")
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
		println "News: ${NewsItem.count()}"
		if (!NewsItem.count()) {
			def displayStartDate = LocalDate.now()
			def displayEndDate = displayStartDate.plusYears(4)
			println "Creating News Items"
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Office Administrator Position", summary: "The Conservancy is seeking a part-time Office Administrator.", moreInformation: "Nancy Howe is retiring to become a full-time steward, and the Conservancy is looking to fill the position of part-time office administrator. This is a five-day, 20 hour per week position. The job description is available here. To apply, please send a cover letter with resume to Conservancy Office Administration. Review of applications will begin the week of February 6.", important: true).save(failOnError: true)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Photo Workshops February and March 2012", summary: "Join expert outdoor photographer and Conservancy steward Richard Buchbinder for a two-day photography workshop in the McDowell Sonoran Preserve.", moreInformation: "Join expert outdoor photographer and Conservancy steward Richard Buchbinder for a two-day photography workshop in the McDowell Sonoran Preserve that will both sharpen your artistic eye and technical skills with your camera. You will learn how to make better photographs and have fun in the process. The Saturday session in the Preserve includes individual attention for each participant. From novice to more experienced photographers, there is something for everyone. Please call 480-998-7971 ext. 102 to register.", important: true).save(failOnError: true)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Become a Conservancy Volunteer", summary: "Sign up for the next volunteer orientation (March 3rd and 10th) and make an impact on your community. You'll learn about the Conservancy, the Preserve, and all the ways you can help care for our living treasure. Everyone's welcome. We have indoor and outdoor work and are ADA compliant. Call today and get started", moreInformation: "Conservancy's Volunteers, called Stewards, Play a Vital Role in the Preserve. Become a McDowell Sonoran Conservancy Steward. Work hard, have fun, and make an impact on your community. The Conservancy volunteers champion the preservation of open space, steward the McDowell Sonoran Preserve, and engage the community in preserving our environment. What we all have in common is our passion for nature and a desire to make our community a better place.", important: true).save(failOnError: true)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Conservancy Office Hours", summary: "We are open Monday through Friday, 9 - 4. Call us at 998.7971.", moreInformation: "Thank you for visiting our website. If you would like to contact us, please see the information below. For questions about volunteering: Jill@mcdowellsonoran.org. For questions about making a gift: Molly@mcdowellsonoran.org. For any other question: Nancy@mcdowellsonoran.org", important: false).save(failOnError: false)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Natural History I Class (March Session)", summary: "Open to the Public! An intimate look at the McDowells", moreInformation: "Natural History I consists of four 90-minute modules covering the geology of central Arizona, the ecology of the Sonoran Desert, and the plants and animals that are common in the Preserve. There will be two sessions in the morning and two in the afternoon with a long lunch break in between. Bring water, snacks, and plan to either bring your lunch or go off-campus. All of the material for the four sessions is available on the Conservancy website; please download a set before class if you want to take notes on the slides.", important: false).save(failOnError: false)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "Natural History II Class (April Session)", summary: "Open to the Public! An intimate look at the McDowells", moreInformation: "Natural History II consists of four 90-minute modules covering the geology of central Arizona, the ecology of the Sonoran Desert, and the plants and animals that are common in the Preserve. There will be two sessions in the morning and two in the afternoon with a long lunch break in between. Bring water, snacks, and plan to either bring your lunch or go off-campus. All of the material for the four sessions is available on the Conservancy website; please download a set before class if you want to take notes on the slides.", important: false).save(failOnError: false)
			new NewsItem(displayStartDate: displayStartDate, displayEndDate: displayEndDate, title: "New Steward Orientation", summary: "Be a Steward of the McDowell Sonoran Preserve!", moreInformation: "Work hard, have fun, and make an impact on your community. Conservancy volunteers champion the preservation of open space, steward the McDowell Sonoran Preserve, and engage the community in preserving our environment. What we all have in common is our passion for nature and a desire to make our community a better place.", important: false).save(failOnError: false)
		}
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
				noteworthyFeatures: "Taliesin Overlook has extensive views northwest and looks down onto Frank Lloyd Wright’s Taliesin West, his winter home and school. Taliesin is still active as a school of architecture.",
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
				noteworthyFeatures: "Follows a major wash; Lost Dog Overlook has excellent views south and is an ancient tool-making site—some of the rock flakes are from prehistoric tool-making work; great wildflower trail in spring.",
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
		println "Ad Space Photos: ${SCMSAdSpacePhoto.count()}"
		if (!SCMSAdSpacePhoto.count()) {
			println "Creating Adspace Images"
			def serverURL = "http://newmscwebsite.cloudfoundry.com"
			def adSpacePath = "images/adspace" 
			def gatewayKids = new SCMSPhoto(description: "Gateway Kids", source: serverURL, path: adSpacePath, originalFileName: "LR_Gateway kids_1736.jpg", fileName: "LR_Gateway kids_1736.jpg", width: 1194, height: 403, keywords: ["adspace"], allKeywords: "adspace", artist: "Phil", copyright: "None")
			gatewayKids.save(failOnError: true, flush: true)
			def gatewayWindgate = new SCMSPhoto(description: "Gateway Windgate", source: serverURL, path: adSpacePath, originalFileName: "LR_Gateway-Windgate Trails.jpg", fileName: "LR_Gateway-Windgate Trails.jpg", width: 1194, height: 403, keywords: ["adspace"], allKeywords: "adspace", artist: "Phil", copyright: "None")
			gatewayWindgate.save(failOnError: true, flush: true)
			def hummer = new SCMSPhoto(description: "Hummer at Rest", source: serverURL, path: adSpacePath, originalFileName: "LR_Hummer at Rest.jpg", fileName: "LR_Hummer at Rest.jpg", width: 1194, height: 403, keywords: ["adspace"], allKeywords: "adspace", artist: "Phil", copyright: "None")
			hummer.save(failOnError: true, flush: true)
			def stewards = new SCMSPhoto(description: "Steward Discussion", source: serverURL, path: adSpacePath, originalFileName: "LR_mjensen-survey-insect-lost-dog-3403.jpg", fileName: "LR_mjensen-survey-insect-lost-dog-3403.jpg", width: 936, height: 288, keywords: ["adspace"], allKeywords: "adspace", artist: "Barry White", copyright: "All Rights Reserved")
			stewards.save(failOnError: true, flush: true)
			def mcdowells = new SCMSPhoto(description: "View from the McDowells", source: serverURL, path: adSpacePath, originalFileName: "LR_100_4004.jpg", fileName: "LR_100_4004.jpg", width: 936, height: 288, keywords: ["adspace"], allKeywords: "adspace", artist: "Barry White", copyright: "All Rights Reserved")
			mcdowells.save(failOnError: true, flush: true)
			def gatewayKidsAd = new SCMSAdSpacePhoto(title: "Gateway Kids", link: "supportUs/index", photo: gatewayKids)
			gatewayKidsAd.save(failOnError: true, flush: true)
			def gatewayWindgateAd = new SCMSAdSpacePhoto(title: "Gateway Windgate", link: "volunteer", photo: gatewayWindgate)
			gatewayWindgateAd.save(failOnError: true, flush: true)
			def hummerAd = new SCMSAdSpacePhoto(title: "Hummer at Rest", link: "volunteer", photo: hummer)
			hummerAd.save(failOnError: true, flush: true)
			def stewardsAd = new SCMSAdSpacePhoto(title: "Steward Discussion", link: "aboutUs", photo: stewards)
			stewardsAd.save(failOnError: true, flush: true)
			def mcdowellsAd = new SCMSAdSpacePhoto(title: "View from the McDowells", link: "donate/index", photo: mcdowells)
			mcdowellsAd.save(failOnError: true, flush: true)
		}
	}
	
	def destroy = {
	}

}
