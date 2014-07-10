package org.mcdowellsonoran.trailreporting

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationService
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.Specification

@TestFor(TrailReportingService)
@Mock([TrailReport, NotificationType])
class TrailReportingServiceSpec extends Specification {

    NotificationService mockNotificationService = Mock(NotificationService)

    void setup() {
        setupNotificationType()
    }

    void "test save trail report data successfully from client"() {
        given: "A valid trail report"
        TrailReport trailReport = new TrailReport(comment: "test comment",
                                                  code: "test code",
                                                  date: new LocalDate(),
                                                  trailSection: new TrailSection(),
                                                  notificationType: NotificationType.findByCode("emergency"))

        when: "The trail report is saved"
        TrailReport result = service.saveTrailReport(trailReport)

        then: "The saved TrailReport is returned with a valid id"
        "test comment" == result.comment
        result.id
    }

    void "test if there is a trail problem a notification is sent"() {

        given: "A tail report that has an issue"
        NotificationType notificationType = NotificationType.findByCode("emergency")
        TrailReport trailReport = new TrailReport(comment: "test comment",
                                                  code: "test code",
                                                  date: new LocalDate(),
                                                  trailSection: new TrailSection(),
                                                  issue: true,
                                                  notificationType: notificationType)

        when: "the trail report is saved"
        service.notificationService = mockNotificationService
        service.saveTrailReport(trailReport)

        then: "A notification is sent"
        1 * mockNotificationService.sendNotification(notificationType,
                                                     "no-reply@mcdowellsonoran.org",
                                                     "Trail issue reported of type: " + trailReport.code,
                                                     trailReport.comment) >> {}
        TrailReport.findByComment("test comment")
        TrailReport.findByComment("test comment").notificationType
    }

    void "test if there is no trail problem no notification is sent but it is saved to database"() {

        given: "A tail report that has no issue issue"
        NotificationType notificationType = NotificationType.findByCode("emergency")
        TrailReport trailReport = new TrailReport(comment: "test comment",
                                                  code: "test code",
                                                  date: new LocalDate(),
                                                  trailSection: new TrailSection(),
                                                  issue: false,
                                                  notificationType: notificationType)

        when: "the trail report is saved"
        service.notificationService = mockNotificationService
        service.saveTrailReport(trailReport)

        then: "A notification is sent"
        0 * mockNotificationService.sendNotification(_, _, _, _) >> {}
        TrailReport.findByComment("test comment")
        TrailReport.findByComment("test comment").notificationType
    }

    void setupNotificationType() {
        new NotificationType(code: "emergency", display: "Emergency Action Needed").save(failOnError: true,
                                                                                         flush: true)
    }
}
