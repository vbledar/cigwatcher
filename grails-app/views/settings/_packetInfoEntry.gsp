<li id="packet-info-entry-${packetInformation?.id}">
    <g:link controller="settings" action="settings" params="[service: 'packetInformation', instanceId: packetInformation?.id, execreturn: Boolean.TRUE]">
        <h2>
            ${packetInformation?.packetName}
        </h2>

        <p>

        </p>

        <ul>
            <li>
                <p>
                    <g:message code="packet.info.description.packets.and.cigars" args="[packetInformation?.packetsBought, packetInformation?.totalPaid()]"/>
                </p>
            </li>
            <li>
                <p>
                    <g:message code="packet.info.description.last.packet.date" args="[packetInformation?.lastPacketBought ? packetInformation?.lastPacketBought : 'unknown']" />
                </p>
            </li>
            <li>
                <p>
                    <g:message code="packet.info.description.created.on" args="[packetInformation?.dateCreated]" />
                </p>
            </li>
        </ul>

        <span class="ui-li-aside">
            <g:if test="${packetInformation?.packets?.isEmpty()}">
                <button id="deleteEntry" data-item-id="${packetInformation?.id}" action-url='<g:createLink controller="settings" action="ajaxDeletePacketInfo" />' class="ui-btn ui-btn-inline ui-mini neon-shadow-light delete-packet-info-entry">
                    <g:message code="delete.button.label" default="Delete" />
                </button>
            </g:if>
            <g:else>
                %{--<g:if test="${packetInformation?.visible}">--}%
                    %{--<button id="makeEntryVisible" data-item-id="${packetInformation?.id}" action-url='<g:createLink controller="settings" action="ajaxDeletePacketInfo" />' class="ui-btn ui-btn-inline ui-mini neon-shadow-light delete-packet-info-entry">--}%
                        %{--<g:message code="delete.button.label" default="Delete" />--}%
                    %{--</button>--}%
                    <label for="visible">
                        <g:message code="visible.field.name" default="Visible"/>
                    </label>
                    <select class="visibility-slider" name="visible" action-url='<g:createLink controller="settings" action="ajaxVisibilityStatusPacketInfo" />' data-id="${packetInformation?.id}" data-role="slider" data-mini="true">
                        <option value="off" ${packetInformation?.visible ? '' : 'selected=""'}>
                            <g:message code="field.value.no" />
                        </option>
                        <option value="on" ${packetInformation?.visible ? 'selected=""' : ''}>
                            <g:message code="field.value.yes" />
                        </option>
                    </select>
                %{--</g:if>--}%
            </g:else>
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