package org.cigwatcher.model.campaign

import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.user.User

class Packet {

    Date dateCreated
    Date lastUpdated

    static hasOne = [packetInfo: PacketInfo]

    static belongsTo = [user: User, campaign: Campaign, campaignInterval: CampaignInterval]

    static constraints = {
        packetInfo nullable: false
        user nullable: false
        campaign nullable: true
        campaignInterval nullable: true
    }
}
