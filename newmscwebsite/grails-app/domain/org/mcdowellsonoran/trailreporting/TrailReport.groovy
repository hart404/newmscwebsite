package org.mcdowellsonoran.trailreporting

import newmscwebsite.TrailSection

/**
 * Models the data from a user reporting on a
 * section of trail that they have recently
 * visited.
 */
class TrailReport {

    TrailSection trailSection
    Date date

    // Indication if there is an issue with the trails section being reported on.
    // If it is false, it means the section was patrolled with no issues.
    Boolean issue = false

    // When there is an issue on a trail section, trailReportNotification
    // stores the user input about that issue. This can be null since
    // trails won't normally have issues to report.
    static hasOne = [trailReportNotification: TrailReportNotification]

    Date dateCreated
    Date lastUpdated


    static constraints = {
        trailSection nullable: false
        date nullable: false
        trailReportNotification nullable: true
    }
}