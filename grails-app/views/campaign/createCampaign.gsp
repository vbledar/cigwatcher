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
        <g:message code="campaing.create.page.title" default="Create Campaing"/>
    </h1>
</content>

<content tag="leftHeader">
    <g:link controller="campaign" action="campaign" class="ui-btn ui-corner-all neon-shadow-light">
        <g:message code="back.button.label" />
    </g:link>
</content>

<g:form controller="campaign" action="persistCampaign">

    <ul data-role="listview" data-inset="true">
        <li class="ui-field-contain" >
            <label for="daysCounter">
                <g:message code="days.counter.field.name" default="Target Days:"/>
            </label>
            <input type="range" min="7" max="365" step="1" name="daysCounter" id="daysCounter" value="${campaign?.daysCounter}" data-clear-btn="true" class="${hasErrors( bean: campaign, field: 'daysCounter', 'field-error')}" >
        </li>

        <g:hasErrors bean="${campaign}" field="daysCounter">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${campaign}" field="daysCounter" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <li class="ui-field-contain" >
            <label for="currentCigarCounter">
                <g:message code="current.cigar.counter.field.name" default="Current Cigar Counter:"/>
            </label>
            <input type="range" min="0" max="50" step="1" name="currentCigarCounter" id="currentCigarCounter" value="${campaign?.currentCigarCounter}" data-clear-btn="true" class="${hasErrors( bean: campaign, field: 'currentCigarCounter', 'field-error')}" >
        </li>

        <g:hasErrors bean="${campaign}" field="currentCigarCounter">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${campaign}" field="currentCigarCounter" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <li class="ui-field-contain" >
            <label for="targetCigarCounter">
                <g:message code="target.cigar.counter.field.name" default="Target Cigar Counter:"/>
            </label>
            <input type="range" min="0" max="50" step="1" name="targetCigarCounter" id="targetCigarCounter" value="${campaign?.targetCigarCounter}" data-clear-btn="true" class="${hasErrors( bean: campaign, field: 'targetCigarCounter', 'field-error')}" >
        </li>

        <g:hasErrors bean="${campaign}" field="targetCigarCounter">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${campaign}" field="targetCigarCounter" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <li class="ui-body ui-body-b">
            <fieldset class="ui-grid-a">
                <div class="ui-block-a" style="padding: 5px;">
                    <g:link controller="campaign" action="campaign" class="ui-btn ui-corner-all neon-shadow-light">
                        <g:message code="back.button.label" />
                    </g:link>
                </div>

                <div class="ui-block-b" style="padding: 5px;">
                    <input type="submit" value="<g:message code='create.campaign.button.label' default='Create Campaign' />" data-icon="user" data-ajax="false">
                </div>
            </fieldset>
        </li>
    </ul>
</g:form>

</body>
</html>