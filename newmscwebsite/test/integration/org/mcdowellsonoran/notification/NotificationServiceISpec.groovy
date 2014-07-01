package org.mcdowellsonoran.notification

import com.icegreen.greenmail.util.GreenMail
import newmscwebsite.Person
import newmscwebsite.SecUser
import org.codehaus.groovy.grails.commons.GrailsApplication
import spock.lang.*

class NotificationServiceISpec extends Specification {

//    NotificationService notificationService
//    GreenMail greenMail
//    GrailsApplication grailsApplication
//
////    void cleanup() {
////        greenMail.receivedMessages.d
////    }
//
//    void setup() {
//        grailsApplication.config.grails.mail.host = 'localhost'
//        grailsApplication.config.grails.mail.port = com.icegreen.greenmail.util.ServerSetupTest.SMTP.port
//    }
//
//    void "test notifications are sent to everyone in the notification type"() {
//
//        given: "A notification type with valid users"
//        Person secUser1 = new Person(username: "person1@test.com",
//                                     password: "jklasdf23",
//                                      firstName: "personFirstName1",
//                                      lastName: "personLastName1",
//                                      hasStewardRole: true,
//                                      email: "jacoba.severson@gmail.com").save(failOnError: true, flush: true)
//        Person secUser2 = new Person(username: "person2@test.com",
//                                     password: "jklasdf23",
//                                        firstName: "personFirstName2",
//                                        lastName: "personLastName2",
//                                        hasStewardRole: true,
//                                        email: "jacoba.severson@gmail.com").save(failOnError: true, flush: true)
//        Set<Person> secUsers = new HashSet<>()
//        secUsers << secUser1
//        secUsers << secUser2
//        NotificationType notificationType = new NotificationType(code: "emergency",
//                                                                 display: "Emergency Action Needed",
//                                                                 recipients: secUsers)
//
//        when: "A notification is sent"
//        notificationService.sendNotification(notificationType,
//                                             "jacoba.severson@gmail.com",
//                                             "Message Subject Test",
//                                             "Message body test")
//
//        then: "An email is sent to every user in the notification type"
//        2 == greenMail.receivedMessages.length
//    }
}
