<li id="packet-info-entry-${packetInformation?.id}">
    <g:link controller="settings" action="packetInformation" id="${packetInformation?.id}">
        <h2>
            ${packetInformation?.packetName}
        </h2>

        <p><strong>Yoy have smocked 150 packets and paid 250 euros.</strong></p>

        <p class="">
            <g:formatDate date="${packetInformation?.dateCreated}" format="DD/MM/yyyy" />
        </p>

        <span class="ui-li-aside">
            <button id="deleteEntry" data-item-id="${packetInformation?.id}" class="ui-btn ui-btn-inline ui-mini neon-shadow-light delete-packet-info-entry">
                    <g:message code="delete.button.label" default="Delete" />
            </button>
        </span>
    </g:link>
</li>

<script type="application/javascript">

    $(function() {
        $('.delete-packet-info-entry').off('click').on('click', function(event) {
            event.preventDefault();
            var id = $(this).attr('data-item-id');
            var parameters = {}; parameters.id = id;
            var actionUrl = '<g:createLink controller="settings" action="ajaxDeletePacketInfo"/>';
            execARWithSuccessAndErrorCallbacks(event, this, actionUrl, parameters, deletePacketInfoEntrySuccess, deletePacketInfoEntryFailure);
        })
    })

    function deletePacketInfoEntrySuccess(event, element, data, textStatus, jqXHR) {
        if (data.success === true) {
            var id = $(element).attr('data-item-id');
            $('#packet-info-entry-'+id).slideToggle('slow', function() {
                var counter = parseInt($('#packet-info-size-counter').html());
                if (counter > 0) {
                    counter--;
                }
                $('#packet-info-size-counter').html(counter)
                $(this).remove();
            })


        }
    }

    function deletePacketInfoEntryFailure(event, element, data) {
        console.log(data);
    }
</script>