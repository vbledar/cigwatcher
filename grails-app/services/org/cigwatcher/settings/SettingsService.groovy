package org.cigwatcher.settings

import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.user.User

class SettingsService {

    def createPacketInfo(PacketInfo packetInfo, User user) {
        // attach packet info to user
        if (!user.packetInfos) {
            user.packetInfos = new HashSet<>()
        }
        user.packetInfos.add(packetInfo)
        if (!user.save()) {
            user.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        // attach user to packet info
        packetInfo.user = user
        if (!packetInfo.save()) {
            packetInfo.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
