package org.cigwatcher.settings

import org.cigwatcher.model.settings.PacketInfo

class SettingsController {

    // dependency injection of the settings service
    def settingsService

    // render settings page
    def settings() {

        def packetInformationEntries = PacketInfo.getAll()

        render (view: 'settings', model: [packetInformationEntries: packetInformationEntries])
    }

    // render packet information page
    def packetInformation() {

        // get packet info entry
        PacketInfo packetInfo = PacketInfo.get(params.id)

        if (!packetInfo) {
            settings()
            return;
        }

        render (view: 'packetInformation', model: [packetInformation: packetInfo])
    }

    def updatePacketInformation() {

        PacketInfo packetInfo = PacketInfo.get(params.id)
        if (!packetInfo) {
            flash.message = message (code: 'entry.not.found.with.id', default: 'Entry with id {0} not found', args: [params.id])
            log.error flash.message
            settings()
            return
        }

        bindData(packetInfo, params)
        log.error 'Packet packetName: ' + packetInfo.packetName

        if (!packetInfo.save()) {
            packetInfo.errors.each {
                log.error it
            }
        }

        render (view: 'packetInformation', model: [packetInformation: packetInfo])
    }

    def ajaxCreatePacketInfo() {

        PacketInfo packetInfo = new PacketInfo()
        bindData(packetInfo, params)

        if (!settingsService.createPacketInfo(packetInfo, session["user"])) {
            render (contentType: 'application/json') {
                ['success': false, message: 'Errors exist.']
            }
            return
        }

        render (template: 'packetInfoEntry', model: [packetInformation: packetInfo])
    }

    def deletePacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params.id)
        packetInfo.delete()

        settings()
        return
    }
    def ajaxDeletePacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params.id)
        packetInfo.delete()

        render (contentType: 'application/json') {
            ['success': true, 'message': 'Record removed successfully.']
        }
    }
}
