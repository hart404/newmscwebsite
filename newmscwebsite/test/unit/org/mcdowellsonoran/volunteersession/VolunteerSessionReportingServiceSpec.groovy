package org.mcdowellsonoran.volunteersession

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.trailreporting.TrailReportingService
import spock.lang.Specification

@TestFor(VolunteerSessionReportingService)
@Mock([VolunteerSession, Person, TrailReport, TrailSection, GeographicCoordinates, NotificationType])
class VolunteerSessionReportingServiceSpec extends Specification {

    Person person
    TrailReportingService mockTrailReportingService

    void setup() {
        setupValidPerson()
        setupTrailReportingService()
    }

    void "test saving a valid volunteer session"() {

        given: "a valid volunteer session"
        VolunteerSession volunteerSession = new VolunteerSession(hours: 2,
                                                                 date: new LocalDate(),
                                                                 program: 'testProgram',
                                                                 person: person,
                                                                 trailReports: [])

        when: "it is saved"
        VolunteerSession savedVolunteerSession = service.saveVolunteerSession(volunteerSession)

        then: "the volunteer session is persisted to the database"
        0 * mockTrailReportingService.saveTrailReport(_) >> {}
        VolunteerSession.findById(savedVolunteerSession.id)
    }

    void "test saving a valid volunteer session with multiple trail reports"(){

        given: "a valid volunteer session with multiple trail reports"
        List<TrailReport> trailReports = setupTrailReports()
        VolunteerSession volunteerSession = new VolunteerSession(hours: 2,
                                                                 date: new LocalDate(),
                                                                 program: "testProgram",
                                                                 person: person,
                                                                 trailReports: trailReports)

        when: "the volunteer session is saved"
        VolunteerSession savedVolunteerSession = service.saveVolunteerSession(volunteerSession)

        then: "the volunteer session is persisted to the database along with its trail reports"
        VolunteerSession.findById(savedVolunteerSession.id)
        1 < VolunteerSession.findById(savedVolunteerSession.id).trailReports.size()
        mockTrailReportingService.saveTrailReport(_) >> { TrailReport param ->
            param.save(failOnError: true, flush: true)
        }
    }

    void "test saving a valid volunteer session with no trail reports"(){

        given: "a valid volunteer session with multiple trail reports"
        VolunteerSession volunteerSession = new VolunteerSession(hours: 2,
                                                                 date: new LocalDate(),
                                                                 program: "testProgram",
                                                                 person: person,
                                                                 trailReports: null)

        when: "the volunteer session is saved"
        VolunteerSession savedVolunteerSession = service.saveVolunteerSession(volunteerSession)

        then: "the volunteer session is persisted to the database along with its trail reports"
        VolunteerSession.findById(savedVolunteerSession.id)
        !VolunteerSession.findById(savedVolunteerSession.id).trailReports
        0 * mockTrailReportingService.saveTrailReport(_) >> { TrailReport param ->
            param.save(failOnError: true, flush: true)
        }
    }

    /**
     * Sets up one valid person object.
     */
    private void setupValidPerson() {
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
     * Sets up a mocked version of a trail reporting service
     * and associates it to the service under test
     */
    private void setupTrailReportingService() {
        mockTrailReportingService = Mock(TrailReportingService)
        service.trailReportingService = mockTrailReportingService
    }

    /**
     * Sets up multiple valid trail reports
     * @return a list of TrailReports
     */
    private static List<TrailReport> setupTrailReports() {
        List<TrailReport> trailReports = []

        GeographicCoordinates geographicCoordinates = new GeographicCoordinates(latitude: 51.503363,
                                                                                longitude: -0.127625).save(failOnError: true,
                                                                                                            flush: true)

        TrailSection trailSection = new TrailSection(pinLocation: geographicCoordinates,
                                                     pinName: "testPinName",
                                                     trailName: "testTrailName",
                                                     enabled: true,
                                                     usedForReporting: true).save(failOnError: true,
                                                                                  flush: true)

        TrailReport trailReport1 = new TrailReport(trailSection: trailSection,
                                                   date: new Date(),
                                                   issue: false)
        trailReports << trailReport1

        TrailReport trailReport2 = new TrailReport(trailSection: trailSection,
                                                   date: new Date(),
                                                   issue: true)
        trailReports << trailReport2

        return trailReports
    }
}
