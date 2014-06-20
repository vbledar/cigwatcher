package org.cigwatcher.campaign

import org.cigwatcher.BaseController
import org.cigwatcher.model.campaign.Campaign

class CampaignController extends BaseController {


    def campaign() {

        Campaign campaign = getLoggedInUser()?.currentCampaign
        render (view: 'campaign', model: [campaign: campaign])
    }

}
