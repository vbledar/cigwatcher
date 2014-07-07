<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title><g:layoutTitle default="Cig Watcher"/></title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <r:require modules="maincss, jquery, application, jquerymobile, charting, flipclock" />

		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>


    <g:if test="${pageProperty(name: "page.pageElementCreation")}">
        <g:pageProperty name="page.pageElementCreation" />
    </g:if>
    <g:else>
        <div data-role="page" data-theme="b">
    </g:else>

        %{-- Header Construction --}%
        <div data-role="header" data-position="fixed">

            <g:if test="${pageProperty(name: "page.headerNavigation")}">
                %{-- Shown if header is defined by the implementation --}%
                <g:pageProperty name="page.headerNavigation" />
            </g:if>
            <g:else>
                <g:if test="${pageProperty(name: 'page.leftHeader')}">
                    %{-- Shown if left header view is defined by the implementation --}%
                    <g:pageProperty name="page.leftHeader" />
                </g:if>

                <g:if test="${pageProperty(name: 'page.headerTitle')}">
                    %{-- Shown if header title is defined by the implementation --}%
                    <g:pageProperty name="page.headerTitle" />
                </g:if>

                <g:if test="${pageProperty(name: 'page.rightHeader')}">
                %{-- Shown if right header view is defined by the implementation --}%
                    <g:pageProperty name="page.rightHeader" />
                </g:if>

            </g:else>
        </div>

        %{-- Page Content --}%
        <div role="main" class="ui-content">

            %{--<g:if test="${flash.message}">--}%
                <div class="user-informational-message ${flash.error ? '' : 'hidden'}">
                    <table>
                        <tr>
                            <td>
                                <g:img dir="images" file="dialog-info.png" style="width: 25px; height: 25px;"/>
                            </td>
                            <td id="message-holder" style="padding-right: 20px;">
                                ${flash.message}
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="spacer15"></div>
            %{--</g:if>--}%
            %{--<g:elseif test="${flash.success}">--}%
                <div class="user-success-message ${flash.error ? '' : 'hidden'}">
                    <table>
                        <tr>
                            <td>
                                <g:img dir="images" file="dialog-apply.png" style="width: 25px; height: 25px;"/>
                            </td>
                            <td id="message-holder" style="padding-right: 20px;">
                                ${flash.success}
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="spacer15"></div>
            %{--</g:elseif>--}%
            %{--<g:elseif test="${flash.warning}">--}%
                <div class="user-warning-message ${flash.error ? '' : 'hidden'}">
                    <table>
                        <tr>
                            <td>
                                <g:img dir="images" file="dialog-warning.png" style="width: 25px; height: 25px;"/>
                            </td>
                            <td id="message-holder" style="padding-right: 20px;">
                                ${flash.warning}
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="spacer15"></div>
            %{--</g:elseif>--}%
            %{--<g:elseif test="${flash.error}">--}%
                <div class="user-error-message ${flash.error ? '' : 'hidden'}">
                    <table>
                        <tr>
                            <td>
                                <g:img dir="images" file="dialog-error.png" style="width: 25px; height: 25px;"/>
                            </td>
                            <td id="message-holder" style="padding-right: 20px;">
                                ${flash.error}
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="spacer15"></div>
            %{--</g:elseif>--}%

            <g:layoutBody/>
        </div>

        %{-- Footer Construction --}%
        <g:if test="${pageProperty(name: 'page.footerView')}">
            <div data-role="footer" data-position="fixed">
                <g:pageProperty name="page.footerView" />
            </div>
        </g:if>
    </div>


		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>