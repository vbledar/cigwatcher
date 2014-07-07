<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/25/14
  Time: 14:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="logoutLayout"/>
    <title>Reports</title>
</head>

<body>

<content tag="pageElementCreation">
    <div data-role="page" id="reporting" data-theme="b">
</content>

<content tag="headerTitle">
    <h1>
        <g:message code="campaing.page.title" default="Reports"/>
    </h1>
</content>

<g:render template="templates/campaignIntervalReporting" />

<div class="spacer20"></div>

<g:render template="templates/campaignIntervalReportingPrediction" />

</body>
</html>