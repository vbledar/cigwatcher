package org.cigwatcher.model.settings

import org.cigwatcher.model.campaign.Packet
import org.cigwatcher.model.user.User

class PacketInfo {

    String packetName // packet packetName

    Double price // packet price

    Integer cigCount // number of cigars in packet

    Integer packetsBought = 0 // number of packets baught so far

    Date lastPacketBought // latest packet bought date

    Date dateCreated
    Date lastUpdated

    Boolean visible = Boolean.TRUE

    static belongsTo = [user: User]

    static hasMany = [packets: Packet]

    static constraints = {
        packetName nullable: false, size: 3..30
        price nullable: false, max: 999D
        cigCount nullable: false, max: 50
        user nullable: false
        lastPacketBought nullable: true
        packets nullable: true
        visible nullable: true
    }

    Double totalPaid() {
        return packetsBought * price
    }
}
