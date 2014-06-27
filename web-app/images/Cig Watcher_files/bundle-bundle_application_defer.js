/**
 * Attach event on page container show.
 */
$( document ).on( "pagecontainershow", function ( event, ui ) {
    console.log('Page container show is called.');

    // retrieve active page and active page id
    var activePage = $.mobile.pageContainer.pagecontainer( "getActivePage" );
    var activePageId = $(activePage).attr('id');
    console.log('Active page is: ' + activePageId);

    // based on active page id determine which element event
    // handlers you require to attach
    if (activePageId == 'mainui') {
        attachEventHandlersOnMainPage();
    } if (activePageId === 'campaign') {
        attachEventHandlersOnCampaignPage();
    } else if (activePage === 'settings') {
        attachEventHandlersOnSettingsPage();
    }
});


if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

/**
 * Executes an ajax request.
 *
 * If the request is successful, then the successCallback is called. The successCallback is responsible for processing
 * the response data retrieved from server.
 *
 * If the request cannot be made, then the errorCallback is called.
 *
 * The ajax request will be performed based on the form action attribute. The actual form is denoted by the element
 * related-form attribute.
 *
 * @param event, the event generated
 * @param element, the element that generated the event
 * @param successCallback, called if the call made was successful
 * @param errorCallback, called if the request failed
 */
function execARFromElementWithSuccessAndErrorCallbacks(event, element, successCallback, errorCallback) {
    // we call this in any case if though the called should have done this
    console.log("Preventing default behaviour of element.");
    event.preventDefault();

    try {
        // retrieve related form id
        var formId = $(element).attr('form-id');

        // retrieve action to call and serialize input parameters found in form
        var actionUrl = $('#' + formId).attr('action');
        var parameters = $('#' + formId).serializeArray();

        // execute post request
        execARWithSuccessAndErrorCallbacks(event, element, actionUrl, parameters, successCallback, errorCallback);
    } catch (e) {
        console.log (e.message);

        // make the error callback
        errorCallback(event, element, e.message);
    }
}

/**
 * Executes an ajax request.
 *
 * If the request is successful, then the successCallback is called. The successCallback is responsible for processing
 * the response data retrieved from server.
 *
 * If the request cannot be made, then the errorCallback is called.
 *
 * The ajax request will be performed based on the actionUrl parameter. The parameters parameter will be send to the
 * request.
 *
 * @param event, the event generated
 * @param element, the element that generated the event
 * @param actionUrl, the url path for the action
 * @param parameters, the parameters to attach to the request
 * @param successCallback, called if the call made was successful
 * @param errorCallback, called if the request failed
 */
function execARWithSuccessAndErrorCallbacks(event, element, actionUrl, parameters, successCallback, errorCallback) {

    // execute post request
    console.log("Executing post request to server.");
    $.post(actionUrl, parameters, function (data, textStatus, jqXHR) {
        console.log('Post request succeeded...');

        // data retrieved from server
        console.log(data);

        // make the success callback
        successCallback(event, element, data, textStatus, jqXHR);

    }).fail(function (data) {
        console.debug('Post request failed...');

        // make the error callback
        errorCallback(event, element, data);
    });
}
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

