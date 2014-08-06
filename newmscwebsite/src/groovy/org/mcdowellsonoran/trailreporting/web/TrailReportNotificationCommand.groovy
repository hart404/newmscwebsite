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
    String problemDescription

    @BindingFormat('yyyy-MM-dd')
    Date problemDate

    static constraints = {
        notificationType nullable: false, blank: false
        problemDescription nullable: false, blank: false
        problemDate nullable: false, blank: false
    }
}
