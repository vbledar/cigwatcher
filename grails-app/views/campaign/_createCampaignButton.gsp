<div id="createCampaign" class="neon-shadow-light ui-button-orange">
    <div class="ui-grid-a default-informational">
        <div class="ui-block-a">
            <h2>
                <g:message code="create.campaing.button.label" default="Create Campaign"/>
            </h2>

            <div class="full-line"></div>

            <div class="spacer20"></div>

            <p>
                <g:message code="create.campaign.by.click" />
            </p>
        </div>
        <div class="ui-block-b">
            <ul class="info-panel">
                <li>
                    <p>
                        Keep track of money spent.
                    </p>
                </li>

                <li>
                    <p>
                        Keep track of packets used.
                    </p>
                </li>
                <li>
                    <p>
                        Keep track of cigars smoked.
                    </p>
                </li>
                <li>
                    <p>
                        Set goals to eventually reduce the cigars you smoke on an every day bases and eventually quit smoking.
                    </p>
                </li>
                <li>
                    <p>
                        Challenge your self in a quest as difficult as lowering cigars smoked in a day.
                    </p>
                </li>
            </ul>
        </div>
    </div>
</div>
<g:form name="createCampaignForm" controller="campaign" action="createCampaign" />