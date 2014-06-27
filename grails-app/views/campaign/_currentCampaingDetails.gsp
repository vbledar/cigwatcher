<div class="info-panel" style="padding: 10px;">
    <div class="info-panel-header">
        <table style="width: 100% !important; height: 50px">
            <tr>
                <td style="vertical-align: middle;">
                    <g:if test="${!currentCampaign?.startedOn}">
                        <g:message code="current.campaign.not.started.yet" />
                    </g:if>
                    <g:else>
                        <g:message code="current.campaign.started.on" args="[currentCampaign?.startedOn]" />
                    </g:else>
                </td>
            </tr>
        </table>
    </div>

    <ul data-role="listview" data-inset="true">
        <li class="ui-field-contain" >
            <label>
                <g:message code="total.period.of.days.to.achieve.goal" default="Total days to achieve goal" />
            </label>
        </li>
        <li>
            <input type="number" value="${currentCampaign?.daysCounter}" min="0" max="999" data-highlight="true" readonly>
        </li>

        <li class="ui-field-contain" >
            <label>
                <g:message code="cigars.per.day" args="['Current']" />
            </label>
        </li>
        <li>
            <input type="number" value="${currentCampaign?.currentCigarCounter}" min="0" max="50" data-highlight="true" readonly>
        </li>

        <li class="ui-field-contain" >
            <label>
                <g:message code="cigars.per.day" args="['Target']" />
            </label>
        </li>
        <li>
            <input type="number" value="${currentCampaign?.targetCigarCounter}" min="0" max="50" data-highlight="true" readonly>
        </li>
        <li class="ui-field-contain" >
            <label>
                <g:message code="next.cigar.on" default="Next Cigar On" />
            </label>
        </li>
        <li>
            <g:formatDate date="${currentCampaign?.campaignInterval?.calculateNextCigarDate()}" format="dd/MM/yyyy HH:mm" />
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
                    <input type="datetime" value="${formatDate(date: currentCampaign?.lastCigarSmokedOn, format: 'dd-MM-yyyy HH:mm')}" readonly>
                </li>

                <li>
                    <label>
                        <g:message code="last.packet.bought.on" default="Last packet bought on..." />
                    </label>
                    <input type="datetime" value="${formatDate(date: currentCampaign?.lastPacketBoughtOn, format: 'dd-MM-yyyy HH:mm')}" readonly>
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