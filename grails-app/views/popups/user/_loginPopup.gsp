
<div data-role="popup" id="popupLogin" class="ui-corner-all">
    <g:form controller="user" action="authorizeUser">
        <div style="padding:10px 20px;">
            <h3>Please sign in</h3>
            <label for="username" class="ui-hidden-accessible">
                <g:message code="username.field.name" default="Username:" />
            </label>
            <input type="text" name="username" id="username" value="" placeholder="username">

            <label for="pw" class="ui-hidden-accessible">
                <g:message code="password.field.name" default="Password:" />
            </label>
            <input type="password" name="password" id="password" value="" placeholder="password">

            <button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check">
                Sign in
            </button>
        </div>
    </g:form>
</div>