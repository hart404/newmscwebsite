package org.mcdowellsonoran.trailreporting.web

import grails.validation.Validateable
import org.grails.databinding.BindingFormat

/**
 * Command object for validating the user
 * input for TrailReportNotifications.
 */
@Validateable
class TrailReportNotificationCommand {

    String notificationType
    String description

    @BindingFormat('yyyy-MM-dd HH:mm:ss')
    Date date

    static constraints = {
        notificationType nullable: false, blank: false
        description nullable: false, blank: false
        date nullable: false, blank: false
    }
}
