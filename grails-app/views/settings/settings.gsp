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


<content tag="headerTitle">
    <h1>
        <g:message code="settings.page.title" default="Settings" />
    </h1>
</content>


<g:render template="packetInfoInformation" model="[packetInformationEntries: packetInformationEntries]" />

<g:render template="/popups.user.settings/packetInfo" />

</body>
</html>