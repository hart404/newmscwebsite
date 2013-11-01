/*
 * Copyright 2004-2005 the original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Gant script that generates a CRUD controller and matching views for a all domain classes
 * 
 * @author Marcel Overdijk
 */
 
import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU
import org.codehaus.groovy.grails.commons.spring.GrailsRuntimeConfigurator
import org.codehaus.groovy.grails.scaffolding.*

grailsHome = Ant.project.properties."environment.GRAILS_HOME"

includeTargets << grailsScript("_GrailsBootstrap")

target('default': "Generates a CRUD interface (controller + views) for all domain class") {
    depends(checkVersion, packageApp)
    uberGenerate()
}

target(uberGenerate: "The implementation task") {

    rootLoader.addURL(classesDir.toURI().toURL())
    loadApp()
    
    def domainClasses = grailsApp.domainClasses
    
    if (!domainClasses) {
        println "Domain class not found in grails-app/domain, trying hibernate mapped classes..."       
        try {
            def config = new GrailsRuntimeConfigurator(grailsApp, appCtx)  
            appCtx = config.configure(appCtx.servletContext)                
        }   
        catch (Exception e) {
            println e.message
            e.printStackTrace()
        }
        domainClass = grailsApp.domainClasses
    }

   if (domainClasses) {
        def generator = new DefaultGrailsTemplateGenerator()
		generator.setOverwrite(true)
        domainClasses.each { domainClass ->
            event("StatusUpdate", ["Generating views for domain class ${domainClass.fullName}"])                
            generator.generateViews(domainClass, basedir)
            event("StatusUpdate", ["Generating controller for domain class ${domainClass.fullName}"])       
            generator.generateController(domainClass, basedir)
            event("StatusFinal", ["Finished generation for domain class ${domainClass.fullName}"])
        }
        event("StatusFinal", ["Finished generation for domain classes"])
    }
    else {
        event("StatusFinal", ["No domain classes found"])      
    }
}
