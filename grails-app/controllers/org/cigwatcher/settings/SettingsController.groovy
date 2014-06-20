package org.cigwatcher.settings

import org.cigwatcher.BaseController
import org.cigwatcher.model.settings.PacketInfo

class SettingsController extends BaseController {

    static String INSTANCE_ID = "instanceId"
    static String SERVICE_PARAM = "service"
    static String RETURN_EXECUTION = "execreturn"

    static String PACKET_INFORMATION_SERVICE = "packetInformation"
    static String DELETE_PACKET_INFO_SERVICE = "deletePacketInfo"

    // dependency injection of the settings service
    def settingsService

    // render settings page
    def settings() {

        if (params[SERVICE_PARAM]) {
            try {
                String serviceParam = params[SERVICE_PARAM]

                // delete packet information
                if (DELETE_PACKET_INFO_SERVICE.equalsIgnoreCase(serviceParam)) {
                    deletePacketInfo()
                } else if (PACKET_INFORMATION_SERVICE.equalsIgnoreCase(serviceParam)) {
                    packetInformation()
                }
            } finally {
                params.remove(SERVICE_PARAM)
                params.remove(INSTANCE_ID)

                if (params[RETURN_EXECUTION]) {
                    return
                }
            }
        }

        def packetInformationEntries = PacketInfo.getAll()
        render (view: 'settings', model: [packetInformationEntries: packetInformationEntries, params: params])
    }

    // render packet information page
    def packetInformation() {

        // get packet info entry
        PacketInfo packetInfo = PacketInfo.get(params[INSTANCE_ID])

        if (!packetInfo) {
            message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
            params.remove(RETURN_EXECUTION)
            return;
        }

        render (view: 'packetInformation', model: [packetInformation: packetInfo])
    }

    def updatePacketInformation() {

        PacketInfo packetInfo = PacketInfo.get(params.id)
        if (!packetInfo) {
            message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
            log.error flash.message
            settings()
            return
        }
        bindData(packetInfo, params)

        if (!packetInfo.save()) {
            packetInfo.errors.each {
                log.error it
            }
        }

        render (view: 'packetInformation', model: [packetInformation: packetInfo])
    }

    def ajaxCreatePacketInfo() {

        // create packet info record
        PacketInfo packetInfo = new PacketInfo()
        bindData(packetInfo, params)

        if (!settingsService.createPacketInfo(packetInfo, getLoggedInUser())) {
            render (contentType: 'application/json') {
                ['success': false, message: 'Errors exist.']
            }
            return
        }

        render (template: 'packetInfoEntry', model: [packetInformation: packetInfo])
    }

    def deletePacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params[INSTANCE_ID])
        if (!packetInfo) {
            flash.message = message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
            return
        }
        packetInfo.delete(flush: true)
    }

    def ajaxDeletePacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params.id)
        packetInfo.delete()

        render (contentType: 'application/json') {
            ['success': true, 'message': 'Record removed successfully.']
        }
    }
}
