///**
// * Created by vbledar on 6/20/14.
// */


/**
 * Attach event handlers on main page.
 */
function attachEventHandlersOnMainPage() {
    console.log('Attach event handler on main ui page show...');

    $('#showLoginScreen').off('click').on('click', function(event) {
        console.log('Open the popup requested.');
        event.preventDefault();
        $('#popupLogin').popup ("open", {'positionTo': 'window', 'transition': 'pop'})
    })
}

/**
 * Attach event handlers on settings page.
 */
function attachEventHandlersOnSettingsPage() {
    $('settings').on("pagecontainertransition", function(event, ui) {
        console.log('Settings page shown...');
    })
}

/**
 * Attach event handlers on campaign page.
 */
function attachEventHandlersOnCampaignPage() {
    console.log('Attach event handler on campaign page show...');

    $('#createCampaign').off('click').on('click', function(event) {
        var url = $("#createCampaignForm").attr('action');
        $.mobile.changePage(url);
    });

    $('#startCampaing').off('click').on('click', function(event) {
        var url = $('#startCampaignForm').attr('action');
        $.mobile.changePage(url);
    });

    $('#addCigarSmoked').off('click').on('click', function (event) {
        var url = $('#addSmokedCigarInInterval').attr('action');
        window.location.href = url;
    });

    $('#addPacketBought').off('click').on('click', function (event) {
        var packetInfoValue = $('#packetInfoSelectElement').val();
        var url = $('#addPacketBoughtInInterval').attr('action') + '?packetInfoId=' + packetInfoValue;
        window.location.href = url;
    });

    $('#packetInfoSelectElement').off('click').on('click', function (event) {
        event.stopPropagation();
    })

    $('#startInterval').off('click').on('click', function (event) {
        var url = $('#startNewIntervalInCampaign').attr('action');
        window.location.href = url;
    });
}