package org.cigwatcher.report

import groovy.json.JsonBuilder
import org.cigwatcher.BaseController
import org.cigwatcher.model.campaign.Campaign

class ReportController extends BaseController {

    // dependency injection of the reporting service
    def reportingService

    def beforeInterceptor = [action: this.&authorized, except: 'index']

    /**
     * Generate the report data for campaign's intervals.
     *
     * @param campaign the campaign for which the report
     * is being generated for.
     */
    def campaignIntervalsReport() {

        def builder = reportingService.gerenateCampaignIntervalDataForUserWithPrediction(getLoggedInUser())
        render (view: 'campaignReportingIntervals', model: [data: builder.toPrettyString()])
    }

    def campaignIntervalReportPrediction() {
        def builder = reportingService.gerenateCampaignIntervalDataForUserWithPrediction(getLoggedInUser())
        render (view: 'campaignReportingIntervals', model: [data: builder.toPrettyString()])
    }
}
