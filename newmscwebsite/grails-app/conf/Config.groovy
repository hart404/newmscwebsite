// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

grails.config.locations = []
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

ResourceLoader resourceLoader = new DefaultResourceLoader()
def addConfig = { path->
	Resource resource = resourceLoader.getResource(path)
	if (resource.exists()) {
		// There is no log at this point so just print a message on the console that the CSO
		// CONFIG path was found/not found but without specifying the actual path.
		println "CONFIG found ${path}"
		grails.config.locations << path
	} else {
		println "CONFIG did not find ${path}!"
	}
}
addConfig("classpath:SecretConfig.properties")


grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = false // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// set per-environment serverURL stem for creating absolute links
environments {
	development {
		grails.serverURL = "http://localhost:8080/${appName}"
		grails.plugins.springsecurity.portMapper.httpPort = "8080"
		grails.plugins.springsecurity.portMapper.httpsPort = "8443"
	}
	test {
		grails.serverURL = "http://localhost:8080/${appName}"
	}
	production {
		grails.serverURL = "http://www.mcdowellsonoran.org"
		grails.plugins.springsecurity.portMapper.httpPort = "80"
		grails.plugins.springsecurity.portMapper.httpsPort = "443"
	}
	phil {
		grails.serverURL = "http://www.mcdowellsonoran.org"
		grails.plugins.springsecurity.portMapper.httpPort = "80"
		grails.plugins.springsecurity.portMapper.httpsPort = "443"
	}

}

// log4j configuration
log4j = {
	
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
		console name:'stacktrace', layout:pattern(conversionPattern: '%c{2} %m%n')
		console name:'errors', layout:pattern(conversionPattern: '%c{2} %m%n')
    }
	
    error  	'org.codehaus.groovy.grails.web.servlet',  //  controllers
           	'org.codehaus.groovy.grails.web.pages', //  GSP
			'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate',
		    'org.apache',
			'org.compass'

    error   'org.mortbay.log'
	
	error	'org.codehaus.groovy.grails.plugins.springsecurity'
	
	info 	'org.springframework.security'
	
	debug 	'newmscwebsite'
	
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'newmscwebsite.SecUser'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'newmscwebsite.SecUserSecRole'
grails.plugins.springsecurity.authority.className = 'newmscwebsite.SecRole'

import grails.plugins.springsecurity.SecurityConfigType

import org.springframework.core.io.DefaultResourceLoader
import org.springframework.core.io.Resource
import org.springframework.core.io.ResourceLoader
import grails.plugins.springsecurity.SecurityConfigType

grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.interceptUrlMap = [
	'/login/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/logout/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/denied':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/register/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/person/registerUser/**':			['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/person/registerForEmail/**':		['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/*.html':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/*.xml':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/*.gsp':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/css/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/js/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/images/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/html/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/maps/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/pdfs/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/docs/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/home/**':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/content/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/ranch':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/paws':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/visit':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/hikes':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/photocontest':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/steward':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/volunteer':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/freefamilyfun':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/kids':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/women':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/partners':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/legacy':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/*/list/**':						['IS_AUTHENTICATED_REMEMBERED'],
	'/*/create/**':						['IS_AUTHENTICATED_REMEMBERED'],
	'/*/save/**':						['IS_AUTHENTICATED_REMEMBERED'],
	'/*/update/**':						['IS_AUTHENTICATED_REMEMBERED'],
	'/*/delete/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/event/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/donate/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/newsItem/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/trailhead/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/person/**':						['IS_AUTHENTICATED_REMEMBERED'],
	'/photo/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/adSpacePhoto/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/trailhead/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/gallery/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/lightbox/**':						['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/plugins/*/js/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/plugins/*/css/**':				['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/plugins/*/jquery-ui/js/**':		['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/plugins/*/jquery-ui/themes/**':	['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/':								['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/error':							['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/**':								['IS_AUTHENTICATED_REMEMBERED'],
]

grails.plugins.springsecurity.secureChannel.definition = [
	'/donate/**':       				'REQUIRES_SECURE_CHANNEL',
	'/login/**':						'REQUIRES_SECURE_CHANNEL',
	'/register/**':						'REQUIRES_SECURE_CHANNEL',
	'/person/registerUser/**':			'REQUIRES_SECURE_CHANNEL',
	'/person/registerForEmail/**':		'REQUIRES_SECURE_CHANNEL'
]

grails.plugins.springsecurity.ui.forgotPassword.emailFrom = 'info@mcdowellsonoran.org'
grails.plugins.springsecurity.ui.register.emailFrom = 'info@mcdowellsonoran.org'

grails.plugins.springsecurity.useSecurityEventListener = true
grails.plugins.springsecurity.logout.handlerNames =
	['rememberMeServices',
	 'securityContextLogoutHandler'
	 ]

breadcrumbs.selector="title"

grails.resources.debug = true

grails.views.javascript.library="jquery"

grails.gorm.default.mapping = {
	"user-type" type: org.jadira.usertype.dateandtime.joda.PersistentDateTime, class: org.joda.time.DateTime
	"user-type" type: org.jadira.usertype.dateandtime.joda.PersistentLocalDate, class: org.joda.time.LocalDate
}

grails.plugin.cloudfoundry.showStackTrace = true

grails {
	mail {
	  host = "email-smtp.us-east-1.amazonaws.com"
	  port = 465
	  props = ["mail.smtp.auth":"true",
			   "mail.smtp.socketFactory.port":"465",
			   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
			   "mail.smtp.socketFactory.fallback":"false"]
	}
}

grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/role'






  
