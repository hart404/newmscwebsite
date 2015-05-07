package org.mcdowellsonoran.volunteersession.web

import grails.converters.JSON
import grails.plugins.springsecurity.SpringSecurityService
import newmscwebsite.Person
import newmscwebsite.ProgramReporting
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.trailreporting.TrailReportNotification
import org.mcdowellsonoran.volunteersession.VolunteerSession
import org.mcdowellsonoran.volunteersession.VolunteerSessionReportingService

/**
 * Controller for VolunteerSession operations.
 */
class VolunteerSessionReportingController {

    VolunteerSessionReportingService volunteerSessionReportingService
    SpringSecurityService springSecurityService

    /**
     * Save one or more VolunteerSessions.
     */
    def saveVolunteerSessions(StewardReportingCommand stewardReportingCommand) {

        Map errorsMap = [:]

        stewardReportingCommand.volunteerSessions.each { it.validate() }

        if (stewardReportingCommand.volunteerSessions.any { it.hasErrors() }) {
            response.status = 400
            errorsMap.put("hasErrors", true)
            List errors = []

            for(VolunteerSessionCommand vsc : stewardReportingCommand.volunteerSessions) {
                Integer row = vsc.validationRow
                // Pull each error from messages.properties
                g.eachError(bean: vsc) {
                    errors.add("For volunteer session $row: " + g.message(error: it))
                }
            }
            errorsMap.put("valErrors", errors)

        } else {
            Integer volunteerSessionCount = stewardReportingCommand.volunteerSessions.size()
            volunteerSessionReportingService.saveVolunteerSessions(buildVolunteerSessions(stewardReportingCommand))
            response.status = 200
            errorsMap.put("hasErrors", false)
            errorsMap.put("message", "$volunteerSessionCount volunteer sessions have been saved.")
            errorsMap.put("successLink", g.createLink(controller: "person", action: "stewardReportingNew"))
        }

        render errorsMap as JSON
    }

    /**
     * Returns all showable programs for reporting purposes.
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
     * Builds valid VolunteerSession objects from the data binded to
     * a StewardReportingCommand.
     * @param cmd The command object used to compose the VolunteerSessions
     * @return A List of VolunteerSessions composed from the passed-in command
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
					updateLastPatrolled(trailReport.trailSection, volunteerSession.date)
                    trailReport.date = vcs.date
                    trailReport.issue = trc.issue

                    // There will only be a TrailReportNotification if there is an issue
                    if (trc.issue) {
                        TrailReportNotification notification = new TrailReportNotification()
                        notification.notificationType = NotificationType.findByCode(trc.notificationType)
                        notification.description = trc.problemDescription
                        notification.date = vcs.date
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
	
	private void updateLastPatrolled(TrailSection trailSection, LocalDate date) {
		// Update the lastPatrolled date on the trail section. Update it if it is null or the date given is after the current last patrolled date
		if (trailSection.lastPatrolled == null || date.isAfter(trailSection.lastPatrolled)) {
			trailSection.lastPatrolled = date
		}
	}
}