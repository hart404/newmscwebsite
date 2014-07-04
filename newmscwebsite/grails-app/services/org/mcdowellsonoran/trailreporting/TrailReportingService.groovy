package org.mcdowellsonoran.trailreporting

import org.mcdowellsonoran.notification.NotificationService

/**
 * Operations for TrailReports
 */
class TrailReportingService {

    NotificationService notificationService

    /**
     * Persisted the TrailReport to the datastore.
     * @param trailReport TrailReport to persist
     * @return The persisted TrailReport instance
     */
    TrailReport saveTrailReport(TrailReport trailReport) {
        if(trailReport.issue) {
            notificationService.sendNotification(trailReport.notificationType,
                                                 "no-reply@mcdowellsonoran.org",
                                                 "Trail issue reported of type: " + trailReport.code,
                                                 trailReport.comment)
        }
        return trailReport.save()
    }
}
