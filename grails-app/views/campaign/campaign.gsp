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


<div class="info-panel" style="padding: 15px;">
    <g:render template="currentCampaign" model="[currentCampaign: currentCampaign]" />
</div>

<div class="spacer20"></div>

<g:render template="createCampaignButton" />

</body>
</html>