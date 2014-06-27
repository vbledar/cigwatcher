<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/25/14
  Time: 14:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
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

<div class="info-panel" style="text-align: center;">
    <div class="info-panel-header">
        <h3>
            Campaign Interval Reporting
        </h3>
    </div>
    <canvas id="campaignIntervalReport" data-type="Line" width="600" height="400" style="width: 600px; height: 400px;"></canvas>
</div>

<g:javascript>

    $(document).on('ready', function() {
    var data = {
	    labels : ["January","February","March","April","May","June","July"],
	    datasets : [
                        {
                            fillColor : "rgba(220,220,220,0.5)",
                            strokeColor : "rgba(220,220,220,1)",
                            pointColor : "rgba(220,220,220,1)",
                            pointStrokeColor : "#fff",
                            data : [65,59,90,81,56,55,40]
                        },
                        {
                            fillColor : "rgba(151,187,205,0.5)",
                            strokeColor : "rgba(151,187,205,1)",
                            pointColor : "rgba(151,187,205,1)",
                            pointStrokeColor : "#fff",
                            data : [28,48,40,19,96,27,100]
                        }
                    ]
    }

    //Get context with jQuery - using jQuery's .get() method.
    var canvas = document.getElementById("campaignIntervalReport");
    var ctx = canvas.getContext("2d");

    var myNewChart = new Chart(ctx);
    new Chart(ctx).Line(${data});
    });

</g:javascript>

</body>
</html>