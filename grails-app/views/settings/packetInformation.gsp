<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/19/14
  Time: 16:07
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <title>
        <g:message code="packet.information.page.title" default="Packet Information" args="[packetInformation?.packetName]"/>
    </title>
</head>

<body>

<content tag="leftHeader">
    <g:link controller="settings" action="settings" class="neon-shadow-light">
        <g:message code="back.button.label" default="Back"/>
    </g:link>
</content>

<content tag="headerTitle">
    <h1>
        <g:message code="packet.information.page.title" default="Packet Information" args="[packetInformation?.packetName]"/>
    </h1>
</content>

<content tag="rightHeader">
    <g:link controller="settings" action="deletePacketInfo" id="${packetInformation?.id}" class="neon-shadow-light">
        <g:message code="delete.button.label" default="Delete"/>
    </g:link>
</content>

<g:form controller="settings" action="updatePacketInformation" id="${packetInformation?.id}">

    <ul data-role="listview" data-inset="true">
        <li class="ui-field-contain" >
            <label for="packetName">
                <g:message code="name.field.name" default="Name:"/>
            </label>
            <input type="text" name="packetName" id="packetName" value="${packetInformation?.packetName}" data-clear-btn="true" class="${hasErrors( bean: packetInformation, field: 'packetName', 'field-error')}" >
        </li>

        <g:hasErrors bean="${user}" field="firstname">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${packetInformation}" field="packetName" as="list" />
                </div>
            </div>
        </g:hasErrors>

        %{--<li class="ui-field-contain">--}%
            %{--<label for="textarea2">Textarea:</label>--}%
            %{--<textarea cols="40" rows="8" packetName="textarea2" id="textarea2">--}%

            %{--</textarea>--}%
        %{--</li>--}%

        %{--<li class="ui-field-contain">--}%
            %{--<label for="flip2">Flip switch:</label>--}%
            %{--<select packetName="flip2" id="flip2" data-role="slider">--}%
                %{--<option value="off">Off</option>--}%
                %{--<option value="on">On</option>--}%
            %{--</select>--}%
        %{--</li>--}%

        <li class="ui-field-contain">
            <label for="price">
                <g:message code="price.field.name" default="Price:" />
            </label>
            <input type="range" name="price" id="price" value="${packetInformation?.price}" min="0" max="20" step="0.05" data-highlight="true" class="${hasErrors( bean: packetInformation, field: 'price', 'field-error')}">
        </li>

        <li class="ui-field-contain">
            <label for="cigCount">
                <g:message code="cig.count.field.name" default="Cigar Count:" />
            </label>
            <input type="range" name="cigCount" id="cigCount" value="${packetInformation?.cigCount}" min="0" max="50" data-highlight="true" class="${hasErrors( bean: packetInformation, field: 'cigCount', 'field-error')}">
        </li>

        <li class="ui-field-contain">
            <label for="packetsBought">
                <g:message code="packets.bought.field.name" default="Packets Bought:" />
            </label>
            <input type="number" editable="false" name="packetsBought" id="packetsBought" value="${packetInformation?.packetsBought}" data-highlight="true" readonly>
        </li>

        <li class="ui-field-contain">
            <label for="lastPacketBought">
                <g:message code="last.packet.bought.field.name" default="Last Packet Bought On:" />
            </label>
            <input type="date" name="lastPacketBought" id="lastPacketBought" value="${packetInformation?.lastPacketBought ? packetInformation?.lastPacketBought : ''}" data-highlight="true" readonly>
        </li>

        <li class="ui-body ui-body-b">
            <fieldset class="ui-grid-a">
                <div class="ui-block-a" style="padding: 5px;">
                    <g:link controller="settings" action="deletePacketInfo" class="ui-btn neon-shadow-light">
                        <g:message code="delete.button.label" default="Delete" />
                    </g:link>
                </div>

                <div class="ui-block-b" style="padding: 5px;">
                    <input type="submit" value="<g:message code='update.button.label' default='Update' />" data-icon="user">
                </div>
            </fieldset>
        </li>
    </ul>
</g:form>
</body>
</html>