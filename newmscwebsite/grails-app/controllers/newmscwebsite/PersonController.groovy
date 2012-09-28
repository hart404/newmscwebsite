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
        [personInstance: new Person(params)]
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
        if (!personInstance.save(flush: true)) {
            render(view: "create", model: [personInstance: personInstance])
            return
        }
		
		updateAuthorities(personInstance, params)
		personInstance.save(flush: true)
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

        [personInstance: personInstance]
    }

    def update() {
		println params
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
		
		if (params.photoId != personInstance?.photo?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			personInstance.photo = photo
		}
		
		updateAuthorities(personInstance, params)
		
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

		flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
        redirect(action: "show", id: personInstance.id)
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
			if (person.authorities.contains(role)) {
				SecUserSecRole.remove(person, role, true)
				if (role.authority == "ROLE_STEWARD") {
					person.hasStewardRole = false
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
	
	def obtainStewardMenu() {
		def stewardMenu = SCMSMenu.findByTitle("Steward")
		if (stewardMenu == null) {
			stewardMenu = new SCMSMenu(title: "Steward")
		}
		stewardMenu
	}
	
	def changePassword() {
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
		basicUpdatePassword(person, "stewardChangePassword")
		redirect(action: "stewardChangePassword")
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
			redirect(action: redirectTo)
			return
		}
		person.password = newPassword
		person.save(failOnError: true, flush: true)
		flash.message = "Password updated"
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
		
		if (params.photoId != personInstance?.photo?.id) {
			def photo = SCMSPhoto.get(params.photoId)
			personInstance.photo = photo
		}
		
		updateAuthorities(personInstance, params)
		
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

		flash.message = "Steward ${personInstance.firstName} ${personInstance.lastName} updated."
		redirect(action: "stewardUpdateDetails")
	}


}
