package org.mcdowellsonoran.trailreporting

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import newmscwebsite.TrailReport
import newmscwebsite.TrailSection
import org.joda.time.LocalDate
import spock.lang.Specification

@TestFor(TrailReportingService)
@Mock([TrailReport])
class TrailReportingServiceSpec extends Specification{

    void "test save trail report data successfully from client"() {
        given: "A valid trail report"
        TrailReport trailReport = new TrailReport(comment: "test comment",
                                                  code: "test code",
                                                  date: new LocalDate(),
                                                  trailSection: new TrailSection())

        when: "The trail report is saved"
        TrailReport result = service.saveTrailReport(trailReport)

        then: "The saved TrailReport is returned with a valid id"
        "test comment" == result.comment
        result.id
    }
}
