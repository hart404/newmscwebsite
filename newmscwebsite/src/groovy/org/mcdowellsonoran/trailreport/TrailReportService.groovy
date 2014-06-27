package org.mcdowellsonoran.trailreport

import newmscwebsite.TrailReport

/**
 * Operations for TrailReports.
 */
public interface TrailReportService {

    /**
     * Saves a TrailReport to the configured datastore.
     * @param trailReport TrailReport to save
     * @return Persisted TrailReport instance
     */
    TrailReport saveTrailReport(TrailReport trailReport)
}