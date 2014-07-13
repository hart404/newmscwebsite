package org.mcdowellsonoran.notification.web

import grails.test.mixin.*
import org.mcdowellsonoran.notification.NotificationType
import spock.lang.Specification

@TestFor(NotificationTypeController)
@Mock([NotificationType])
class NotificationTypeControllerSpec extends Specification {

    void "test can get all notification types"() {
        given: "persisted notification types"
        new NotificationType(code: "code1",
                             display: "Display 1").save(failOnError: true,
                                                        flush: true)
        new NotificationType(code: "code2",
                             display: "Display 2").save(failOnError: true,
                                                        flush: true)

        when: "all of the notification types are queried"
        controller.getAllNotificationTypes()

        then: "a list of notification types are returned"
        "code1" == response.json[0].code
        "code2" == response.json[1].code
    }
}
