package org.mcdowellsonoran.notification.web

import grails.converters.JSON
import org.mcdowellsonoran.notification.NotificationType

/**
 * Controller for NotificationType operations.
 */
class NotificationTypeController {

    /**
     * Returns a JSON object with all persisted NotificationTypes.
     * @return JSON representation of all NotificationTypes
     */
    def getAllNotificationTypes() {
        render NotificationType.findAll() as JSON
    }
}
