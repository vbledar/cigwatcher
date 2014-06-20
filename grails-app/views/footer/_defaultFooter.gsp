<div data-role="navbar">
    <ul>
        <li>
            <g:link controller="landing" action="index" data-icon="home" class="${controllerName.equalsIgnoreCase("landing") ? 'ui-btn-active' : ''}">
                <g:message code="home.page.link.label" default="Home" />
            </g:link>
        </li>
        <li>
            <g:link controller="campaign" action="campaign" data-icon="star" class="${controllerName.equalsIgnoreCase("campaign") ? 'ui-btn-active' : ''}">
                <g:message code="campaign.page.link.label" default="Campaign" />
            </g:link>
        </li>
        <li>
            <g:link controller="report" action="index" data-icon="grid" class="${controllerName.equalsIgnoreCase("report") ? 'ui-btn-active' : ''}">
                <g:message code="reports.page.link.label" default="Reports" />
            </g:link>
        </li>
        <li>
            <g:link controller="settings" action="settings" data-icon="gear" class="${controllerName.equalsIgnoreCase("settings") ? 'ui-btn-active' : ''}">
                <g:message code="settings.page.link.label" default="Settings" />
            </g:link>
        </li>
    </ul>

</div>