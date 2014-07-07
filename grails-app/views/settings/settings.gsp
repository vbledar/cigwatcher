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
        <g:message code="settings.page.title" default="Settings" />
    </title>
</head>

<body>

<content tag="pageElementCreation">
    <div data-role="page" id="settings" data-theme="b">
</content>

<content tag="headerTitle">
    <h1>
        <g:message code="settings.page.title" default="Settings" />
    </h1>
</content>

<div data-role="tabs" id="tabs">
    <div data-role="navbar" data-grid="a">
        <ul>
            <li>
                <a href="#campaigntab" class="ui-btn-active" data-icon="star">
                    <g:message code="settings.menu.campaign" default="Campaign Settings" />
                </a>
            </li>
            <li>
                <a href="#reportstab" data-icon="grid">
                    <g:message code="settings.menu.reports" default="Report Settings" />
                </a>
            </li>
        </ul>
    </div>

    <div class="spacer20"/>

    <div id="campaigntab">
        <g:render template="packetInfoInformation" model="[packetInformationEntries: packetInformationEntries]" />

        <g:render template="/popups/user/settings/packetInfo" />
    </div>

    <div id="reportstab">
        <g:render template="reportInfoInformation" model="[reportInformationEntries: reportInformationEntries]" />

        <g:render template="/popups/user/settings/createReportInfoDialog" />
    </div>
</div>

</body>
</html>