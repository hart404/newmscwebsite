package org.mcdowellsonoran.trailreport.relational

import newmscwebsite.TrailReport
import org.mcdowellsonoran.trailreport.TrailReportService

class RelationalTrailReportService implements TrailReportService {

    @Override
    TrailReport saveTrailReport(TrailReport trailReport) {
        return trailReport.save()
    }
}
