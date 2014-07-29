package org.mcdowellsonoran.volunteersession.web

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.GeographicCoordinates
import newmscwebsite.Person
import newmscwebsite.Program
import newmscwebsite.ProgramReporting
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

    void "test saving a single invalid volunteer session returns errors"() {

        given: "a request with an invalid volunteer session"
        request.json = [volunteerSessions: [[:]]]

        when: "the volunteer session is saved"
        controller.saveVolunteerSessions()

        then: "errors are returned"
        400 == response.status
        true == response.json.hasErrors
        3 == response.json.valErrors.size()
    }

    void "test saving multiple invalid volunteer sessions returns errors"() {

        given: "a request with multiple invalid volunteer sessions"
        request.json = [volunteerSessions: [[:], [:]]]

        when: "the volunteer sessions are saved"
        controller.saveVolunteerSessions()

        then: "errors are returned"
        400 == response.status
        true == response.json.hasErrors
        6 == response.json.valErrors.size()
    }

    void "test saving an invalid volunteer session when there is also a valid one"() {

        given: "a request with multiple invalid volunteer sessions"
        TrailSection trailSection = setupValidTrailSection()

        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                date: new Date())

        request.json =
            [   volunteerSessions: [
                    [:],
                    [hours: 2,
                     date: new LocalDate().toString(),
                     program: Program.PATROL.title(),
                     trailReports: [trailReport]]
                ]
            ]

        when: "the volunteer sessions are saved"
        controller.saveVolunteerSessions()

        then: "errors are returned"
        400 == response.status
        true == response.json.hasErrors
        3 == response.json.valErrors.size()
    }

    void "test save a single valid volunteer session with no issues"() {

        given: "a request with a valid volunteer session"
        TrailSection trailSection = setupValidTrailSection()

        TrailReport trailReport = new TrailReport(trailSection: trailSection,
                                                  date: new Date())

        request.json = [
                volunteerSessions: [
                        [hours: 2,
                        date: new LocalDate().toString(),
                        program: Program.PATROL.title(),
                        trailReports: [trailReport]]
                ]
        ]

        when: "the volunteer session is saved"
        controller.saveVolunteerSessions()

        then: "no errors are returned and a success link is in the response"
        1 * mockVolunteerSessionService.saveVolunteerSessions(_) >> {}
        200 == response.status
        false == response.json.hasErrors
        "1 volunteer sessions have been saved." == response.json.message
        "/home" == response.json.successLink
    }

    void "test returning all programs for reporting"() {

        when: "all programs are retrieved"
        controller.getPrograms()

        then: "all programs that are listable for reporting are present"
        ProgramReporting.values().findAll {program -> program.isShowable()}.size() ==
                response.json.size()
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
