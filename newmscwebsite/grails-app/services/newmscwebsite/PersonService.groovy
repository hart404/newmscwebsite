package newmscwebsite

class PersonService {
	
	def getStewards(params) {
		if (params.sort == "email") {
			params.sort = "username"
		}
		def stewardRole = SecRole.findByAuthority("ROLE_STEWARD")
		def criteria = Person.createCriteria()
		def stewards = criteria {
			if (params.firstName) {
				ilike("firstName", "${params.firstName}%")
			}
			if (params.lastName) {
				ilike("lastName", "${params.lastName}%")
			}
			if (params.classNumber) {
				eq("classNumber", "${params.classNumber}")
			}
			eq("hasStewardRole", true)
			firstResult(params.offset as Integer ?: 0)
			maxResults(params.max as Integer?: 50)
			order("${params.sort}", "${params.order}")
		}
		stewards
	}
	
	def countAllStewards(params) {
		def criteria = Person.createCriteria()
		def stewardList = criteria {
			if (params.firstName) {
				ilike("firstName", "${params.firstName}%")
			}
			if (params.lastName) {
				ilike("lastName", "${params.lastName}%")
			}
			if (params.classNumber) {
				eq("classNumber", "${params.classNumber}")
			}
			eq("hasStewardRole", true)
		}
		stewardList.size()
	}
	
	def getNonStewards(params) {
		if (params.sort == "email") {
			params.sort = "username"
		}
		def stewardRole = SecRole.findByAuthority("ROLE_STEWARD")
		def criteria = Person.createCriteria()
		def stewards = criteria {
			if (params.firstName) {
				ilike("firstName", "${params.firstName}%")
			}
			if (params.lastName) {
				ilike("lastName", "${params.lastName}%")
			}
			if (params.classNumber) {
				eq("classNumber", "${params.classNumber}")
			}
			eq("hasStewardRole", false)
			firstResult(params.offset as Integer ?: 0)
			maxResults(params.max as Integer?: 50)
			order("${params.sort}", "${params.order}")
		}
		stewards
	}
	
	def countAllNonStewards(params) {
		def criteria = Person.createCriteria()
		def stewardList = criteria {
			if (params.firstName) {
				ilike("firstName", "${params.firstName}%")
			}
			if (params.lastName) {
				ilike("lastName", "${params.lastName}%")
			}
			if (params.classNumber) {
				eq("classNumber", "${params.classNumber}")
			}
			eq("hasStewardRole", false)
		}
		stewardList.size()
	}
	
	def getStewardsWithInterest(interest, offset, max) {
		Person.executeQuery(
			'select p from Person p where :myInterest in elements(p.interests)',
			[myInterest: interest as String], [offset: offset, max: max])
	}
	
	def countPeopleWithInterest(interest) {
		Person.executeQuery(
			'select count(*) from Person p where :myInterest in elements(p.interests)',
			[myInterest: interest as String])[0]
	}
	
}
