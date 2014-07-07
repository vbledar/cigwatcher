package org.cigwatcher.settings

import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.settings.ReportInfo
import org.cigwatcher.model.user.User

class SettingsService {

    /**
     * Create a new <code>PacketInfo</code> and attach it to
     * the user who created it.
     *
     * @param packetInfo, the record to create.
     * @param user, the user creating the record
     *
     * @return <code>Boolean.TRUE</code> if record is created
     * and attached successfully, <code>Boolean.FALSE</code>
     * otherwise.
     */
    def createPacketInfo(PacketInfo packetInfo, User user) {
        // attach packet info to user
        user.addToPacketInfos(packetInfo)
        if (!user.save()) {
            user.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }
        return Boolean.TRUE
    }

    /**
     * Delete packet info entry. If the given entry has been used
     * in a campaign, then it is only its visibility that changes.
     * When a packet info entry is invisible then it is not available
     * to be chosen in any action, but it remains related with the
     * user and shown in user's reports.
     *
     * @param packetInfo, the packet info entry to delete or make
     * invisible.
     * @param shouldFlush, define if the delete should be flashed
     * immediately.
     */
    def deletePacketInfo(PacketInfo packetInfo, Boolean shouldFlush) {

        if (!packetInfo?.packets?.isEmpty()) {
            packetInfo.visible = Boolean.FALSE
            if (!packetInfo.save()) {
                log.error 'Failed to make packet info invisible'
                packetInfo.errors.each {
                    log.error it
                }
                return Boolean.FALSE
            }
        } else {
            packetInfo.delete(flush: shouldFlush)
        }
        return Boolean.TRUE
    }

    def changePacketInfoVisibility(PacketInfo packetInfo, Boolean visible) {
        packetInfo.visible = visible
        if (!packetInfo.save()) {
            log.error 'Failed to make packet info invisible'
            packetInfo.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }
        return Boolean.TRUE
    }

    /**
     * Create a new <code>ReportInfo</code> and attach it to
     * the user who created it.
     *
     * @param reportInfo, the record to create.
     * @param user, the user creating the record
     *
     * @return <code>Boolean.TRUE</code> if record is created
     * and attached successfully, <code>Boolean.FALSE</code>
     * otherwise.
     */
    def createReportInfo(ReportInfo reportInfo, User user) {
        // attach report info to user
        user.addToReportInfos(reportInfo)
        if (!user.save()) {
            log.error 'Failed to attach report info to user'
            user.errors.each {
                log.error it
            }
            return Boolean.FALSE
        }

        return Boolean.TRUE
    }
}
