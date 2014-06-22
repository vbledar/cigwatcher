package org.cigwatcher.model.campaign

class CampaignInterval {

    Integer cigarCounter // cigars allowed in this interval

    Boolean successful = Boolean.FALSE // defines if the interval was completed successfully
    Boolean completed = Boolean.FALSE // defines if the interval is completed

    Date startDate // date on which this interval was started
    Date completionDate // date on which this interval was completed

    Date dateCreated // date on which this interval was created
    Date lastUpdated // date on which this interval was last updated

    static belongsTo = [campaign: Campaign]

    static hasMany = [smokeCigars: SmokeCigar]

    static constraints = {
        cigarCounter nullable: false
        successful nullable: false
        completed nullable: false
        startDate nullable: false
        completionDate nullable: true
        campaign nullable: true
        smokeCigars nullable: true
    }
}
