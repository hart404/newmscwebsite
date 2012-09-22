package newmscwebsite

class PersonService {
	
	def getStewards(params) {
		println params
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
			eq("hasStewardRole", true)
		}
		stewardList.size()
	}
	
	def updateStewards() {
		def stewardRole = SecRole.findByAuthority("ROLE_STEWARD")
		def stewards = SecUserSecRole.findAllBySecRole(stewardRole).collect {it.secUser}
		stewards.each { steward ->
			steward.hasStewardRole = true
			steward.save(failOnError: true)
		}
	}

}
