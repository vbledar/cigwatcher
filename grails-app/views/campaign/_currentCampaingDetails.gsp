<div class="info-panel" style="padding: 10px;">
    <h4 class="header-title">
        <g:if test="${!currentCampaign?.startedOn}">
            <g:message code="current.campaign.not.started.yet" />
        </g:if>
        <g:else>
            <g:message code="current.campaign.started.on" args="[currentCampaign?.startedOn]" />
        </g:else>
    </h4>

    <ul data-role="listview" data-inset="true">
        <li class="ui-field-contain" >
            <label>
                <g:message code="cigars.per.day" args="['Current']" />
            </label>
            <input type="number" value="${currentCampaign?.currentCigarCounter}" min="0" max="50" data-highlight="true" readonly>
        </li>

        <li class="ui-field-contain" >
            <label>
                <g:message code="cigars.per.day" args="['Current']" />
            </label>
            <input type="number" value="${currentCampaign?.targetCigarCounter}" min="0" max="50" data-highlight="true" readonly>
        </li>
    </ul>

    <div class="spacer10"></div>

    <div class="ui-grid-a">
        <div class="ui-block-a">
            <ul data-role="listview" data-inset="true">
                <li>
                    <label>
                        <g:message code="last.cigar.smoked.on" default="Last cigar smoked on..."/>
                    </label>
                    <input type="datetime" value="${currentCampaign?.lastCigarSmokedOn}" readonly>
                </li>

                <li>
                    <label>
                        <g:message code="last.packet.bought.on" default="Last packet bought on..." />
                    </label>
                    <input type="datetime" value="${currentCampaign?.lastPacketBoughtOn}" readonly>
                </li>
            </ul>
        </div>
        <div class="ui-block-b">
            <ul data-role="listview" data-inset="true">
                <li>
                    <label>
                        <g:message code="cigars.smoked.on.campaign" default="Total cigars smoked..." />
                    </label>
                    <input type="number" value="${currentCampaign?.cigarCounter}" readonly>
                </li>

                <li>
                    <label>
                        <g:message code="packets.bought.on.campaign" default="Total packets bought..."/>
                    </label>
                    <input type="number" value="${currentCampaign?.packetCounter}" min="0" max="1000" readonly>
                </li>
            </ul>
        </div>
    </div>
</div>