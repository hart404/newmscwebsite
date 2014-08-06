package newmscwebsite

import grails.converters.JSON
import org.mcdowellsonoran.notification.NotificationType
import org.mcdowellsonoran.volunteersession.VolunteerSession

import java.text.DateFormat
import java.text.SimpleDateFormat

import javax.net.ssl.HttpsURLConnection

import org.joda.time.LocalDate
import org.springframework.dao.DataIntegrityViolationException

import simple.cms.SCMSMenu
import simple.cms.SCMSPhoto

import com.vinomis.authnet.AuthorizeNet

class PersonController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def personService
	def volunteerSessionService
	def springSecurityService


	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		println "Params: ${params}"
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		def people = Person.list(params)
		def peopleCount = Person.count()
		[personInstanceList: people, personInstanceTotal: peopleCount]
	}

	def create() {
		[personInstance: new Person(params), years: yearRange()]
	}

	def save() {
		if (params.password == null) {
			params.password = "conservancy"
		}

		def keysToRemove = [
			"street",
			"apartment",
			"city",
			"state",
			"zip",
			"homePhone",
			"cellPhone"
		]
		def newParams = [:]
		params.each {
			if (!(it.key in keysToRemove)) {
				newParams[it.key] = it.value
			}
		}

		def personInstance = new Person(newParams)

		def address = new StreetAddress(params)
		personInstance.address = address

		if (!params.homePhone.isEmpty()) {
			def homePhone = new Phone(number: params.homePhone)
			personInstance.homePhone = homePhone
		}
		if (!params.cellPhone.isEmpty()) {
			def cellPhone = new Phone(number: params.cellPhone)
			personInstance.cellPhone = cellPhone
		}

		if (params.photoId) {
			def photo = SCMSPhoto.get(params.photoId)
			personInstance.photo = photo
		}

		// The person needs to be be saved before you can update authorities
		// because creation of the role relationship requires an ID!
		personInstance.save(flush: true, failOnError: true)
		updateAuthorities(personInstance, params)

		if (!personInstance.save(flush: true)) {
			render(view: "create", model: [personInstance: personInstance])
			return
		}

		flash.message = "${personInstance} Updated"
		redirect(action: "show", id: personInstance.id)
	}

	def show() {
		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[personInstance: personInstance]
	}

	def edit() {
		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[personInstance: personInstance, years: yearRange()]
	}

	def update() {
		if (params.username == null || params.username.trim().isEmpty()) {
			flash.error = "Username (your email address) is required."
			redirect(action: "stewardUpdateDetails")
			return
		}

		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (personInstance.version > version) {
				personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'person.label', default: 'Person')] as Object[],
						"Another user has updated this Person while you were editing")
				render(view: "edit", model: [personInstance: personInstance])
				return
			}
		}

		def emailChanged = params.username != personInstance.username

		if (params.photoId != personInstance?.photo?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			personInstance.photo = photo
		}

		updateAuthorities(personInstance, params)
		updateInterests(personInstance, params)

		def address = new StreetAddress(params)
		if (address != personInstance.address) {
			personInstance.address = address
		}

		if (!params.homePhone.isEmpty() && params.homePhone != personInstance.homePhone.number) {
			def homePhone = new Phone(number: params.homePhone)
			personInstance.homePhone = homePhone
		}
		if (!params.cellPhone.isEmpty() && params.cellPhone != personInstance.cellPhone.number) {
			def cellPhone = new Phone(number: params.cellPhone)
			personInstance.cellPhone = cellPhone
		}

		def keysToRemove = [
			"street",
			"apartment",
			"city",
			"state",
			"zip",
			"homePhone",
			"cellPhone"
		]
		def newParams = [:]
		params.each {
			if (!(it.key in keysToRemove)) {
				newParams[it.key] = it.value
			}
		}
		personInstance.properties = newParams

		if (!personInstance.save(flush: true)) {
			render(view: "edit", model: [personInstance: personInstance])
			return
		}

		if (emailChanged) {
			flash.message = "If you change your email address, you must also change your password."
			redirect(action: "changePassword", id: params.id)
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'person.label', default: 'Person'),
			personInstance.id
		])
		redirect(action: "show", id: personInstance.id)
	}

	def updateInterests(person, params) {
		Interest.interestMap.each { entry ->
			updateInterest(person, params[entry.key], entry.value)
		}
	}

	def updateInterest(person, onOff, interest) {
		if (onOff == "on") {
			if (!person.interests.contains(interest)) {
				person.addToInterests(interest)
			}
		}
		if (onOff == null) {
			if (person.interests.contains(interest)) {
				person.removeFromInterests(interest)
			}
		}
	}

	def updateAuthorities(person, params) {
		def rolesMap = createRolesMap()
		rolesMap.each { entry ->
			updateAuthority(person, params[entry.key], entry.value)
		}
	}

	def updateAuthority(person, onOff, role) {
		if (onOff == "on") {
			if (!person.authorities.contains(role)) {
				SecUserSecRole.create(person, role, true)
				if (role.authority == "ROLE_STEWARD") {
					person.hasStewardRole = true
				}
			}
		}
		if (onOff == null) {
			// The presence of the field _role_admin (or whatever) is an indication that the
			// corresponding checkbox was on the form
			if (params.containsKey('_' + role.authority.toLowerCase())) {
				if (person.authorities.contains(role)) {
					SecUserSecRole.remove(person, role, true)
					if (role.authority == "ROLE_STEWARD") {
						person.hasStewardRole = false
					}
				}
			}
		}
	}

	def createRolesMap() {
		def roles = SecRole.list()
		def rolesMap = [:]
		roles.each { role ->
			rolesMap[role.authority.toLowerCase()] = role
		}
		rolesMap
	}

	def delete() {
		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "list")
			return
		}

		try {
			personInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "show", id: params.id)
		}
	}

	def registerUser() {
		def jsonObj = JSON.parse(params.data)
		try {
			//println("apikey"+grailsApplication.config.constant_contact.apikey)
			//println("accesstoken"+grailsApplication.config.constant_contact.accesstoken)
			TimeZone tz = TimeZone.getTimeZone("UTC");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
			df.setTimeZone(tz);
			String nowAsISO = df.format(new Date());
			//System.out.println("nowAsISO"+nowAsISO);
			String url = "https://api.constantcontact.com/v2/contacts?api_key=" + grailsApplication.config.constant_contact.apikey + "&access_token=" + grailsApplication.config.constant_contact.accesstoken;
			URL obj = new URL(url);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
			//			String headerAcessToken="Bearer 426c3d83-db35-4cd4-8aff-11dd1efa5983";
			//add request header
			con.setRequestMethod("POST");
			//			con.setRequestProperty("Authorization", headerAcessToken);
			con.setRequestProperty("Action-By", "ACTION_BY_OWNER");
			con.setRequestProperty("Content-Type", "application/json");
			//			String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";
			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(getJSONObject("2","VISITOR","ACTION_BY_OWNER",nowAsISO,jsonObj.email_address,jsonObj.firstname,jsonObj.lastname,jsonObj.companyname));
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			println("\nSending 'POST' request to URL : " + url);
			println("Post parameters : " + getJSONObject("2","VISITOR","ACTION_BY_OWNER",nowAsISO,jsonObj.email_address,jsonObj.firstname,jsonObj.lastname,jsonObj.companyname));
			println("Response Code : " + responseCode);

			if (responseCode == 201) {
				def message = "You successfully subscribed "
				chain(controller:"home" ,action: "index", model: [message:message])
			}

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = bufferedReader.readLine()) != null) {
				response.append(inputLine);
			}
			bufferedReader.close();


			println(response.toString());

		} catch (Exception e) {
			// TODO: handle exception
			if(e.getMessage().contains("Server returned HTTP response code: 409")){
				def message = "You are already subscribed "
				chain(controller:"home" ,action: "index", model: [message:message])
			}
		}
	}


	String getJSONObject(String listid, String status, String optSource, String optDate, String emailAddress, String first_name, String last_name, String company_name ) {
		def _mainjsonObject = [:]
		def idjsonObject = [:]
		idjsonObject.id = listid

		def jsonArray = []
		jsonArray << idjsonObject

		_mainjsonObject.lists = jsonArray

		def emailjsonArray = []
		def emailjsonObject = [:]
		emailjsonObject.status = status
		emailjsonObject.opt_in_source = optSource
		emailjsonObject.opt_in_date = optDate
		emailjsonObject.email_address = emailAddress

		emailjsonArray << emailjsonObject

		_mainjsonObject.email_addresses = emailjsonArray
		_mainjsonObject.first_name = first_name
		_mainjsonObject.last_name = last_name
		_mainjsonObject.company_name = company_name
		return _mainjsonObject as JSON
	}

	def test() {

		def s = new AuthorizeNet()
		s.authorizeAndCapture {
			amount '100.00'
			ccNumber '370000000000002'
			cvv '122'
			ccExpDate '012011'
			email 'john@acme.com'
			invoiceId '123'
		}
		def anr = s.submit()
		println("authoooooooooooooo::::"+ anr)

	}

	def registerForEmail() {
		params
	}

	def stewardReporting() {
	}
	
	def stewardReportingNew() {	
		def programsToShow = ProgramReporting.values().findAll {program -> program.isShowable()}
		[programs: programsToShow,
         notificationTypes: NotificationType.findAll()]
	}

    def saveReport() {
        VolunteerSession volunteerSession2 = new VolunteerSession(params)
        volunteerSession2.person = Person.get(springSecurityService.currentUser.id)
        volunteerSession2.date = new LocalDate(params.date_year as int, params.date_month as int, params.date_day as int)
    }

	def stewardList() {
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		params.sort = params.sort ?: "firstName"
		[stewards: personService.getStewards(params), stewardCount: personService.countAllStewards(params), menu: obtainStewardMenu()]
	}

	def nonStewardList() {
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		params.sort = params.sort ?: "firstName"
		[stewards: personService.getNonStewards(params), stewardCount: personService.countAllNonStewards(params), menu: obtainStewardMenu()]
	}

	def obtainStewardMenu() {
		def stewardMenu = SCMSMenu.findByTitle("Steward")
		if (stewardMenu == null) {
			stewardMenu = new SCMSMenu(title: "Steward")
		}
		stewardMenu
	}

	def changePassword() {
		def person = Person.get(params.id)
		println "Changing password of ${person.username}"
		[personInstance: Person.get(params.id)]
	}

	def stewardChangePassword() {
		[menu: obtainStewardMenu()]
	}

	def stewardUpdateDetails() {
		[personInstance: (Person)springSecurityService.currentUser, menu: obtainStewardMenu()]
	}

	def updateStewardPassword() {
		def person = (Person)springSecurityService.currentUser
		if (basicUpdatePassword(person, "stewardChangePassword")) {
			redirect(action: "stewardChangePassword")
		} else {
			redirect(action: "stewardChangePassword")
		}
	}

	def updatePassword() {
		def person = Person.get(params.id)
		basicUpdatePassword(person, "changePassword")
		redirect(action: 'show', id: person.id)
	}

	def basicUpdatePassword(person, redirectTo) {
		def newPassword = params.newPassword
		def repeatNewPassword = params.repeatNewPassword
		if (newPassword != repeatNewPassword) {
			flash.message = "Passwords do not match"
			return false
		}
		person.password = newPassword
		person.save(failOnError: true, flush: true)
		flash.message = "Password updated"
		return true
	}

	def updateStewardDetails() {
		def personInstance = Person.get(params.id)
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'person.label', default: 'Person'),
				params.id
			])
			redirect(action: "stewardList")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (personInstance.version > version) {
				personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'person.label', default: 'Person')] as Object[],
						"Another user has updated this Person while you were editing")
				render(view: "stewardUpdateDetails", model: [personInstance: personInstance])
				return
			}
		}

		def emailChanged = params.username != personInstance.username

		if (params.photoId != personInstance?.photo?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			personInstance.photo = photo
		}

		def address = new StreetAddress(params)
		if (address != personInstance.address) {
			personInstance.address = address
		}

		if (!params.homePhone.isEmpty() && params.homePhone != personInstance?.homePhone?.number) {
			def homePhone = new Phone(number: params.homePhone)
			personInstance.homePhone = homePhone
		}
		if (!params.cellPhone.isEmpty() && params.cellPhone != personInstance?.cellPhone?.number) {
			def cellPhone = new Phone(number: params.cellPhone)
			personInstance.cellPhone = cellPhone
		}

		updateAuthorities(personInstance, params)
		updateInterests(personInstance, params)

		def keysToRemove = [
			"street",
			"apartment",
			"city",
			"state",
			"zip",
			"homePhone",
			"cellPhone"
		]
		def newParams = [:]
		params.each {
			if (!(it.key in keysToRemove)) {
				newParams[it.key] = it.value
			}
		}
		personInstance.properties = newParams

		if (!personInstance.save(flush: true)) {
			render(view: "stewardUpdateDetails", model: [personInstance: personInstance])
			return
		}

		if (emailChanged) {
			flash.message = "If you change your email address, you must also change your password."
			redirect(action: "changePassword", id: params.id)
			return
		}

		flash.message = "Steward ${personInstance.firstName} ${personInstance.lastName} updated."
		redirect(action: "stewardUpdateDetails")
	}

	def yearRange() {
		def thisYear = (new Date()).getAt(Calendar.YEAR)
		// The minimum age for a steward is 12
		def startYear = thisYear - 12
		// Allow a steward to be 100 years old...
		def endYear = thisYear - 100
		startYear..endYear
	}

	def showInterests() {
		def people = []
		def stewardCount = 0
		def selection = null
		if (params.interest) {
			def offset = params.offset
			def max = params.max
			if (offset) {
				offset = offset as Integer
			} else {
				offset = 0
			}
			if (max) {
				max = max as Integer
			} else {
				max = 50
			}
			selection = params.interest
			def interest = Interest.fromString(params.interest)
			people = personService.getStewardsWithInterest(interest, offset, max)
			stewardCount = personService.countPeopleWithInterest(interest)
		}
		[stewards: people, stewardCount: stewardCount, selection: selection]
	}

	def downloadAsCSV() {
		if (params.interest) {
			response.setHeader "Content-disposition", "attachment; filename=${params.interest}.csv"
			response.contentType = 'text/csv'
			def interest = Interest.fromString(params.interest)
			createCSVFileForInterest(interest, response.outputStream)
			response.outputStream.flush()
		} else {
			flash.message = "Please specify an interest"
			redirect(controller: 'person', action: 'showInterests')
		}
	}

	def createCSVFileForInterest(interest, outputStream) {
		def people = personService.getStewardsWithInterest(interest, 0, 100000)
		people.each { Person person ->
			outputStream << "'${person.firstName}',"
			outputStream << "'${person.lastName}',"
			outputStream << "'${person.username}'"
			outputStream << "\n"
		}
	}
	
	def showBulkReporting(Long id) {
		def steward = Person.get(id)
		[steward: steward, programs: ProgramReporting.values()]
	}
	
	def saveBulkReporting() {
		def programs = params.list('program').findAll{program -> program != 'null'}
		def hours = params.list('hours')
		def steward = Person.get(params.stewardId)
		programs.eachWithIndex { program, index ->
			def year = params."reportingDate${index + 1}_year" as Integer
			def month = params."reportingDate${index + 1}_month" as Integer
			def day = params."reportingDate${index + 1}_day" as Integer
			def date = new LocalDate(year, month, day)
			def volunteerSession = new VolunteerSession(person: steward, hours: hours[index] as BigDecimal, date: date, program: program)
			volunteerSession.save(failOnError: true)
		}
		render(view: "showStewardReportingSummary", model: stewardReportingData(steward))
	}
	
	def showIndividualStewardReportingSummary() {
		def steward = Person.get(params.id)
		render(view: "showStewardReportingSummary", model: stewardReportingData(steward))
	}
	
	def showStewardReportingSummary() {
		def steward = (Person)springSecurityService.currentUser
		stewardReportingData(steward)
	}
	
	def stewardReportingData(steward) {
		def total = volunteerSessionService.totalHoursForSteward(steward)
		def totalYTD = volunteerSessionService.totalHoursForStewardYearToDate(steward)
		def byProgram = volunteerSessionService.totalHoursForStewardByProgram(steward)
		def byProgramYTD = volunteerSessionService.totalHoursForStewardByProgramYearToDate(steward)
		def volunteerSessionsBySteward = volunteerSessionService.sessionsBySteward(steward, params)
		def volunteerSessionsByStewardCount = volunteerSessionService.countSessionsBySteward(steward)
		[steward: steward, total: total, totalYTD: totalYTD, byProgram: byProgram, byProgramYTD: byProgramYTD, volunteerSessions: volunteerSessionsBySteward, volunteerSessionsCount: volunteerSessionsByStewardCount]
	}

}

