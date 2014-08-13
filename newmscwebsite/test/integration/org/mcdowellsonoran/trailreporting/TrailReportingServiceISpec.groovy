package org.mcdowellsonoran.trailreporting

import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.TrailSection
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.Specification

class TrailReportingServiceISpec extends Specification {

    TrailReportingService trailReportingService
    TrailSection trailSection
    TrailReportNotification trailReportNotification
    def greenMail

    void cleanup() {
        greenMail.deleteAllMessages()
    }

    void "test a valid TrailReport is saved to the database and no email is sent when there is no issue"() {

        given: "A valid TrailReport without an issue"
        setupValidTrailSection()
        setupValidTrailReportNotification()
        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                                                  trailReportNotification: trailReportNotification,
                                                  date: new Date(),
                                                  issue: false).save(failOnError: true,
                                                                     flush: true)

        when: "The TrailReport is saved"
        TrailReport result = trailReportingService.saveTrailReport(trailReport)

        then: "The TrailReport is persisted to the database"
        result
        "test comment" == TrailReport.findById(result.id).trailReportNotification.description
    }

    void "test a valid TrailReport is saved to the database and an email is sent when there is an issue"() {

        given: "A valid TrailReport with an issue"
        setupValidTrailSection()
        setupValidTrailReportNotification()
        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                trailReportNotification: trailReportNotification,
                date: new Date(),
                issue: true).save(failOnError: true,
                flush: true)

        when: "The TrailReport is saved"
        TrailReport result = trailReportingService.saveTrailReport(trailReport)

        then: "The TrailReport is persisted to the database and emails are sent to the notification recipients"
        trailReportNotification.notificationType.recipients.size() == greenMail.receivedMessages.length
        "test comment" == TrailReport.findById(result.id).trailReportNotification.description
    }

    /**
     * Set up and persist a single valid trail section.
     */
    private void setupValidTrailSection() {
        GeographicCoordinates geographicCoordinates =
            new GeographicCoordinates(latitude: 51.503363,
                                      longitude: -0.127625).save(failOnError: true,
                                                                 flush: true)

        trailSection = new TrailSection(pinName: "testPin",
                                        trailName: "Test Trail",
                                        enabled: true,
                                        usedForReporting: true,
                                        anchorX: 100,
                                        anchorY: 100,
                                        pinLocation: geographicCoordinates).save(failOnError: true,
                                                                                 flush: true)
    }

    /**
     * Set up and persist a singe trail report notification
     */
    private void setupValidTrailReportNotification() {
        Person person = new Person(username: "jacob.severson@objectpartners.com",
                                   password: "testPassword",
                                   firstName: "Jacob",
                                   lastName: "Severson",
                                   hasStewardRole: true).save(failOnError: true,
                                                              flush: true)
        Person person2 = new Person(username: "jacob.severson2@objectpartners.com",
                password: "testPassword",
                firstName: "Jacob2",
                lastName: "Severson2",
                hasStewardRole: true).save(failOnError: true,
                                           flush: true)
        Person person3 = new Person(username: "testuser3@mcdowellsonoran.org",
                password: "testPassword",
                firstName: "test3",
                lastName: "user3",
                hasStewardRole: true).save(failOnError: true,
                flush: true)

        NotificationType notificationType = new NotificationType(code: "testemergencycode",
                display: "Emergency Action Needed",
                recipients: [person, person2, person3]).save(failOnError: true,
                flush: true)

        trailReportNotification = new TrailReportNotification(notificationType: notificationType,
                                                              description: "test comment",
                                                              date: new Date(),
                                                              person: person)
    }
}
