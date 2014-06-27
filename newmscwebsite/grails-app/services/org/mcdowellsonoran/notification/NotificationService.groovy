package org.mcdowellsonoran.notification

import grails.plugin.mail.MailService

class NotificationService {

    MailService mailService

    void sendNotification(NotificationType notificationType, String message) {

        mailService.sendMail {
            to notificationType.recipients.collect{it.email}
            from "noreply@mcdowellsonoran.org"
            subject "Action needed! From Mcdowell Sonoran"
            body message
        }
    }
}
