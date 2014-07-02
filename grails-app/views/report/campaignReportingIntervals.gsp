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

<div class="info-panel report-container" report-type="line" ajax-action-url='<g:createLink absolute="true" controller="report" action="ajaxCampaignIntervalReport" />' style="text-align: center;">
    <div class="info-panel-header">
        <h3>
            Campaign Interval Reporting
        </h3>
    </div>
    <canvas data-type="Line" width="600" height="400" style="width: 600px; height: 400px;"></canvas>
</div>

<div class="spacer20"></div>

<div class="info-panel report-container" report-type="line" ajax-action-url='<g:createLink absolute="true" controller="report" action="ajaxCampaignIntervalReportPrediction" />' style="text-align: center;">
    <div class="info-panel-header">
        <h3>
            Campaign Interval Reporting - Prediction
        </h3>
    </div>
    <canvas data-type="Line" width="600" height="400" style="width: 600px; height: 400px;"></canvas>
</div>
</body>
</html>