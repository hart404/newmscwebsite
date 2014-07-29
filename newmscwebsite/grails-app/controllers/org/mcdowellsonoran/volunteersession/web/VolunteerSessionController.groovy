package org.mcdowellsonoran.volunteersession.web

import grails.converters.JSON
import grails.plugins.springsecurity.SpringSecurityService
import newmscwebsite.Person
import newmscwebsite.Program
import newmscwebsite.ProgramReporting
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.trailreporting.TrailReportNotification
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
            Integer volunteerSessionCount = stewardReportingCommand.volunteerSessions.size()
            volunteerSessionService.saveVolunteerSessions(buildVolunteerSessions(stewardReportingCommand))
            response.status = 200
            errorsMap.put("hasErrors", false)
            errorsMap.put("message", "$volunteerSessionCount volunteer sessions have been saved.")
            errorsMap.put("successLink", g.createLink(controller: "home"))
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
    private List<VolunteerSession> buildVolunteerSessions(StewardReportingCommand cmd) {
        List<VolunteerSession> volunteerSessions = []
        Person currentUser = springSecurityService.currentUser as Person

        for (VolunteerSessionCommand vcs : cmd.volunteerSessions) {
            VolunteerSession volunteerSession = new VolunteerSession()
            volunteerSession.hours = vcs.hours
            volunteerSession.date = new LocalDate(vcs.date)
            volunteerSession.program = vcs.program
            volunteerSession.person = currentUser

            if(vcs.trailReports && !vcs.trailReports.isEmpty()) {
                List<TrailReport> trailReports = []
                for (TrailReportCommand trc : vcs.trailReports) {
                    TrailReport trailReport = new TrailReport()
                    trailReport.trailSection = TrailSection.get(trc.pinId)
                    trailReport.date = vcs.date
                    trailReport.issue = trc.issue

                    if(trc.issue){
                        TrailReportNotification notification = new TrailReportNotification()
                        notification.notificationType = NotificationType.findByCode(trc.notificationType)
                        notification.description = trc.problemDescription
                        notification.date = trc.problemDate
                        notification.person = currentUser
                        notification.trailReport = trailReport
                        trailReport.trailReportNotification = notification
                        notification.trailReport = trailReport

                    }
                    trailReports << trailReport
                }
                volunteerSession.trailReports = trailReports
            }
            volunteerSessions << volunteerSession
        }
        return volunteerSessions
    }
}