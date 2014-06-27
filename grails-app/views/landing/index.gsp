<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/18/14
  Time: 14:14
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>

    <title>
        <g:if test="${session.user}">
            <g:message code="landing.page.title.default" default="Welcome" args="${[session?.user?.username]}"/>
        </g:if>
        <g:else>
            <g:message code="landing.page.title.no.user" default="Welcome"/>
        </g:else>
    </title>

</head>

<body>

    <content tag="pageElementCreation">
        <div data-role="page" id="mainui" data-theme="b">
    </content>

    <content tag="headerNavigation">
        <div data-role="header">
            <h1>
                <g:if test="${session.user}">
                    <g:message code="landing.page.title.default" default="Welcome" args="${[session?.user?.username]}"/>
                </g:if>
                <g:else>
                    <g:message code="landing.page.title.no.user" default="Welcome"/>
                </g:else>
            </h1>

            <g:if test="${!session?.user}">
                <g:link controller="user" action="registration" data-icon="user" class="ui-btn-left neon-shadow-light">
                    <g:message code="register.button.label" default="Register" />
                </g:link>

                <a id="showLoginScreen" href="#" class="ui-btn-right neon-shadow-light" data-icon="power">
                    <g:message code="login.button.label" default="Login" />
                </a>
            </g:if>
            <g:else>
                <g:link controller="user" action="deauthorizeUser" class="ui-btn-right neon-shadow-light" data-icon="lock" data-ajax="false">
                    <g:message code="logout.button.label" default="Logout" />
                </g:link>
            </g:else>
        </div>

        <g:if test="${!session?.user}">
            <g:render template="/popups/user/loginPopup"/>
        </g:if>
    </content>


    <g:if test="${session.user}">
        <content tag="footerView">
            <g:render template="/footer/defaultFooter" />
        </content>
    </g:if>

</body>
</html>