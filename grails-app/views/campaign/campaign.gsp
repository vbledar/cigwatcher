<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/19/14
  Time: 13:27
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="logoutLayout">

    <title>
        <g:message code="campaign.page.title" default="Campaign"/>
    </title>
</head>

<body>

<content tag="pageElementCreation">
    <div data-role="page" id="campaign" data-theme="b">
</content>

<content tag="headerTitle">
    <h1>
        <g:message code="campaing.page.title" default="Campaing"/>
    </h1>
</content>

<g:if test="${!campaign}">


    <div class="neon-shadow-light">
        <div class="ui-grid-a">
            <div class="ui-block-a">
                <h1>
                    <g:message code="create.campaing.button.label" default="Create Campaign"/>
                </h1>
                <div class="full-line"></div>
                <g:message code="create.campaign.by.click" />
            </div>
            <div class="ui-block-b">
                <ol>
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
                </ol>
            </div>
        </div>
    </div>
    <button class="ui-btn neon-shadow-light">
        <span>
            <h1>
                <g:message code="create.campaing.button.label" default="Create Campaign"/>
            </h1>
        </span>
        <span>
            <div class="full-line"></div>
        </span>
        <span style="max-width: 50%;">
            <g:message code="create.campaign.by.click" />
        </span>
    </button>
    <button>
    %{--<div class="ui-grid-a" style="display: run-in">--}%
        %{--<div class="ui-block-a">--}%
        <table>
            <tr>
                <td style="width: 50%;">
            <div class="inside-anchor-with-details">
                <h1 style="color: darkorange">
                    <g:message code="create.campaing.button.label" default="Create Campaign"/>
                </h1>
                <label>
                    <g:message code="create.campaign.by.click"
                               default="Click here to create a new campaign. If you are currently under another campaign, then that campaign will be stored in your history views."/>
                </label>
            </div>
                    </td>
                <td colspan="1">
        %{--</div>--}%
        %{--<div class="ui-block-b" style="max-width: 50%">--}%
                    <td>
            <h5>
                <g:message code="campaing.creation.benefits.title"
                           default="By creating a campaign you will be benefited from the following"/>
            </h5>

            <div class="full-line"></div>

            <div style="text-align: left">
                <ol>
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
                </ol>
            </div>
                </td>
                </tr>
        </table>
        %{--</div>--}%
    %{--</div>--}%
    </button>

    <g:link controller="campaign" action="createCampaign" class="ui-btn neon-shadow-light">
        <div class="ui-grid-a" style="display: run-in">
            <div class="ui-block-a">
                <div class="inside-anchor-with-details">
                    <h1 style="color: darkorange">
                        <g:message code="create.campaing.button.label" default="Create Campaign"/>
                    </h1>
                    <label>
                        <g:message code="create.campaign.by.click"
                                   default="Click here to create a new campaign. If you are currently under another campaign, then that campaign will be stored in your history views."/>
                    </label>
                </div>
            </div>
            <div class="ui-block-b">
                <h5>
                    <g:message code="campaing.creation.benefits.title"
                               default="By creating a campaign you will be benefited from the following"/>
                </h5>

                <div class="full-line"></div>

                <div style="text-align: left">
                    <ol>
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
                    </ol>
                </div>
            </div>
        </div>
    </g:link>

</g:if>

</body>
</html>