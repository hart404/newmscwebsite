package org.mcdowellsonoran.trailreporting

import newmscwebsite.GeographicCoordinates
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.*

class TrailReportingServiceISpec extends Specification {

    TrailReportingService trailReportingService
    TrailSection trailSection
    NotificationType notificationType

    void "test a valid TrailReport is saved to the database and no email is sent when there is no issue"() {

        given: "A valid TrailReport without an issue"
        setupValidTrailSection()
        setupValidNotificationType()
        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                                                  comment: "test comment",
                                                  code: "testcode",
                                                  date: new LocalDate(),
                                                  issue: false,
                                                  notificationType: notificationType).save(failOnError: true,
                                                                                           flush: true)

        when: "The TrailReport is saved"
        TrailReport result = trailReportingService.saveTrailReport(trailReport)

        then: "The TrailReport is persisted to the database"
        result
        "test comment" == TrailReport.findByCode("testcode").comment
    }

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

    private void setupValidNotificationType() {
        notificationType = new NotificationType(code: "testemergencycode",
                                                display: "Emergency Action Needed").save(failOnError: true,
                                                                                         flush: true)
    }
}
