package org.cigwatcher.model.campaign

import groovy.time.TimeCategory

class CampaignInterval {

    static Integer dayIntervalCounter = 16 * 60 // a day is defined to 16 hours were you are able to smoke

    Integer cigarCounter // cigars allowed in this interval

    Boolean successful = Boolean.FALSE // defines if the interval was completed successfully
    Boolean completed = Boolean.FALSE // defines if the interval is completed

    Date startDate // date on which this interval was started
    Date completionDate // date on which this interval was completed

    Date dateCreated // date on which this interval was created
    Date lastUpdated // date on which this interval was last updated

    static belongsTo = [campaign: Campaign]

    static hasMany = [smokeCigars: SmokeCigar, packets: Packet]

    static constraints = {
        cigarCounter nullable: false
        successful nullable: false
        completed nullable: false
        startDate nullable: false
        completionDate nullable: true
        campaign nullable: true
        smokeCigars nullable: true
        packets nullable: true
    }

    static mapping = {
        smokeCigars sort: 'smokedOn', order: 'asc'
    }

    /**
     * Calculate next cigar datetime.
     *
     * The calculation thinks that a day is 16 hours long. This translates
     * into 16 * 60 minutes. Between two cigars there is non smoke period
     * equivalent to day duration divided by the number of cigars allowed
     * in this interval. So the next cigar is to be smoked after the non
     * smoke period multiplied with the number of cigars already smoked
     * and added to the interval's start date.
     *
     * Example:
     *
     * Interval started on 24/06/2014 10:00.
     * Interval allows 10 cigars.
     * Non smoke period is (16 * 60) / 10 = 96 minutes
     * If 5 cigars have been smoked already then next cigar date is:
     *
     * 24/06/2014 10:00 + (5 * 96 = 480 minutes) = 24/06/2014 18:00
     *
     * @return <code>Date</code> the next cigar that can be smoked date.
     */
    def calculateNextCigarDate() {

        // your are allowed to smoke one cigar every calculated minutes
        Integer nonSmokePeriod = CampaignInterval.dayIntervalCounter / cigarCounter

        // calculate next cigar date based on when this interval was started
        Integer smokePeriod
        if (smokeCigars?.size() > 0) {
            smokePeriod = smokeCigars.size() * nonSmokePeriod
        } else {
            // return the date of the interval start
            return startDate
        }

        use (TimeCategory) {
            return startDate + smokePeriod.minutes
        }
    }
}
