package org.cigwatcher.campaign

import org.cigwatcher.BaseController
import org.cigwatcher.model.campaign.Campaign
import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.user.User

class CampaignController extends BaseController {

    // dependency injection of the campaign service
    def campaignService

    def beforeInterceptor = [action: this.&authorized, except: 'index']

    // render campaign
    def campaign() {
        Campaign currentCampaign = getLoggedInUser()?.currentCampaign
        def packetInfos = getLoggedInUser().packetInfos
        render (view: 'campaign', model: [currentCampaign: currentCampaign, packetInfos: packetInfos])
    }

    // render create campaign
    def createCampaign() {
        Campaign campaign = new Campaign()
        render (view: 'createCampaign', model: [campaign: campaign])
    }

    // create campaign
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

        redirect (action: 'campaign')
    }

    // start current campaign
    def startCampaign() {
        campaignService.startCampaign(getLoggedInUser())
        redirect (action: 'campaign')
    }

    // start interval
    def startInterval() {

        // get logged in user instance
        User user = getLoggedInUser()

        if (!campaignService.startInterval(user)) {
            flash.error = message (code: 'failed.to.start.campaign.interval', default: 'Failed to start a new campaign interval. Please, try again later.')
        } else {
            flash.success = message (code: 'success.to.start.campaign.interval', default: 'Successfully started new campaign interval.')
        }

        redirect (action: 'campaign')
    }

    // add packet to user
    def addPacketToUser() {

        // get logged in user instance
        User user = getLoggedInUser()

        // get packet info instance
        PacketInfo packetInfo = PacketInfo.get(params.packetInfoId)

        if (!packetInfo) {
            // packet info instance not found
            flash.error = message (code: 'instance.object.not.found.for.id', args: [PacketInfo.class.name, params.packetInfoId])
        } else {
            // create packet
            if (!campaignService.applyPacketBought(user, null, null, packetInfo)) {
                flash.success = message (code: 'packet.added.successfully.', default: 'Packet added successfully')
            }
        }

        if (params.previousController && params.previousAction) {
            redirect (controller: params.previousController, action: params.previousAction)
            return
        } else {
            redirect (controller: 'landing', action: 'index')
            return
        }
    }

    // add packet to campaign interval
    def addPacketToCampaignInterval() {

        // get user source page
        def redirectUrl = getRequest().getHeader("referer")

        // get logged in user instance
        User user = getLoggedInUser()

        // get packet info instance
        PacketInfo packetInfo = PacketInfo.get(params.packetInfoId)

        if (!packetInfo) {
            // packet info instance not found
            flash.error = message (code: 'instance.object.not.found.for.id', args: [PacketInfo.class.name, params.packetInfoId])
        } else {
            // create packet
            if (!campaignService.applyPacketBought(user, packetInfo)) {
                flash.error = message (code: 'packet.added.failure', default: 'Failed to add new packet. Please, try again later.')
            } else {
                flash.success = message (code: 'packet.added.successfully.', default: 'Packet added successfully')
            }
        }

        if (redirectUrl) {
            redirect (url: redirectUrl)
            return
        } else {
            redirect (controller: 'landing', action: 'index')
            return
        }
    }

    // add cigar to campaign interval
    def addCigarToCampaignInterval() {

        // get user source page
        def redirectUrl = getRequest().getHeader("referer")

        // get logged in user instance
        User user = getLoggedInUser()

        if (!campaignService.cigarSmoked(user)) {
            flash.message = message (code: 'smoke.cigar.added.failure', default: 'Failed to add new smoke cigar. Please, try again later.')
        } else {
            flash.success = message (code: 'smoke.cigar.added.successfully', default: 'Cigar added successfully')
        }

        if (redirectUrl) {
            redirect (url: redirectUrl)
        } else {
            redirect (controller: 'landing', action: 'index')
        }
    }
}
