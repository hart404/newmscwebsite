package newmscwebsite

class VisitorInformationController {
    def index = { 
		[currentView: "planYourVisit"]
	}
	
	def pathFinders = {
		[currentView: "pathFinders"]
	}
	
	def natureGuides = {
		[currentView: "natureGuides"]
	}
	
	def familyPassport = {
		[currentView: "familyPassport"]
	}
	
	def knowBeforeYouGo = {
		[currentView: "knowBeforeYouGo"]
	}
	
	def faqs ={
		[currentView: "faqs"]
	}
}
