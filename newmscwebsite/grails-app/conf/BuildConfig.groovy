grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
//grails.project.war.file = "target/${appName}.war"

//forkConfig = [maxMemory: 1024, minMemory: 64, debug: false, maxPerm: 256]
//grails.project.fork = [
//   test: false, // configure settings for the test-app JVM
//   run: false, // configure settings for the run-app JVM
////   war: forkConfig, // configure settings for the run-war JVM
////   console: forkConfig // configure settings for the Swing console JVM
//]

grails.project.dependency.resolution = {
	// inherit Grails' default dependencies
	inherits("global") {
		// uncomment to disable ehcache
		// excludes 'ehcache'
	}
	log "verbose" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
	repositories {
		grailsPlugins()
		grailsHome()
		grailsCentral()

		// uncomment the below to enable remote dependency resolution
		// from public Maven repositories
		mavenLocal()
		mavenCentral()
		mavenRepo "http://snapshots.repository.codehaus.org"
		mavenRepo "http://repository.codehaus.org"
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repository.jboss.com/maven2/"
		mavenRepo "http://repo.springsource.org/milestone"
		mavenRepo "http://mavenrepo.google-api-java-client.googlecode.com/hg"
	}

	dependencies {
		// specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
		compile "org.jadira.usertype:usertype.jodatime:1.9"
		runtime 'mysql:mysql-connector-java:5.1.19'
		compile 'net.java.dev.jets3t:jets3t:0.9.0'
		compile 'org.apache.httpcomponents:httpclient:4.1.2'
		compile 'net.authorize:anet-java-sdk:1.4.6'
		runtime 'org.springframework:spring-test:3.2.6.RELEASE'
	}

	plugins {
		build ":tomcat:7.0.47"
		// build ':release:2.2.1'
		// compile ':app-info-hibernate:0.2'
		compile ":scaffolding:2.0.1"
        runtime ":hibernate:3.6.10.4"
        runtime ":jquery:1.10.2"
        runtime ":resources:1.2.1"
		compile ":jquery-ui:1.8.24"
		compile ":spring-security-core:1.2.7.3"
		compile ":spring-security-ui:0.2"
		compile ":famfamfam:1.0.1"
		compile ':mail:1.0.1', {
			excludes "spring-test"
		}
		compile ":ckeditor:3.6.3.0"
		compile ":csv:0.3.1"
		// runtime ":database-migration:1.3.y"
		compile ":richui:0.8"
		compile ":google-analytics:2.0"
		compile ":searchable:0.6.9"
		compile ":joda-time:1.5"
		compile ":authorize-net:0.12"
        test ":greenmail:1.3.4"
	}
}
grails.plugin.location.'simple-cms' = "../../simple-cms/simple-cms"
grails.plugin.location.cors = "../../grails-cors"

