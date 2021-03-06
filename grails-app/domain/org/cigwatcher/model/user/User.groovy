package org.cigwatcher.model.user

import org.cigwatcher.model.campaign.Campaign
import org.cigwatcher.model.campaign.Packet
import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.settings.ReportInfo

class User {

    String username // authentication username
    String password // authentication password

    String firstname // user first packetName
    String lastname // user last packetName

    String email // user email

    Boolean recieveNotifications = Boolean.TRUE // user allows application to send notifications

    Campaign currentCampaign // the current campaign the user is running

    static hasMany = [packetInfos: PacketInfo, packets: Packet, campaigns: Campaign, reportInfos: ReportInfo]

    static constraints = {
        username (nullable: false, minSize: 5, maxSize: 12)
        password (nullable: false, minSize: 2, maxSize: 12)
        firstname (nullable: false, minSize: 2, maxSize: 25)
        lastname (nullable: false, minSize: 2, maxSize: 25)
        email (email: true, nullable: true)
        recieveNotifications (nullable: false)
        currentCampaign nullable: true
        packetInfos nullable: true
        packets nullable: true
        campaigns nullable: true
        reportInfos nullable: true
    }
}
