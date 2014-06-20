<g:applyLayout name="main">
    <head>
        <title>
            <g:layoutTitle default="Cig Watcher"/>
        </title>
        <g:layoutHead/>
    </head>
    <body>

    <g:if test="${pageProperty(name: "page.pageElementCreation")}">
        <content tag="pageElementCreation">
            <g:pageProperty name="page.pageElementCreation" />
        </content>
    </g:if>

    <content tag="headerNavigation">
        <g:if test="${pageProperty(name: 'page.leftHeader')}">
            <g:pageProperty name="page.leftHeader"/>
        </g:if>

        <g:if test="${pageProperty(name: 'page.headerTitle')}">
            %{-- Shown if header title is defined by the implementation --}%
            <g:pageProperty name="page.headerTitle" />
        </g:if>
        <g:else>
            <h1>
                <g:message code="landing.page.title" default="Welcome" />
            </h1>
        </g:else>

        <g:if test="${pageProperty(name: 'page.rightHeader')}">
            <g:pageProperty name="page.rightHeader"/>
        </g:if>
        <g:else>
            <g:link controller="user" action="deauthorizeUser" class="ui-btn-right neon-shadow-light">
                <g:message code="logout.button.label" default="Logout" />
            </g:link>
        </g:else>

    </content>

    <g:if test="${pageProperty(name: 'page.footerView')}">
        <content tag="footerView">
            <g:pageProperty name="page.footerView"/>
        </content>
    </g:if>
    <g:else>
        <content tag="footerView">
            <g:render template="/footer/defaultFooter" />
        </content>
    </g:else>

    <!-- Swap shop body -->
    <g:layoutBody/>
    </body>
</g:applyLayout>