package org.cigwatcher.model.campaign

class SmokeCigar {

    Boolean smoked = Boolean.FALSE // define if the user smoked this cigar

    Date smokedOn = new Date()// the date the cigar was smoked
    Date shouldBeSmokedOn // the date the cigar should be smoked

    static belongsTo = [interval: CampaignInterval]

    static constraints = {
        smoked nullable: false
        smokedOn nullable: true
        shouldBeSmokedOn nullable: false
        interval nullable: true
    }
}
