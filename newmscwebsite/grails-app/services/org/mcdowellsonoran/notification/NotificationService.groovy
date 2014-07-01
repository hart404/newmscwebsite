package org.mcdowellsonoran.notification

import grails.plugin.mail.MailService
import newmscwebsite.Person

class NotificationService {

    MailService mailService

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
