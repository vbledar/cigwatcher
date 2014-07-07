package org.cigwatcher.campaign

import org.cigwatcher.model.campaign.Campaign
import org.cigwatcher.model.campaign.CampaignInterval
import org.cigwatcher.model.campaign.Packet
import org.cigwatcher.model.campaign.SmokeCigar
import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.user.User

class CampaignService {

    /**
     * Create a new campaign interval in the given campaign.
     *
     * @param campaign, the campaign to update.
     *
     * @return the campaign interval created.
     */
    def createCampaignInterval(Campaign campaign) {
        // create a new interval instance
        CampaignInterval campaignInterval = new CampaignInterval()

        // find this interval's index
        Integer intervalIndex = campaign.intervals.size()
        log.debug 'Interval Index: ' + intervalIndex

        // calculate number of cigars to decrease in this interval
        Integer cigarCounter = intervalIndex / campaign.decreaseDaysCounter
        log.debug 'Cigar Counter: ' + cigarCounter
        log.debug 'Decrease days counter is: ' + campaign.decreaseDaysCounter

        // initialize the interval
        campaignInterval.cigarCounter = campaign.currentCigarCounter - cigarCounter
        log.debug 'Campaign interval cigar counter is: ' + campaignInterval.cigarCounter

        campaignInterval.startDate = new Date()
        campaignInterval.campaign = campaign

        return campaignInterval
    }

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

        // finalize previous campaign interval if any exists
        if (user.currentCampaign.campaignInterval) {
            user.currentCampaign.campaignInterval.completed = Boolean.TRUE

            if (!user.currentCampaign.campaignInterval.save()) {
                log.error 'Failed to finalize previous campaign interval...'
                user.currentCampaign.campaignInterval.errors.each {
                    log.error it
                }
                return Boolean.FALSE
            }
        }

        // get campaign interval instance
        CampaignInterval campaignInterval = createCampaignInterval(user.currentCampaign)

        // store all changes made
        user.currentCampaign.addToIntervals(campaignInterval)
        user.currentCampaign.campaignInterval = campaignInterval

        if (!user.currentCampaign.save()) {
            log.error 'Failed to update current campaign.'
            user.currentCampaign.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }

    /**
     * Add new packet bought on user, this current campaign and current running interval.
     *
     * @param user the user to which to add the packet bought
     * @param packetInfo packet information.
     * @return
     */
    def applyPacketBought(User user, PacketInfo packetInfo) {
        return applyPacketBought(user, user.currentCampaign, user.currentCampaign.campaignInterval, packetInfo)
    }

    def applyPacketBought(User user, Campaign campaign, CampaignInterval campaignInterval, PacketInfo packetInfo) {

        def packet = new Packet(packetInfo: packetInfo)

        // apply changes on packet info
        packetInfo.addToPackets(packet);
        packetInfo.packetsBought++
        packetInfo.lastPacketBought = new Date()

        if (!packetInfo.save()) {
            log.error 'Failed to apply changes on packet info'
            packetInfo.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        // apply changes on user
        if (user) {
            user.addToPackets(packet)

            if (!user.save()) {
                log.error 'Failed to apply changes on user'
                user.errors.each {
                    log.error it
                }
                return Boolean.FALSE
            }
        }

        // apply changes on campaign
        if (campaign) {
            campaign.addToPackets(packet)
            campaign.packetCounter++
            campaign.lastPacketBoughtOn = new Date()

            if (!campaign.save()) {
                log.error 'Failed to apply changes on campaign'
                campaign.errors.each {
                    log.error it
                }

                return Boolean.FALSE
            }
        }

        // apply changes on campaign interval
        if (campaignInterval) {
            campaignInterval.addToPackets(packet)

            if (!campaignInterval.save()) {
                log.error 'Failed to apply changes on campaign interval'
                campaignInterval.errors.each {
                    log.error it
                }

                return Boolean.FALSE
            }
        }

        // apply changes on packet
        if (!packet.save()) {
            log.error 'Failed to create packet'
            packet.errors.each {
                log.error it
            }

            return Boolean.FALSE
        }

        return Boolean.TRUE
    }

    def cigarSmoked(User user, Boolean smoked) {
        return cigarSmoked(user, user.currentCampaign, user.currentCampaign.campaignInterval, smoked)
    }

    def cigarSmoked(User user, Campaign campaign, CampaignInterval campaignInterval, Boolean smoked) {

        def smokeCigar = new SmokeCigar()
        smokeCigar.smoked = smoked
        smokeCigar.shouldBeSmokedOn = campaignInterval.calculateNextCigarDate()

        // apply changes on campaign
        if (campaign) {
            campaign.cigarCounter++
            campaign.lastCigarSmokedOn = new Date()

            if (!campaign.save()) {
                log.error 'Failed to update campaign'
                campaign.errors.each {
                    log.error it
                }

                return Boolean.FALSE
            }
        }

        // apply changes on campaign interval
        if (campaignInterval) {
            campaignInterval.addToSmokeCigars(smokeCigar)

            if (!campaignInterval.save()) {
                log.error 'Failed to update campaign interval'
                campaignInterval.errors.each {
                    log.error it
                }

                return Boolean.FALSE
            }
        }

        // check if the interval is completed
        if (campaignInterval.cigarCounter == campaignInterval.smokeCigars.size()) {
            campaignInterval.completed = Boolean.TRUE
            campaignInterval.successful = Boolean.TRUE
        } else if (campaignInterval.cigarCounter < campaignInterval.smokeCigars.size()) {
            campaignInterval.successful = Boolean.FALSE
        }

        // create smoke cigar instance
        if (!smokeCigar.save()) {
            log.error 'Failed to create smoke cigar'
            smokeCigar.errors.each {
                log.error it
            }

            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
