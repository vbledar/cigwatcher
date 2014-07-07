package org.cigwatcher.settings

import org.cigwatcher.BaseController
import org.cigwatcher.model.settings.PacketInfo
import org.cigwatcher.model.settings.ReportInfo
import org.cigwatcher.model.settings.ReportTemplates
import org.hibernate.type.YesNoType

class SettingsController extends BaseController {

    static String INSTANCE_ID = "instanceId"
    static String SERVICE_PARAM = "service"
    static String RETURN_EXECUTION = "execreturn"

    static String PACKET_INFORMATION_SERVICE = "packetInformation"
    static String DELETE_PACKET_INFO_SERVICE = "deletePacketInfo"
    static String REPORT_MANAGEMENT_SERVICE = "reportManagement"

    // dependency injection of the settings service
    def settingsService

    def beforeInterceptor = [action: this.&authorized, except: 'index']

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

        def packetInformationEntries = getLoggedInUser().packetInfos
        def reportInformationEntries = getLoggedInUser().reportInfos
        def reportTemplates = ReportTemplates.getAll()

        render (view: 'settings', model: [packetInformationEntries: packetInformationEntries,
                                          reportInformationEntries: reportInformationEntries,
                                          reportTemplates: reportTemplates,
                                          params: params])
    }

    // render packet information page
    def packetInformation() {

        // get packet info entry
        PacketInfo packetInfo = PacketInfo.get(params[INSTANCE_ID])

        if (!packetInfo) {
            flash.error = message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
            params.remove(RETURN_EXECUTION)
            return;
        }

        render (view: 'packetInformation', model: [packetInformation: packetInfo])
    }

    // update packet information
    def updatePacketInformation() {

        PacketInfo packetInfo = PacketInfo.get(params.id)
        if (!packetInfo) {
            flash.error = message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
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

    // create a new packet information entry
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

    // delete packet information entry
    def deletePacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params[INSTANCE_ID])
        if (!packetInfo) {
            flash.error = message(code: 'instance.object.not.found.for.id', args: [params[INSTANCE_ID], PacketInfo.class.name])
            return
        }

        if (!settingsService.deletePacketInfo(packetInfo, true)) {
            flash.error = message (code: 'instance.object.delete.failure', args: [params[INSTANCE_ID], PacketInfo.class.name])
            render (contentType: 'application/json') {
                ['success': false, 'message': flash.error]
            }
            return
        }
    }

    // delete packet information entry using ajax
    def ajaxDeletePacketInfo() {
        log.error 'Delete packet info...'
        PacketInfo packetInfo = PacketInfo.get(params.id)

        try {
            if (!settingsService.deletePacketInfo(packetInfo, false)) {
                flash.error = message(code: 'instance.object.delete.failure', args: [params.id, PacketInfo.class.name])
                render(contentType: 'application/json') {
                    ['success': false, 'message': flash.error]
                }
                return
            }

            render(contentType: 'application/json') {
                ['success': true, 'message': 'Record removed successfully.']
            }
        } catch (Exception ex) {
            render(contentType: 'application/json') {
                ['success': false, 'message': ex.message]
            }
        } catch (RuntimeException rex) {
            render(contentType: 'application/json') {
                ['success': false, 'message': rex.message]
            }
        }
    }

    // change packet info visibility
    def ajaxVisibilityStatusPacketInfo() {
        PacketInfo packetInfo = PacketInfo.get(params[INSTANCE_ID])
        Boolean visible = "Yes".equalsIgnoreCase(params.visible.trim()) ? Boolean.TRUE : Boolean.FALSE

        try {
            if (!settingsService.changePacketInfoVisibility(packetInfo, visible)) {
                flash.error = message(code: 'instance.object.visibility.change.failure', args: [params.id, PacketInfo.class.name])
                render(contentType: 'application/json') {
                    ['success': false, 'message': flash.error]
                }
                return
            }

            render(contentType: 'application/json') {
                ['success': true, 'message': 'Visibility changed successfully.']
            }
        } catch (Exception ex) {
            render(contentType: 'application/json') {
                ['success': false, 'message': ex.message]
            }
        } catch (RuntimeException rex) {
            render(contentType: 'application/json') {
                ['success': false, 'message': rex.message]
            }
        }
    }

    def ajaxCreateReportInfo() {

        ReportInfo reportInfo = new ReportInfo()
        bindData(reportInfo, params)

        if (!settingsService.createReportInfo(reportInfo, getLoggedInUser())) {
            render (contentType: 'application/json') {
                ['success': false, message: 'Errors exist.']
            }
            return
        }

        render (template: 'reportInfoEntry', model: [reportInformation: reportInfo])
    }
}
