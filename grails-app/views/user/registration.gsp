<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/18/14
  Time: 15:59
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="backButtonLayout"/>

    <title>
        <g:message code="page.registration.title" default="Registration"/>
    </title>
</head>

<body>

<g:form name="userRegistrationForm" controller="user" action="registerUser">

<content tag="backHeader">
    <g:link controller="landing" action="index">
        <g:message code="back.button.label" default="Back" />
    </g:link>
</content>

<content tag="headerTitle">
    <h1>
        <g:message code="page.registration.title" default="Registration"/>
    </h1>
</content>

%{--<content tag="rightHeader">--}%
    %{----}%
%{--</content>--}%

<div style="text-align: center">
    <h1>
        <g:message code="registration.form.title" default="Registration Form" />
    </h1>

    <p style="font-size: 10px; font-weight: normal; color: darkorange;">
        User this form in to create a new user. After creating a new user you can login and create campaigns, keep track of
        your progress, etc.
    </p>
</div>

    <div class="info-panel">
        <h3>
            <g:message code="personal.user.information" default="Personal Information" />
        </h3>

        <div class="full-line"></div>

        <div class="ui-field-contain">
            <label for="firstname">
                <g:message code="firstname.field.name"/>
            </label>
            <input type="text" name="firstname" id="firstname" placeholder="Firstname" value="${user?.firstname}" class="${hasErrors(bean: user, field: 'firstname', 'field-error')}" >
        </div>

        <g:hasErrors bean="${user}" field="firstname">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${user}" field="firstname" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <div class="ui-field-contain">
            <label for="lastname">
                <g:message code="lastname.field.name"/>
            </label>
            <input type="text" name="lastname" id="lastname" placeholder="Lastname" value="${user?.lastname}" class="${hasErrors(bean: user, field: 'firstname', 'field-error')}" >
        </div>


        <g:hasErrors bean="${user}" field="lastname">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${user}" field="lastname" as="list" />
                </div>
            </div>
        </g:hasErrors>

    </div>

    <div class="spacer15"></div>

    <div class="info-panel">
        <h3>
            <g:message code="personal.communication.information" default="Communication Information" />
        </h3>

        <div class="full-line"></div>

        <div class="ui-field-contain">
            <label for="email">
                <g:message code="email.field.name"/>
            </label>
            <input type="text" name="email" id="email" placeholder="Email" value="${user?.email}">
        </div>

        <div class="ui-field-contain">
            <label for="recieveNotifications">
                <g:message code="receive.notifications.name" default="Receive notifications?"/>
            </label>
            <select name="recieveNotifications" id="recieveNotifications" data-role="slider" data-mini="true">
                <option value="off">
                    <g:message code="field.value.no" default="No" />
                </option>
                <option value="on" selected="">
                    <g:message code="field.value.yes" default="Yes" />
                </option>
            </select>
        </div>
    </div>

    <div class="spacer15"></div>

    <div class="info-panel">
        ${hasErrors(bean:'user', field:'username', 'errors')}

        <h3>
            <g:message code="authentication.information" default="Authentication Information" />
        </h3>

        <div class="full-line"></div>

        <div class="ui-field-contain">
            <label for="username">
                <g:message code="username.field.name"/>
            </label>
            <input type="text" name="username" id="username" placeholder="Username" value="${user?.username}" class="${hasErrors(bean: user, field: 'username', 'field-error')}" >
        </div>

        <g:hasErrors bean="${user}" field="username">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${user}" field="username" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <div class="ui-field-contain">
            <label for="password">
                <g:message code="password.field.name"/>
            </label>
            <input type="password" name="password" id="password" placeholder="Password" value="" class="${hasErrors(bean: user, field: 'password', 'field-error')}" >
        </div>

        <g:hasErrors bean="${user}" field="password">
            <div class="ui-field-contain">
                <label style="width: 20%; min-width: 20%; max-width: 20%"></label>
                <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset error-list">
                    <g:renderErrors bean="${user}" field="password" as="list" />
                </div>
            </div>
        </g:hasErrors>

        <div class="ui-field-contain">
            <label for="repeatpassword">
                <g:message code="repeat.password.field.name"/>
            </label>
            <input type="password" name="repeatpassword" id="repeatpassword" placeholder="Reqeat Password" value="">
        </div>
    </div>

    <div class="spacer10"></div>

    <input type="submit" value="<g:message code='register.button.label' default='Register'/>" data-icon="user">
</g:form>
</body>
</html>