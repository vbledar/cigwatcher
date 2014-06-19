package org.cigwatcher.model.user

import org.cigwatcher.model.settings.PacketInfo

class User {

    String username // authentication username
    String password // authentication password

    String firstname // user first packetName
    String lastname // user last packetName

    String email // user email

    Boolean recieveNotifications = Boolean.TRUE // user allows application to send notifications

    static hasMany = [packetInfos: PacketInfo]

    static constraints = {
        username (nullable: false, minSize: 5, maxSize: 12)
        password (nullable: false, minSize: 6, maxSize: 12)
        firstname (nullable: false, minSize: 2, maxSize: 25)
        lastname (nullable: false, minSize: 2, maxSize: 25)
        email (email: true, nullable: true)
        recieveNotifications (nullable: false)
    }
}
