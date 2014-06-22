<div class="default-informational">
    <h2>
        <g:message code="create.campaing.button.label" default="Current Campaign"/>
    </h2>
    <h5>
        <g:if test="${!currentCampaign?.startedOn}">
            <g:message code="current.campaign.created.on" args="[currentCampaign?.dateCreated]" />
        </g:if>
        <g:else>
            <g:message code="current.campaign.started.on" args="[currentCampaign?.dateCreated]" />
        </g:else>
    </h5>
</div>

<div class="full-line"></div>

<div class="spacer20"></div>

<div class="ui-grid-a">
    <div class="ui-block-a">

        <g:render template="currentCampaingDetails" model="[currentCampaign: currentCampaign]"/>

    </div>
    <div class="ui-block-b">
        <g:if test="${!currentCampaign?.startedOn}">
            <td style="width: 100%; height: 100%;">
                <div id="startCampaing" class="ui-button-orange" style="margin: 10px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle; text-align: center">
                                <h4 class="header-title">
                                    <g:message code="start.campaign.button.label" default="Start Campaing" />
                                </h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <g:javascript>

                $(function() {

                    $('#startCampaing').off('click').on('click', function(event) {
                        var url = '<g:createLink absolute="true" controller="campaign" action="startCampaign"/>'
                        $.mobile.changePage(url);
                    });
                });

            </g:javascript>
        </g:if>
        <g:else>
            <td style="width: 100%; height: 100%;">
                <div id="startInterval" class="ui-button-orange" style="margin: 10px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle; text-align: center">
                                <h4 class="header-title">
                                    <g:message code="begin.new.interval.button.label" default="Start Interval" />
                                </h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <g:javascript>

                $(function() {

                    $('#startInterval').off('click').on('click', function(event) {
                        var url = '<g:createLink absolute="true" controller="campaign" action="startCampaign"/>'
                        $.mobile.changePage(url);
                    });
                });

            </g:javascript>
        </g:else>
    </div>
</div>