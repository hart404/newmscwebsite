package org.mcdowellsonoran.notification

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.Person
import spock.lang.Specification

@TestFor(NotificationType)
@Mock([Person])
class NotificationTypeSpec extends Specification {

    SpringSecurityService springSecurityService

    void setup() {
        springSecurityService = Mock(SpringSecurityService)
        springSecurityService.encodePassword(_,_) >> {return "test"}
    }

    void "test persist valid NotificationType"() {

        given: "A valid NotificationType"
        Set<Person> mockRecipientList = []
        Person mockPerson = Mock(Person)
        mockRecipientList << mockPerson
        NotificationType notificationType = new NotificationType(code: "testCode",
                                                                 display: "Test Display",
                                                                 recipients: mockRecipientList)

        when: "the NotificationType is validated"
        notificationType.validate()

        then: "there should be no errors"
        !notificationType.hasErrors()
    }

    void "test nullable constraints"() {

        given: "A NotificationType that violates all nullable constraints"
        NotificationType notificationType = new NotificationType()

        when: "The NotificationType is validated"
        notificationType.validate()

        then: "There should be errors attached to the instance"
        2 == notificationType.errors.errorCount
    }

    void "test adding person objects to a notification type"() {

        given: "Valid person objects"
        Person person1 = new Person(firstName: "testFirstName1",
                                    lastName: "testLastName1",
                                    hasStewardRole: true)
        Person person2 = new Person(firstName: "testFirstName2",
                                    lastName: "testLastName2",
                                    hasStewardRole: true)
        person1.springSecurityService = springSecurityService
        person2.springSecurityService = springSecurityService

        when: "The person objects are added to the NotificationType"
        NotificationType notificationType = new NotificationType(code: "testCode",
                                                                 display: "Test Display").save(failOnError: true, flush: true)
        notificationType.addToRecipients(person1)
        notificationType.addToRecipients(person2)
        notificationType.save(failOnError: true, flush: true)

        then: "The person objects are persisted"
        2 == NotificationType.findByCode("testCode").recipients.size()
    }
}
