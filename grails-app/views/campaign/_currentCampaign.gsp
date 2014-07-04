<div class="default-informational">
    <h2>
        <g:message code="create.campaing.button.label" default="Current Campaign"/>
    </h2>
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
            <g:form name="startCampaignForm" controller="campaign" action="startCampaign"/>
        </g:if>
        <g:else>

            <td style="width: 100%; height: 100%;">
                <div id="addCigarSmoked" class="ui-button-orange" style="margin: 10px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle; text-align: center">
                                <h4 class="header-title">
                                    <g:message code="add.cigar.smoked.interval.button.label" default="Cigar Smoked" />
                                    <g:form name="addSmokedCigarInInterval" controller="campaign" action="addCigarToCampaignInterval" params="[smoked: Boolean.TRUE]"/>
                                </h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <div class="spacer20"></div>

            <td style="width: 100%; height: 100%;">
                <div id="addPacketBought" class="ui-button-orange" style="margin: 10px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle; text-align: center">
                                <h4 class="header-title">
                                    <g:message code="add.packet.bought.interval.button.label" default="Add New Packet" />
                                    <g:form name="addPacketBoughtInInterval" controller="campaign" action="addPacketToCampaignInterval">
                                    </g:form>
                                </h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <g:select id="packetInfoSelectElement"
                                          name="packetInfo"
                                          from="${packetInfos}"
                                          value="packetName"
                                          keys="${packetInfos*.id}"
                                          optionKey="${id}"
                                          optionValue="packetName"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <div class="spacer20"></div>

            <td style="width: 100%; height: 100%;">
                <div id="startInterval" class="ui-button-orange" style="margin: 10px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle; text-align: center">
                                <h4 class="header-title">
                                    <g:message code="begin.new.interval.button.label" default="Start New Interval" />
                                    <g:form name="startNewIntervalInCampaign" controller="campaign" action="startInterval"></g:form>
                                </h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <div class="spacer20"></div>

            <g:render template="campaingIntervalsList" model="[campaign: currentCampaign]"/>

        </g:else>
    </div>
</div>

<g:javascript>
//    jQuery(function(){
//        jQuery('#flipcountdownbox1').flipcountdown();
//    })
</g:javascript>