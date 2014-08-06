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
        NotificationType notificationType = new NotificationType(code: "testemergencycode",
                                                                 display: "Emergency Action Needed").save(failOnError: true,
                                                                                                          flush: true)
        Person person = new Person(username: "jacob.severson@objectpartners.com",
                                   password: "testPassword",
                                   firstName: "Jacob",
                                   lastName: "Severson",
                                   hasStewardRole: true).save(failOnError: true,
                                                              flush: true)

        trailReportNotification = new TrailReportNotification(notificationType: notificationType,
                                                              description: "test comment",
                                                              date: new Date(),
                                                              person: person)
    }
}
