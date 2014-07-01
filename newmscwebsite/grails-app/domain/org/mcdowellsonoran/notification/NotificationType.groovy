package org.mcdowellsonoran.notification

import newmscwebsite.Person

/**
 * Stores the different types of scenarios where a notification
 * is appropriate. Can be things like an emergency situation
 * or when maintenance is needed
 */
class NotificationType {

    // A unique, one word description of the notification
    // type such as "maintenance" or "emergency"
    String code

    // The display name that will be used on user-facing
    // elements
    String display

    // The list of users who will receive a notification
    // of the configured type
    static hasMany = [recipients: Person]

    static constraints = {
        code nullable: false, unique: true
        display nullable: false
        recipients nullable: true
    }
}
