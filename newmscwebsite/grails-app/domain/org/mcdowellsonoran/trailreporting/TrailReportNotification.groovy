package org.mcdowellsonoran.trailreporting

import newmscwebsite.Person
import org.mcdowellsonoran.notification.NotificationType

/**
 * Models the notification that is entered
 * by the user when a trail has an issue.
 */
class TrailReportNotification {

    NotificationType notificationType
    String description
    Date date
    Person person
    TrailReport trailReport

    Date dateCreated
    Date lastUpdated

    static constraints = {
        notificationType nullable: false
        description nullable: false, blank: false
        date nullable: false
        person nullable: false
    }
}
