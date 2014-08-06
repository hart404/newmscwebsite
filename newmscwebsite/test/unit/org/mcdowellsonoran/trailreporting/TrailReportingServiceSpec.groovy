package org.mcdowellsonoran.trailreporting

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.Person
import newmscwebsite.TrailSection
import org.mcdowellsonoran.notification.NotificationService
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.Specification

@TestFor(TrailReportingService)
@Mock([TrailReport, NotificationType, Person])
class TrailReportingServiceSpec extends Specification {

    NotificationService mockNotificationService
    TrailReportNotification trailReportNotification

    void setup() {
        setupNotificationService()
        setupValidTrailReportNotification()
    }

    void "test save trail report data successfully from client"() {
        given: "A valid trail report"
        TrailReport trailReport = new TrailReport(trailSection: new TrailSection(),
                                                  date: new Date())

        when: "The trail report is saved"
        TrailReport result = service.saveTrailReport(trailReport)

        then: "The saved TrailReport is returned with a valid id"
        TrailReport.findById(result.id)
    }

    void "test if there is a trail problem a notification is sent"() {

        given: "A tail report that has an issue"
        TrailReport trailReport = new TrailReport(date: new Date(),
                                                  trailSection: new TrailSection(),
                                                  issue: true,
                                                  trailReportNotification: trailReportNotification)

        when: "the trail report is saved"
        TrailReport savedTrailReport = service.saveTrailReport(trailReport)

        then: "A notification is sent"
        1 * mockNotificationService.sendNotification(_,_,_,_) >> {}
        TrailReport.findById(savedTrailReport.id)
    }

    void "test if there is no trail problem no notification is sent but it is saved to database"() {

        given: "A tail report that has no issue issue"
        TrailReport trailReport = new TrailReport(date: new Date(),
                                                  trailSection: new TrailSection())

        when: "the trail report is saved"
        TrailReport savedTrailReport = service.saveTrailReport(trailReport)

        then: "A notification is not sent but the trail report is still persisted"
        0 * mockNotificationService.sendNotification(_, _, _, _) >> {}
        TrailReport.findById(savedTrailReport.id)
    }

    void setupNotificationService() {
        mockNotificationService = Mock(NotificationService)
        service.notificationService = mockNotificationService
    }

    void setupValidTrailReportNotification() {
        NotificationType notificationType = new NotificationType(code: "emergency",
                                                                 display: "Emergency Action Needed").save(failOnError: true,
                                                                                                          flush: true)
        SpringSecurityService mockSpringSecurityService = Mock(SpringSecurityService)
        mockSpringSecurityService.encodePassword(_,_) >> {return "encodedPassword"}

        Person person = new Person(username: "test@test.com",
                                   password: "testpassword",
                                   firstName: "testFirstName",
                                   lastName: "testLastName",
                                   hasStewardRole: true)
        person.springSecurityService = mockSpringSecurityService
        person.save(failOnError: true,
                    flush: true)
        trailReportNotification = new TrailReportNotification(notificationType: notificationType,
                                                              description: "test description",
                                                              date: new Date(),
                                                              person: person)
    }
}
