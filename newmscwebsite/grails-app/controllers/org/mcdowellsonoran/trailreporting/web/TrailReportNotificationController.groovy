package org.mcdowellsonoran.trailreporting.web

import grails.converters.JSON

/**
 * Controller for TrailReportNotification operations.
 */
class TrailReportNotificationController {

    /**
     * Checks that a TrailReportNotification and all
     * its fields are valid. If not valid,
     * an object populated with all the field
     * errors is returned. If valid, the "hasErrors"
     * property on the returned object is false.
     * @param TrailReportNotification to validate
     */
    def validateTrailReport(TrailReportNotificationCommand trailReportNotification) {
        Map errorsMap = [:]
        if (trailReportNotification.hasErrors()) {
            response.status = 400
            List errors = []
            errorsMap.put("hasErrors", true)

            // Pull each error from messages.properties
            g.eachError(bean: trailReportNotification) {
                errors.add(g.message(error: it))
            }
            errorsMap.put("valErrors", errors)
        } else {
            response.status = 200
            errorsMap.put("hasErrors", false)
        }
        render errorsMap as JSON
    }
}
