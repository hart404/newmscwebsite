package org.mcdowellsonoran.notification

import grails.plugin.mail.MailService
import newmscwebsite.Person

/**
 * Operations involving the notification
 * of users.
 */
class NotificationService {

    MailService mailService

    /**
     * Sends an email notification.
     * @param notificationType NotificationType that has a populated recipient list
     * @param sender The email address that will show up in the "from" field
     * @param messageSubject The subject of the email
     * @param message The body of the email
     */
    void sendNotification(NotificationType notificationType,
                          String sender,
                          String messageSubject,
                          String message) {

        for(Person person : notificationType.recipients) {
            mailService.sendMail {
                to person.email
                from sender
                subject messageSubject
                body message
            }
        }
    }
}
