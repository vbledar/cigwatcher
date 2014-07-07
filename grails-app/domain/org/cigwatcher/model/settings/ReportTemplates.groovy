package org.cigwatcher.model.settings

class ReportTemplates {

    String name // template name
    String template // template url

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false
        template nullable: false, url: true, unique: true
    }
}
