package org.mcdowellsonoran.trailreporting

import newmscwebsite.TrailReport

class TrailReportingService {

    TrailReport saveTrailReport(TrailReport trailReport) {
        return trailReport.save()
    }
}
