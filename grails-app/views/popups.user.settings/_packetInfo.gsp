
<div data-role="popup" id="createPacketInfoPopup" class="ui-corner-all">
    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    <g:form name="createPacketInfo" controller="settings" action="ajaxCreatePacketInfo">
        <div style="padding:10px 20px;">
            <h3>Packet Information</h3>
            <label for="packetName" class="ui-hidden-accessible">
                <g:message code="name.field.name" default="Name:" />
            </label>
            <input type="text" name="packetName" id="packetName" value="" placeholder="Packet Name">

            <label for="price" class="ui-hidden-accessible">
                <g:message code="price.field.name" default="Price:" />
            </label>
            <input type="number" name="price" id="price" step="0.01" value="" placeholder="Packet Price">

            <label for="cigCount" class="ui-hidden-accessible">
                <g:message code="cig.count.field.name" default="Cigar Count:" />
            </label>
            <input type="number" name="cigCount" id="cigCount" value="" placeholder="Cigar Count">

            <div class="full-line"></div>

            <div id="errorMessagePacketInfo" class="hidden">
                <label></label>
            </div>

            <button id="createPacketInfoButton" form-id="createPacketInfo" type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check">
                <g:message code="create.button.label" default="Create" />
            </button>
        </div>
    </g:form>
</div>

<script type="application/javascript">

    $(document).on('pageinit', function() {
        $('#createPacketInfoButton').off('click').on('click', function(event) {
            execARFromElementWithSuccessAndErrorCallbacks(event, this, packetInfoCreateSuccess, packetInfoCreateFailure);
        })
    });

    function packetInfoCreateSuccess(event, element, data, textStatus, jqXHR) {
        if (data.success === false) {
            $('#errorMessagePacketInfo > label').html(data.message);
            $('#errorMessagePacketInfo').removeClass('hidden');
        } else {

            var counter = parseInt($('#packet-info-size-counter').html());
            if (counter === 0) {
                $('#packet-info-list-empty').slideToggle('slow', function(event) {
                    $('#packet-info-list-empty').remove();

                    $('#packetInfoList').append(data, {
                        'data-transition': 'slide'
                    })

                    $('#packetInfoList').listview('refresh');

                    var formId = $(element).attr('form-id');
                    $('#'+formId).trigger('reset');

                    counter++;
                    $('#packet-info-size-counter').html(counter)
                });
            }
        }
    }

    function packetInfoCreateFailure(event, element, data) {
        $('#errorMessagePacketInfo > label').html(data.message);
        $('#errorMessagePacketInfo').removeClass('hidden');
    }
</script>