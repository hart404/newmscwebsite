package newmscwebsite

import org.springframework.dao.DataIntegrityViolationException

import simple.cms.SCMSMenu
import simple.cms.SCMSPhoto

class PersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def personService
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 50, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }

    def create() {
        [personInstance: new Person(params), years: yearRange()]
    }

    def save() {
		println params
		if (params.password == null) {
			params.password = "conservancy"
		}
		
		def keysToRemove = ["street", "apartment", "city", "state", "zip", "homePhone", "cellPhone"]
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
		personInstance.save(flush: true)
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
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
    }

    def edit() {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance, years: yearRange()]
    }

    def update() {
		println params
		
		if (params.username == null || params.username.trim().isEmpty()) {
			flash.error = "Username (your email address) is required."
			redirect(action: "stewardUpdateDetails")
			return
		}
		
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personInstance.version > version) {
                personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'person.label', default: 'Person')] as Object[],
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
		
		def keysToRemove = ["street", "apartment", "city", "state", "zip", "homePhone", "cellPhone"]
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

		flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
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
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        try {
            personInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def registerUser() {
		params
	}
	
	def registerForEmail() {
		params
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
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
			redirect(action: "stewardList")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (personInstance.version > version) {
				personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'person.label', default: 'Person')] as Object[],
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
		
		def keysToRemove = ["street", "apartment", "city", "state", "zip", "homePhone", "cellPhone"]
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

}
