package org.cigwatcher.campaign

import org.cigwatcher.BaseController
import org.cigwatcher.model.campaign.Campaign

class CampaignController extends BaseController {


    def campaign() {
        Campaign currentCampaign = getLoggedInUser()?.currentCampaign
        render (view: 'campaign', model: [currentCampaign: currentCampaign])
    }

    def createCampaign() {
        Campaign campaign = new Campaign()
        render (view: 'createCampaign', model: [campaign: campaign])
    }

    def persistCampaign() {

        // create campaign instnace
        Campaign campaign = new Campaign()
        bindData(campaign, params)

        // attach campaign to user
        loggedInUser.currentCampaign = campaign
        if (!loggedInUser.campaigns) {
            loggedInUser.campaigns = new HashSet<>()
        }
        loggedInUser.campaigns.add(campaign)

        // persist changes in user
        if (!loggedInUser.save()) {
            loggedInUser.errors.each {
                log.error it
            }

            log.error 'Failed to persist user after campaign creation.'
            render (view: 'createCampaign', model: [campaign: campaign])
            return
        }

        // attach user to campaign
        campaign.user = getLoggedInUser()

        // persist campaign
        if (!campaign.save()) {
            campaign.errors.each {
                log.error it
            }

            log.error 'Failed to persist campaign.'
            render (view: 'createCampaign', model: [campaign: campaign])
            return
        }

        log.error 'Redirecting to campaign.'
        redirect (action: 'campaign')
    }
}
