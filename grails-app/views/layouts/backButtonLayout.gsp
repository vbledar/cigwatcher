<g:applyLayout name="main">
    <head>
        <title>
            <g:layoutTitle default="Cig Watcher"/>
        </title>
        <g:layoutHead/>
    </head>
    <body>
        <!-- Swap shop sidebar if one exists -->
        <content tag="headerNavigation">
            <g:if test="${pageProperty(name: 'page.backHeader')}">
                <g:pageProperty name="page.backHeader"/>
            </g:if>
            <g:else>
                <a href="#" class="neon-shadow-light" data-rel="back" data-icon="back">
                    <g:message code="back.button.label" default="Back" />
                </a>
            </g:else>

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
                %{-- Shown if right header view is defined by the implementation --}%
                <g:pageProperty name="page.rightHeader" />
            </g:if>
        </content>

        <!-- Swap shop body -->
        <g:layoutBody/>
    </body>
</g:applyLayout>