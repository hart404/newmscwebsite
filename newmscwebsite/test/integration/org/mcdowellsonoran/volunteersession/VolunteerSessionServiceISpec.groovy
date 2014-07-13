package org.mcdowellsonoran.volunteersession

import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.trailreporting.TrailReportNotification
import spock.lang.*

class VolunteerSessionServiceISpec extends Specification {

    VolunteerSessionService volunteerSessionService
    Person person

    def setup() {
        setupValidPerson()
    }

    void "test saving a valid volunteer session with no trail reports"() {

        given: "a valid volunteer session with no trail reports"
        VolunteerSession volunteerSession = new VolunteerSession(person: person,
                                                                 hours: 2,
                                                                 date: new LocalDate(),
                                                                 program: "testProgram")

        when: "the volunteer session is saved"
        VolunteerSession savedVolunteerSession = volunteerSessionService.saveVolunteerSession(volunteerSession)

        then: "the volunteer session is persisted to the database"
        VolunteerSession.findById(savedVolunteerSession.id)
        "testProgram" == VolunteerSession.findById(savedVolunteerSession.id).program
    }

    void "test saving a valid volunteer session with multiple trail reports that have no issues"() {
        given: "a volunteer session with multiple trail reports that have no issues"
        List<TrailReport> trailReportList = []
        GeographicCoordinates pinLocation = new GeographicCoordinates(latitude: 51.503363,
                                                                      longitude: -0.127625).save(failOnError: true,
                                                                                                 flush: true)
        TrailSection trailSection = new TrailSection(pinLocation: pinLocation,
                                                     pinName: "testPinName",
                                                     trailName: "testTrailName",
                                                     enabled: true,
                                                     usedForReporting: true).save(failOnError: true,
                                                                                  flush: true)
        NotificationType notificationType = new NotificationType(code: "testCode",
                                                                 display: "Test Display",
                                                                 recipients: [person]).save(failOnError: true,
                                                                                            flush: true)

        TrailReportNotification trailReportNotification =
            new TrailReportNotification(notificationType: notificationType,
                                        description: "test description",
                                        date: new Date(),
                                        person: person)

        TrailReport trailReport1 = new TrailReport(trailSection: trailSection,
                                                   date: new Date(),
                                                   trailReportNotification: trailReportNotification)
        trailReportList << trailReport1
        TrailReport trailReport2 = new TrailReport(trailSection: trailSection,
                                                   date: new Date()).save(failOnError: true,
                                                                          flush: true)
        trailReportList << trailReport2

        VolunteerSession volunteerSession = new VolunteerSession(hours: 2,
                                                                 date: new LocalDate(),
                                                                 program: "testProgram",
                                                                 person: person,
                                                                 trailReports: trailReportList)

        when: "the volunteer session is saved"
        VolunteerSession savedVolunteerSession = volunteerSessionService.saveVolunteerSession(volunteerSession)

        then: "the volunteer session and all of the trail reports are persisted to the database"
        VolunteerSession.findById(savedVolunteerSession.id)
        2 == VolunteerSession.findById(savedVolunteerSession.id).trailReports.size()
        "test description" == VolunteerSession.findById(savedVolunteerSession.id).trailReports.get(0).trailReportNotification.description
    }

    private void setupValidPerson() {
        person = new Person(username: "jacob.severson@objectpartners.com",
                            password: "testPassword",
                            firstName: "Jacob",
                            lastName: "Severson",
                            hasStewardRole: true).save(failOnError: true,
                                                       flush: true)
    }
}