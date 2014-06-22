package org.cigwatcher.campaign

import org.cigwatcher.model.campaign.Campaign
import org.cigwatcher.model.campaign.CampaignInterval
import org.cigwatcher.model.user.User

class CampaignService {

    /**
     * Initialize a campaign by calculating the intervals, step of cigar cutting etc.
     *
     * @param user the logged in user.
     */
    def startCampaign(User user) {

        // set that the campaign is started now
        user.currentCampaign.startedOn = new Date()

        // calculate number of intervals for which this campaign must run
        Integer difference = user.currentCampaign.calculateDifference()

        // calculate number of intervals before decrease
        Integer everyWhen = user.currentCampaign.daysCounter / difference

        // update campaign
        user.currentCampaign.decreaseDaysCounter = everyWhen
        if (!user.currentCampaign.save()) {
            user.currentCampaign.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }
        return Boolean.TRUE
    }

    /**
     * Initialize new interval in the campaign.
     *
     * @param user the logged in user.
     */
    def startInterval(User user) {

        // create a new interval instance
        CampaignInterval campaignInterval = new CampaignInterval()

        // find this interval's index
        Integer intervalIndex = user.currentCampaign.intervals.size() + 1

        // calculate number of cigars to decrease in this interval
        Integer cigarCounter = intervalIndex / user.currentCampaign.decreaseDaysCounter

        // initialize the interval
        campaignInterval.cigarCounter = cigarCounter
        campaignInterval.startDate = new Date()

    }
}
