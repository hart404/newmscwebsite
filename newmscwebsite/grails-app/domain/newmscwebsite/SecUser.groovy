package newmscwebsite

class SecUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Date dateCreated
	Date lastUpdated
	
	static transients = ['email']

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password, username)
	}
	
	def getEmail() {
		username
	}
	
	def hasAuthority(String authority) {
		def authoritiesStringList = getAuthorities().collect { role -> role.authority}
		authoritiesStringList.contains(authority)
	}
	
	def hasAuthority(SecRole authority) {
		getAuthorities().contains(authority)
	}
	
}
