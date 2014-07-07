package org.cigwatcher.model.settings

import org.cigwatcher.model.user.User

class ReportInfo {

    Integer ordering // defines ordering of report

    String reportTemplate // report template associated with this report info

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User]

    static constraints = {
        ordering nullable: false
        reportTemplate nullable: false
        user nullable: false
    }
}
