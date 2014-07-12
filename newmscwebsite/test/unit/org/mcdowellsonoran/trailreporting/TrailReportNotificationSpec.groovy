package org.mcdowellsonoran.trailreporting

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.TrailSection
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.Specification

@TestFor(TrailReportNotification)
@Mock([Person, NotificationType, TrailReport, GeographicCoordinates, TrailSection])
class TrailReportNotificationSpec extends Specification {

    Person person
    NotificationType notificationType
    TrailReport trailReport

    void setup() {
        setupValidPerson()
        setupValidNotificationTypes()
        setupValidTrailReport()
    }

    void "test persist a valid trail report notification to the database"() {

        given: "a valid trail report notification"
        TrailReportNotification trailReportNotification = new TrailReportNotification(notificationType: notificationType,
                                                                                      description: "test description",
                                                                                      date: new Date(),
                                                                                      person: person,
                                                                                      trailReport: trailReport)

        when: "it is saved to the database"
        trailReportNotification.save(failOnError: true,
                                     flush: true)

        then: "it is persisted to the database and is queryable"
        TrailReportNotification.findByDescription("test description")
    }

    /**
     * Sets up one valid person object.
     */
    void setupValidPerson() {
        SpringSecurityService mockSpringSecurityService = Mock(SpringSecurityService)
        mockSpringSecurityService.encodePassword(_,_) >> {return "encodedPassword"}
        person = new Person(username: "test@test.com",
                            password: "testpassword",
                            firstName: "testFirstName",
                            lastName: "testLastName",
                            hasStewardRole: true)
        person.springSecurityService = mockSpringSecurityService
        person.save(failOnError: true,
                    flush: true)
    }

    /**
     * Sets up one or more valid notification type instances
     */
    void setupValidNotificationTypes() {
        notificationType = new NotificationType(code: "emergency",
                                                display: "Emergency Action Needed").save(failOnError: true,
                                                                                         flush: true)
    }

    /**
     * Sets up a single valid trail report instance
     */
    void setupValidTrailReport() {
        GeographicCoordinates pinLocation = new GeographicCoordinates(latitude: 51.503363,
                                                                      longitude: -0.127625).save(failOnError: true,
                                                                                                 flush: true)

        TrailSection trailSection = new TrailSection(trailName: "testTrail",
                                                     enabled: true,
                                                     usedForReporting: true,
                                                     pinLocation: pinLocation,
                                                     pinName: "testPinName").save(failOnError: true,
                                                                                  flush: true)
        trailReport = new TrailReport(date: new Date(),
                                      trailSection: trailSection)
    }
}