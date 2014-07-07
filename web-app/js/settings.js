/**
 * Created by vbledar on 7/7/14.
 */

/**
 * Attach event handlers on settings page.
 */
function attachEventHandlersOnSettingsPage() {
    $('settings').on("pagecontainertransition", function(event, ui) {
        console.log('Settings page shown...');
    });

    $('#createPacketInfoButton').off('click').on('click', function(event) {
        execARFromElementWithSuccessAndErrorCallbacks(event, this, packetInfoCreateSuccess, packetInfoCreateFailure);
    });

    $('#createReportInfoButton').off('click').on('click', function(event) {
        execARFromElementWithSuccessAndErrorCallbacks(event, this, reportInfoCreateSuccess, reportInfoCreateFailure);
    });

    attachVisibilityStatusPacketInfoHandler();

    attachDeletePackeInfoEntryEventHandlers();
}

/**
 * Attach visibility status change handler.
 */
function attachVisibilityStatusPacketInfoHandler() {
    $('.visibility-slider').change(function(event) {
        // prevent default behaviour
        event.preventDefault();

        // selected value
        var selectedOption = $(this).find(':selected').text();

        // packet information entry
        var instanceId =  $(this).attr('data-id');

        // parameters to send on the other side
        var parameters = {};
        parameters.instanceId = instanceId;
        parameters.visible = selectedOption;

        // request action url
        var actionUrl = $(this).attr('action-url');

        // make request on server
        execARWithSuccessAndErrorCallbacks(event,  this, actionUrl, parameters, packetInfoVisibilityChangeSuccessfully, packetInfoVisibilityChangeFailed);
    });
}

/**
 *
 * @param event
 * @param element
 * @param data
 * @param textStatus
 * @param jqXHR
 * @constructor
 */
function packetInfoVisibilityChangeSuccessfully(event, element, data, textStatus, jqXHR) {
    showSuccessMessage(data.message);
}

/**
 *
 * @param event
 * @param element
 * @param data
 */
function packetInfoVisibilityChangeFailed(event, element, data) {
    showErrorMessage(data);
}

/**
 * Attach delete event handler on packet info entry.
 */
function attachDeletePackeInfoEntryEventHandlers() {
    $('.delete-packet-info-entry').off('click').on('click', function (event) {
        event.preventDefault();
        var id = $(this).attr('data-item-id');
        var parameters = {};
        parameters.id = id;
        var actionUrl = $(this).attr('action-url');
        execARWithSuccessAndErrorCallbacks(event, this, actionUrl, parameters, deletePacketInfoEntrySuccess, deletePacketInfoEntryFailure);
    });
}

/**
 * Callback on delete packet info entry successful execution.
 *
 * @param event, the event generated
 * @param element, the element generating the event
 * @param data, server response data
 * @param textStatus, default response text status
 * @param jqXHR, the ajax request object
 */
function deletePacketInfoEntrySuccess(event, element, data, textStatus, jqXHR) {
    if (data.success === true) {
        var id = $(element).attr('data-item-id');
        if (data.removed) {
            $('#packet-info-entry-' + id).slideToggle('slow', function () {
                var counter = parseInt($('#packet-info-size-counter').html());
                if (counter > 0) {
                    counter--;
                }

                $('#packet-info-size-counter').html(counter)
                $(this).remove();
            });
        }
    } else {
        console.log('Show error message.');
        showErrorMessage(data.message);
    }
}

/**
 * Callback on delete packet info entry failure execution.
 *
 * @param event, the event generated
 * @param element, the element generating the event
 * @param data, the error data
 */
function deletePacketInfoEntryFailure(event, element, data) {
    console.log(data);
}

function packetInfoCreateSuccess(event, element, data, textStatus, jqXHR) {
    console.log('Packe info successes server call...');
    if (data.success === false) {
        console.log('Packet info creation failed actually with message: ' + data.message);
        $('#errorMessagePacketInfo > label').html(data.message);
        $('#errorMessagePacketInfo').removeClass('hidden');
    } else {
        console.log('Packet info creation successfull.');
        var counter = parseInt($('#packet-info-size-counter').html());
        if (counter === 0) {
            $('#packet-info-list-empty').slideToggle('slow', function(event) {
                $('#packet-info-list-empty').remove();

                console.log('#packetInfoList');

                $('#packetInfoList').append(data, {
                    'data-transition': 'slide'
                })

                $('#packetInfoList').listview('refresh');

                var formId = $(element).attr('form-id');
                $('#'+formId).trigger('reset');

                counter++;
                $('#packet-info-size-counter').html(counter)
            });
        } else {
            // inject new entry
            $('#packetInfoList').append(data, {
                'data-transition': 'slide'
            })

            // reset creation form
            var formId = $(element).attr('form-id');
            $('#'+formId).trigger('reset');
            $('#errorMessagePacketInfo').addClass('hidden');

            // increase counter
            counter++;
            $('#packet-info-size-counter').html(counter)

            // refresh the list view
            $('#packetInfoList').listview('refresh');

            // close the create packet info popup
            $('#createPacketInfoPopup').popup('close');
        }

        attachDeletePackeInfoEntryEventHandlers();
    }
}

function packetInfoCreateFailure(event, element, data) {
    $('#errorMessagePacketInfo > label').html(data.message);
    $('#errorMessagePacketInfo').removeClass('hidden');
}

function reportInfoCreateSuccess(event, element, data, textStatus, jqXHR) {
    if (data.success === false) {
        $('#errorMessageReportInfo > label').html(data.message);
        $('#errorMessageReportInfo').removeClass('hidden');
    } else {

        var counter = parseInt($('#report-info-size-counter').html());
        if (counter === 0) {
            $('#report-info-list-empty').slideToggle('slow', function(event) {
                $('#report-info-list-empty').remove();

                $('#reportInfoList').append(data, {
                    'data-transition': 'slide'
                })

                $('#reportInfoList').listview('refresh');

                var formId = $(element).attr('form-id');
                $('#'+formId).trigger('reset');

                counter++;
                $('#report-info-size-counter').html(counter)
            });
        }
    }
}

function reportInfoCreateFailure(event, element, data) {
    $('#errorMessageReportInfo > label').html(data.message);
    $('#errorMessageReportInfo').removeClass('hidden');
}