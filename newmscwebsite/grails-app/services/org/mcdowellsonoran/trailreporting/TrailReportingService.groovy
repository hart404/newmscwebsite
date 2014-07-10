package org.mcdowellsonoran.trailreporting

import org.mcdowellsonoran.notification.NotificationService

/**
 * Operations for TrailReports.
 */
class TrailReportingService {

    NotificationService notificationService

    /**
     * Persists the TrailReport to the data store
     * and sends a notification if the TrailReport
     * has a reported issue.
     * @param trailReport TrailReport to persist
     * @return The persisted TrailReport instance
     */
    TrailReport saveTrailReport(TrailReport trailReport) {

        trailReport.save()

        if(trailReport.issue) {
            notificationService.sendNotification(trailReport.notificationType,
                                                 "no-reply@mcdowellsonoran.org",
                                                 "Trail issue reported of type: " + trailReport.code,
                                                 trailReport.comment)
        }
        return trailReport
    }
}
