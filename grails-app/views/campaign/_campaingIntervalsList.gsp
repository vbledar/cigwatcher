<div class="info-panel">
    <div class="info-panel-header">
        <table style="width: 100% !important; height: 50px">
            <tr>
                <td style="vertical-align: middle;">
                    <g:message code="packet.info.panel.title" default="Packet Campaign Interval Entries" /> (${campaign?.intervals?.size()})
                </td>
            </tr>
        </table>
    </div>
    <ul id="campaingIntervalsList" data-role="listview" data-inset="true" style="max-height: 250px; overflow-y: scroll">
        %{--<li style="">--}%
            <g:if test="${campaign?.intervals?.size() > 0}">
                <g:each in="${campaign?.intervals}" status="i" var="campaignInterval">
                    <g:render template="campaignIntervalEntry" model="[campaignInterval: campaignInterval]" />
                </g:each>
            </g:if>
            <g:else>
                <li id="packet-info-list-empty" style="color: darkorange">
                    <g:message code="list.empty" default="Your list is empty." />
                </li>
            </g:else>
        %{--</li>--}%
    </ul>
</div>