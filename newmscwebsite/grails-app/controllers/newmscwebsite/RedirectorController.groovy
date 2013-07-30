package newmscwebsite

class RedirectorController {
	def paws() {
		redirect(uri: "/content/pages/pawsInThePreserve")
	}
	
	def ranch() {
		redirect(uri: "/content/pages/brownsRanchInterpretiveCenter")
	}
	
	def visit() {
		redirect(uri: "/content/pages/planYourVisit")		
	} 
	
	def hikes() {
		redirect(uri: "/content/pages/guidedHiking")
	}
	
	def steward() {
		redirect(uri: "/content/pages/orientationDates")
	}
	
	def volunteer() {
		redirect(uri: "/content/pages/volunteer")
	}
	
	def freeFamilyFun() {
		redirect(uri: "/event/displayEventCategory/family")
	}
	
	def photoContest() {
		redirect(uri: "/content/pages/contestEntry2")
	}
	
	def kids() {
		redirect(uri: "/content/pages/schoolGroupsAndYouth")
	}
	
	def women() {
		redirect(uri: "/content/pages/sonoranDesertWomen")
	}
	
	def partners() {
		redirect(uri: "/content/pages/corporatePartners")
	}
	
	def legacy() {
		redirect(uri: "/content/pages/leaveALegacy")
	}

	def preserve() {
		redirect(uri: "/content/pages/visitThePreserve")
	}
	
	def opening() {		
		redirect(uri: "/content/pages/eventInThePreserve")
	}
	
	def maps() {
		redirect(uri: "/content/pages/visitThePreserve")
	}

	def shop() {
		redirect(uri: "/content/pages/visitThePreserve")
	}
	
}
