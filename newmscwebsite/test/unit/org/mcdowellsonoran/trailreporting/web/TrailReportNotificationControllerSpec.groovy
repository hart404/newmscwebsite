package org.mcdowellsonoran.trailreporting.web

import grails.test.mixin.*
import org.junit.*
import org.mcdowellsonoran.trailreporting.TrailReportNotification
import spock.lang.Specification

import java.text.SimpleDateFormat

@TestFor(TrailReportNotificationController)
class TrailReportNotificationControllerSpec extends Specification {

    void "test a valid trail report notification returns an object with no errors"() {
        given: "a request with valid trail report notification"
        String dateString = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString()
        String requestJson = '{notificationType:"emergency",' +
                             ' problemDescription: "test description",' +
                             ' problemDate: "' + dateString + '"}'
        request.method = 'POST'
        request.JSON = requestJson

        when: "it is validated"
        request.makeAjaxRequest()
        controller.validateTrailReport()

        then: "an object is returned that doesn't contain any validation errors"
        !response.json.hasErrors as Boolean
    }

    void "test an invalid trail report notification returns an object with error messages"() {
        given: "a request with an invalid trail report notification"
        String requestJson = ""
        request.method = 'POST'
        request.JSON = requestJson

        when: "it is validated"
        request.makeAjaxRequest()
        controller.validateTrailReport()

        then: "an object is returned that contains multiple error messages"
        response.json.hasErrors as Boolean
        3 == response.json.errors.size()
    }
}
