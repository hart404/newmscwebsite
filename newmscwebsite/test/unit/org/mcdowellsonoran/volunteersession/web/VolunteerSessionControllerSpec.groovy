package org.mcdowellsonoran.volunteersession.web

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.Program
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.trailreporting.TrailReport
import org.mcdowellsonoran.volunteersession.VolunteerSession
import org.mcdowellsonoran.volunteersession.VolunteerSessionService
import spock.lang.Specification

@TestFor(VolunteerSessionController)
@Mock([VolunteerSession, GeographicCoordinates, TrailSection, TrailReport, Person])
class VolunteerSessionControllerSpec extends Specification {

    VolunteerSessionService mockVolunteerSessionService
    SpringSecurityService mockSpringSecurityService
    Person person

    void setup() {
        setupVolunteerSessionService()
        setupValidPerson()
    }

    void "test save a single valid volunteer session"() {

        given: "a request with a valid volunteer session"
        TrailSection trailSection = setupValidTrailSection()

        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                                                  date: new Date())

        request.json = [hours: 2,
                        date: new LocalDate().toString(),
                        program: Program.PATROL.title(),
                        trailReports: [trailReport]]

        when: "the volunteer session is saved"
        controller.saveVolunteerSessions()

        then: "the request data is persisted to the appropriate domains"
        '/person/stewardReporting' == response.redirectedUrl
        0 < VolunteerSession.findAll().size()
        "testPinName" == TrailReport.findByTrailSection(trailSection).trailSection.pinName
        1 * mockVolunteerSessionService.saveVolunteerSession(_) >> { VolunteerSession volunteerSession ->
            volunteerSession.save(failOnError: true,
                                  flush: true)
        }
    }

    /**
     * Set up a mocked version of the VolunteerSessionService
     */
    private void setupVolunteerSessionService() {
        mockVolunteerSessionService = Mock(VolunteerSessionService)
        controller.volunteerSessionService = mockVolunteerSessionService
    }

    /**
     * Setup a single valid person
     */
    private void setupValidPerson() {
        mockSpringSecurityService = Mock(SpringSecurityService)
        controller.springSecurityService = mockSpringSecurityService
        mockSpringSecurityService.encodePassword(_,_) >> {return "encodedPassword"}
        person = new Person(username: "test@test.com",
                password: "testpassword",
                firstName: "testFirstName",
                lastName: "testLastName",
                hasStewardRole: true)
        person.springSecurityService = mockSpringSecurityService
        person.save(failOnError: true,
                    flush: true)
        mockSpringSecurityService.currentUser >> {return person}
    }

    /**
     * Set up and persist a single valid GeographicCoordinates instance.
     * @return Persisted GeographicCoordinates
     */
    private static GeographicCoordinates setupValidGeographicCoordinates() {
        return new GeographicCoordinates(latitude: 0.987654,
                                         longitude: 40.847389).save(failOnError: true,
                                                                    flush: true)
    }

    /**
     * Set up and persist a single valid TrailSection instance.
     * @return Persisted TrailSection
     */
    private static TrailSection setupValidTrailSection() {
        return new TrailSection(pinLocation: setupValidGeographicCoordinates(),
                                pinName: "testPinName",
                                trailName: "testTrailName",
                                enabled: true,
                                usedForReporting: true).save(failOnError: true,
                                                             flush: true)
    }
}
