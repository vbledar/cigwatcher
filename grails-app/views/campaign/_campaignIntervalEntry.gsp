<li id="packet-info-entry-${campaignInterval?.id}" class="${campaignInterval?.successful ? 'listview-success-entry' : 'listview-fail-entry'}">
    <g:link controller="settings" action="settings" params="[service: 'packetInformation', instanceId: packetInformation?.id, execreturn: Boolean.TRUE]">
        <h2>
            ${campaignInterval?.startDate}
        </h2>

        <p class="ui-li-aside">
            <strong>
                <g:message code="cigars.allowed.in.interval" args="[campaignInterval?.cigarCounter]" />
            </strong>

            <br />

            <strong>
                <g:message code="cigars.smoked.in.interval" args="[campaignInterval?.smokeCigars?.size()]" />
            </strong>
        </p>

        <ul>
            <li>
                <p>
                    <g:message code="successful.campaign.interval" args="[campaignInterval?.successful]"/>
                </p>
            </li>
            <li>
                <p>
                    <g:message code="completed.campaign.interval" args="[campaignInterval?.completed]" />
                </p>
            </li>
        </ul>
    </g:link>
</li>

<script type="application/javascript">

</script>