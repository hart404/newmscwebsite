package org.mcdowellsonoran.volunteersession

import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.trailreporting.TrailReportingService

/**
 * Operations for VolunteerSessions
 */
class VolunteerSessionService {

    TrailReportingService trailReportingService

    /**
     * Saves a list of VolunteerSessions. This method is helpful
     * if you would like all of the volunteer sessions to be saved
     * in one transaction.
     * @param volunteerSessions List of VolunteerSessions to be saved.
     */
    void saveVolunteerSessions(List<VolunteerSession> volunteerSessions) {
        for (VolunteerSession volunteerSession : volunteerSessions) {
            saveVolunteerSession(volunteerSession)
        }
    }

    /**
     * Saves a VolunteerSession instance
     * to the data store.
     * @param volunteerSession VolunteerSession to save
     * @param trailReports a list of TrailReports for the VolunteerSession
     * @return the saved VolunteerSession instance
     */
    VolunteerSession saveVolunteerSession(VolunteerSession volunteerSession) {

        // TrailReports need to be saved on their own instead of cascaded
        // because a notification needs to be sent if there is an issue at the
        // associated trail section
        if(volunteerSession.trailReports && !volunteerSession.trailReports.isEmpty()) {
            List<TrailReport> savedTrailReports = []
            for(TrailReport trailReport : volunteerSession.trailReports) {
                TrailReport savedTrailReport = trailReportingService.saveTrailReport(trailReport)
                savedTrailReports << savedTrailReport
            }
            volunteerSession.trailReports = savedTrailReports
        }
        return volunteerSession.save()
    }
}
