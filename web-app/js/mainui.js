/**
 * Created by vbledar on 7/4/14.
 */

var countDownClock;

function applyCountdown() {
    var durationInSeconds = $('#duration-in-seconds').val();
    console.log('Duration in seconds: ' + durationInSeconds)
    console.log($('.next-cigar-counter'));
    countDownClock = $('.next-cigar-counter').FlipClock(parseInt(durationInSeconds), {
        clockFace: 'HourlyCounter',
        countdown: true,
        showDays: false,
        showSeconds: true
    });
}

/**
 * Attach event handlers on main page.
 */
function attachEventHandlersOnMainPage() {
    console.log('Attach event handler on main ui page show...');

    $('#showLoginScreen').off('click').on('click', function(event) {
        console.log('Open the popup requested.');
        event.preventDefault();
        $('#popupLogin').popup ("open", {'positionTo': 'window', 'transition': 'pop'})
    });

    $('#skippedThisCigar').off('click').on('click', function(event) {
        event.preventDefault();

        setCigarSmoked(false, this, event);

        console.log('Skipped this cigar...');
    })

    $('#smokedThisCigar').off('click').on('click', function(event) {
        event.preventDefault();

        setCigarSmoked(true, this, event);

        console.log('Smoked this cigar...');
    })
}


function setCigarSmoked (smoked, element, event) {

    var formId = $(element).attr('form-id');
    var actionUrl = $('#'+formId).attr('action');

    var parameters = {};
    parameters.smoked = smoked;

    $.post(actionUrl, parameters, function(data, textStatus, jqXHR) {

        if (data.success === 'false') {
            console.log(data.message);
            return;
        }

        console.log(data.message);
        console.log(data.durationInSeconds);

        $('#duration-in-seconds').val(data.durationInSeconds);

        countDownClock.setTime(data.durationInSeconds);

    }).fail(function(errorMessage) {
        console.log(errorMessage);
    });

}