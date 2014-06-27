package org.cigwatcher.model.campaign

import org.cigwatcher.model.user.User

class Campaign {

    // days in which the goal must be achieved
    Integer daysCounter = 30

    // every when a decrease will occur on cigars smoked every day
    Integer decreaseDaysCounter

    // current number of cigars smoked per day
    Integer currentCigarCounter = 20

    // target number of cigars smoked per day
    Integer targetCigarCounter = 10

    // how many cigars have been smoked so far in this campaign
    Integer cigarCounter = 0

    // how many packets have been bought so far in this campaign
    Integer packetCounter = 0

    // date on which latest cigar was smoked on
    Date lastCigarSmokedOn

    // date on which latest packet was bought on
    Date lastPacketBoughtOn

    // current interval running
    CampaignInterval campaignInterval

    // date on which this campaign started
    Date startedOn

    // defines if this campaign was completed successfully
    Boolean successful = Boolean.FALSE

    // defines if this campaign is completed
    Boolean completed = Boolean.FALSE

    // date on which this campaign was created
    Date dateCreated

    // date on which latest modification occured
    Date lastUpdated

    static belongsTo = [user: User]

    static hasMany = [packets: Packet, intervals: CampaignInterval]

    static constraints = {
        daysCounter nullable: false
        decreaseDaysCounter nullable: true
        currentCigarCounter nullable: false
        targetCigarCounter nullable: false
        cigarCounter nullable: false
        packetCounter nullable: false
        lastCigarSmokedOn nullable: true
        lastPacketBoughtOn nullable: true
        campaignInterval nullable: true
        startedOn nullable: true
        successful nullable: false
        completed nullable: false
        user nullable: false
        packets nullable: true
        intervals nullable: true
    }

    static mapping = {
        intervals sort: 'startDate', order: 'desc'
    }

    /**
     * Calculates the difference from current cigars smoked per day and target cigars smoked
     * per day.
     *
     * @return <code>Integer</code> the difference between the two values.
     */
    Integer calculateDifference() {
        return currentCigarCounter - targetCigarCounter
    }
}
