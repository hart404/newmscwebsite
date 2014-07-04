package org.mcdowellsonoran.trailreporting

import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import org.mcdowellsonoran.notification.NotificationType

class TrailReport {
        TrailSection trailSection
        String comment
        String code
		LocalDate date

		// Indication if there is an issue with the trails section being reported on.
		// If it is false, it means the section was patrolled with no issues.
		Boolean issue = false

        NotificationType notificationType

        Date dateCreated
		Date lastUpdated
        
        static constraints = {
                comment(size: 0..2048)
        }

}
