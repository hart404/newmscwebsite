package org.mcdowellsonoran.trailreport

import newmscwebsite.TrailReport

class TrailReportService {

    TrailReport saveTrailReport(TrailReport trailReport) {
        return trailReport.save()
    }
}
