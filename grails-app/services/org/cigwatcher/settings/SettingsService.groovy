package org.cigwatcher.settings

import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.user.User

class SettingsService {

    def createPacketInfo(PacketInfo packetInfo, User user) {

        User.list().each {
            log.error "User names: " + it.username
        }
        log.error 'User id is: ' + user.id
        User loggedInUser = User.get(user.id)

        if (!loggedInUser) {
            log.error 'Logged in user with id not found!'
        }

        // attach packet info to user
        if (!loggedInUser.packetInfos) {
            loggedInUser.packetInfos = new HashSet<>()
        }
        loggedInUser.packetInfos.add(packetInfo)
        if (!loggedInUser.save()) {
            loggedInUser.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        // attach user to packet info
        packetInfo.user = loggedInUser
        if (!packetInfo.save()) {
            packetInfo.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
