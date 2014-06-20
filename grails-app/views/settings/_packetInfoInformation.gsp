<div class="info-panel" style="padding-top: 10px; ">

    <ul id="packetInfoList" data-role="listview" data-inset="true">
        <li data-role="list-divider" style="min-height: 40px; color: darkorange">
            <g:message code="packet.info.panel.title" default="Packet Information Entries" />
            <span>
                <a style="margin-left: 30px;" href="#createPacketInfoPopup" data-position-to="window" data-rel="popup" class="ui-btn ui-btn-inline ui-mini neon-shadow-light" data-icon="power">
                    <g:message code="create.button.label" default="Create" />
                </a>
            </span>
            <span id="packet-info-size-counter" class="ui-li-count" style="color: darkorange">
                ${packetInformationEntries?.size()}
            </span>
        </li>
        <li style="max-height: 350px; overflow-y: scroll">
        <g:if test="${packetInformationEntries?.size() > 0}">
            <g:each in="${packetInformationEntries}" status="i" var="packetInformation">
                <g:render template="packetInfoEntry" model="[packetInformation: packetInformation]" />
            </g:each>
        </g:if>
        <g:else>
            <li id="packet-info-list-empty" style="color: darkorange">
                <g:message code="list.empty" default="Your list is empty." />
            </li>
        </g:else>
        </li>
    </ul>
</div>