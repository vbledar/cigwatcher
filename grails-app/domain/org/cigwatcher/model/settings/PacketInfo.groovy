package org.cigwatcher.model.settings

import org.cigwatcher.model.user.User

class PacketInfo {

    String packetName // packet packetName

    Double price // packet price

    Integer cigCount // number of cigars in packet

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User]

    static constraints = {
        packetName (nullable: false, minSize: 3, maxSize: 20)
        price (nullable: false, max: 999D)
        cigCount (nullable: false, max: 50)
    }
}
