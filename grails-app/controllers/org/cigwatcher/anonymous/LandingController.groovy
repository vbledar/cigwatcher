package org.cigwatcher.anonymous

import org.cigwatcher.BaseController
import org.cigwatcher.model.campaign.CampaignInterval
import org.cigwatcher.model.user.User

class LandingController extends BaseController {

    def index() {

        if (flash.sessionexpired) {
            flash.warning = message(code: 'session.expired', default: 'Session expired. Please, login again.')
        }

        CampaignInterval campaignInterval
        int durationInSeconds
        if (session["user"]) {
            campaignInterval = getLoggedInUser()?.currentCampaign?.campaignInterval
            if (campaignInterval) {
                durationInSeconds = campaignInterval.nextCigarDurationInSecondsFromNow()
            }

        }

        render (view: 'index', model: [durationInSeconds: durationInSeconds])

    }
}
