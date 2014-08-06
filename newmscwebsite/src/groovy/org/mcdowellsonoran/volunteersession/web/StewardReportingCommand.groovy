package org.mcdowellsonoran.volunteersession.web

import grails.validation.Validateable
import org.grails.databinding.BindingFormat

@Validateable
class StewardReportingCommand {

    List<VolunteerSessionCommand> volunteerSessions

    static constraints = {
        volunteerSessions nullable: false, blank: false
    }
}

@Validateable
class VolunteerSessionCommand {

    @BindingFormat('yyyy-MM-dd')
    Date date

    String program
    BigDecimal hours
    List<TrailReportCommand> trailReports
    Integer validationRow

    static constraints = {
        date nullable: false, blank: false
        program nullable: false, blank: false, notEqual: "null"
        hours nullable: false, blank: false, notEqual: 0 as BigDecimal
        trailReports nullable: true, blank: true
        validationRow nullable: false, blank: false
    }
}

@Validateable
class TrailReportCommand {

    String notificationType
    String problemDescription

    @BindingFormat('yyyy-MM-dd')
    Date problemDate

    Boolean issue
    Long pinId

    static constraints = {
        notificationType nullable: true, blank: true
        problemDescription nullable: true, blank: true
        problemDate nullable: true, blank: true
        issue nullable: false, blank: false
        pinId nullable: false, blank: false
    }
}
