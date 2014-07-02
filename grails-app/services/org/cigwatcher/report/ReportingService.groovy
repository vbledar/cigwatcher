package org.cigwatcher.report

import groovy.json.JsonBuilder
import org.cigwatcher.model.campaign.Campaign
import org.cigwatcher.model.campaign.CampaignInterval
import org.cigwatcher.model.user.User
import org.springframework.transaction.annotation.Transactional

class ReportingService {

    // dependency injection of the campaign service
    def campaignService

    def gerenateCampaignIntervalDataForUser(User user) {
        log.error 'Generating campaign interval data for user...'

        // generate campaign interval report data for user's current campaign
        return generateCampaignIntervalData(user.currentCampaign)

    }

    @Transactional (readOnly = true)
    def gerenateCampaignIntervalDataForUserWithPrediction(User user) {
        log.error 'Generating campaign interval data for user with prediction...'

        // generate campaign interval report data for user's current campaign
        // along with next intervals
        Campaign campaign = user.currentCampaign
        log.error 'Campaign complted: ' + campaign.completed

        CampaignInterval campaignInterval
        while (!campaign.completed) {
            log.error 'Adding new campaign interval...'
            campaignInterval = campaignService.createCampaignInterval(campaign)

            if (campaignInterval.cigarCounter == campaign.targetCigarCounter) {
                campaign.completed = Boolean.TRUE
            }

            campaign.addToIntervals(campaignInterval)
        }

        def data = generateCampaignIntervalData(campaign)

    }

    def generateCampaignIntervalData(Campaign campaign) {

        int counter = 0;
        def builder = new JsonBuilder()
        def data = builder {
            labels(
                    campaign?.intervals?.sort { it.startDate }.collect {
                        counter++
                    }
            )
            datasets({
                'fillColor' 'rgba(0,255,0,0.7)'
                'strokeColor' 'rgba(220,220,220,1)'
                'pointColor' 'rgba(220,220,220,1)'
                'pointStrokeColor' '#fff'
                data(
                        campaign?.intervals?.sort { it.startDate }.collect {
                            it.cigarCounter
                        }
                )
            },
                    {
                        'fillColor' "rgba(0,0,255,0.7)"
                        'strokeColor' "rgba(220,220,220,1)"
                        'pointColor' "rgba(220,220,220,1)"
                        'pointStrokeColor' "#fff"
                        data(
                                campaign?.intervals?.sort { it.startDate }.collect {
                                    it?.smokeCigars?.size()
                                }
                        )
                    })
        }
        return builder
    }
}
