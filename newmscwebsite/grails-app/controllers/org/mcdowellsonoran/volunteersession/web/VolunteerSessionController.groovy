package org.mcdowellsonoran.volunteersession.web

import grails.plugins.springsecurity.SpringSecurityService
import newmscwebsite.Person
import org.mcdowellsonoran.volunteersession.VolunteerSession
import org.mcdowellsonoran.volunteersession.VolunteerSessionService

/**
 * Controller for VolunteerSession operations.
 */
class VolunteerSessionController {

    VolunteerSessionService volunteerSessionService
    SpringSecurityService springSecurityService

    /**
     * Save one to more VolunteerSessions.
     */
    def saveVolunteerSessions() {

        for(VolunteerSession volunteerSession : buildVolunteerSessions(request)) {
            volunteerSessionService.saveVolunteerSession(volunteerSession)
        }
        flash.message = "Volunteer session successfully saved"
        redirect controller: "person", action: "stewardReporting"
    }

    /**
     *
     * @param params
     * @return
     */
    private List<VolunteerSession> buildVolunteerSessions(def request) {
        List<VolunteerSession> volunteerSessionList = []
        VolunteerSession volunteerSession = new VolunteerSession(request.JSON)
        volunteerSession.person = springSecurityService.currentUser as Person
        volunteerSessionList << volunteerSession
        return volunteerSessionList
    }
}