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
            notificationService.sendNotification(trailReport.trailReportNotification.notificationType,
                                                 "no-reply@mcdowellsonoran.org",
                                                 "Trail issue reported of type: " + trailReport.trailReportNotification.notificationType.display,
                                                 buildTrailNotificationMessage(trailReport))
        }
        return trailReport
    }

    private static String buildTrailNotificationMessage(TrailReport trailReport) {
        String reportDate = trailReport.trailReportNotification.date.toString()
        String reporter = "$trailReport.trailReportNotification.person.firstName $trailReport.trailReportNotification.person.lastName"
        String trail = trailReport.trailSection.trailName
        String reportComment = trailReport.trailReportNotification.description
        String reportType = trailReport.trailReportNotification.notificationType.display
        return "On $reportDate, $reporter reported an issue on trail $trail of type $reportType: $reportComment"
    }
}
