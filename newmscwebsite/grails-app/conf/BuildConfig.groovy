grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}.war"
grails.project.dependency.resolution = {
	// inherit Grails' default dependencies
	inherits("global") {
		// uncomment to disable ehcache
		// excludes 'ehcache'
	}
	log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
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
	}
	
	plugins {
		build ":tomcat:$grailsVersion"
		build ':release:2.2.1'
		//compile ':app-info-hibernate:0.2'
	}
}
grails.plugin.location.'simple-cms' = "../../simple-cms/simple-cms"
