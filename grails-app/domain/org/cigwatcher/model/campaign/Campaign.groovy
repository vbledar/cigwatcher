package org.cigwatcher.model.campaign

import org.cigwatcher.model.user.User

class Campaign {

    Integer daysCounter

    Integer cigarCounter = 0
    Integer packetCounter = 0

    Date lastCigarSmokedOn
    Date lastPacketBoughtOn

    Date startedOn

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User]

    static hasMany = [packets: Packet, intervals: CampaingInterval]

    static constraints = {
        daysCounter nullable: false
        cigarCounter nullable: false
        packetCounter nullable: false
        lastCigarSmokedOn nullable: true
        lastPacketBoughtOn nullable: true
        startedOn nullable: true
        user nullable: false
        packets nullable: true
        intervals nullable: true
    }
}
