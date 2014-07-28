package org.mcdowellsonoran.volunteersession.web

import grails.converters.JSON
import grails.plugins.springsecurity.SpringSecurityService
import newmscwebsite.Person
import newmscwebsite.Program
import newmscwebsite.ProgramReporting
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.volunteersession.VolunteerSession
import org.mcdowellsonoran.volunteersession.VolunteerSessionService

/**
 * Controller for VolunteerSession operations.
 */
class VolunteerSessionController {

    VolunteerSessionService volunteerSessionService
    SpringSecurityService springSecurityService

    /**
     * Save one or more VolunteerSessions.
     */
    def saveVolunteerSessions(StewardReportingCommand stewardReportingCommand) {

        Map errorsMap = [:]

        // It would be very cumbersome to pass around each
        // volunteer session element to attach errors straight to
        // them. Instead we will just use a counter and tell the
        // user which volunteer session number on the page has the specific error.
        Integer volunteerSessionCounter = 1

        stewardReportingCommand.volunteerSessions.each { it.validate() }

        if(stewardReportingCommand.volunteerSessions.any { it.hasErrors() }) {
            response.status = 400
            errorsMap.put("hasErrors", true)
            List errors = []

            for(VolunteerSessionCommand vsc : stewardReportingCommand.volunteerSessions) {

                // Pull each error from messages.properties
                g.eachError(bean: vsc) {
                    errors.add("For volunteer session $volunteerSessionCounter: " + g.message(error: it))
                }
                volunteerSessionCounter++
            }
            errorsMap.put("valErrors", errors)

        } else {
            // TODO: save each one
            response.status = 200
            errorsMap.put("hasErrors", false)
        }

        render errorsMap as JSON
    }

    /**
     * Returns all programs for reporting purposes.
     * @return json list of programs
     */
    def getPrograms() {
        List programList = []
        ProgramReporting.values().findAll {program -> program.isShowable()}.each {
            Map programMap = [:]
            programMap.put("programKey", it.name())
            programMap.put("programValue", it.value())
            programList << programMap
        }
        render programList as JSON
    }

    /**
     *
     * @param params
     * @return
     */
    private List<VolunteerSession> buildVolunteerSessions(def request) {

//        List<VolunteerSession> volunteerSessionList = []
//        VolunteerSession volunteerSession = new VolunteerSession(request.JSON)
//        volunteerSession.person = springSecurityService.currentUser as Person
//        volunteerSessionList << volunteerSession
        return null
    }


}