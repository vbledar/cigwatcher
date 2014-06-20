package org.cigwatcher.model.campaign

class CampaingInterval {

    Integer cigarCounter // cigars allowed in this interval

    Date intervalDate // interval implementation date

    Date dateCreated
    Date lastUpdated

    static belongsTo = [campaign: Campaign]

    static hasMany = [smokeCigars: SmokeCigar]

    static constraints = {
        cigarCounter nullable: false
        intervalDate nullable: false
        campaign nullable: true
        smokeCigars nullable: true
    }
}
