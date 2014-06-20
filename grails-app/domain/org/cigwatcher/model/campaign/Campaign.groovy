package org.cigwatcher.model.campaign

import org.cigwatcher.model.user.User

class Campaign {

    Integer daysCounter = 30

    Integer currentCigarCounter = 20
    Integer targetCigarCounter = 10

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
        currentCigarCounter nullable: false
        targetCigarCounter nullable: false
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
