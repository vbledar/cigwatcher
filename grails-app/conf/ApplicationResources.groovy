modules = {
    application {
        dependsOn('jquery')

        resource url:'js/application.js'
        resource url:'js/pageworkflow.js'
    }

    jquerymobile {
        dependsOn('application')
        resource url: 'js/jquery-mobile/jquery.mobile-1.4.2.css'
        resource url: 'js/jquery-mobile/jquery.mobile-1.4.2.js'
    }

    flipclock {
        dependsOn('jquery')

        resource url: 'css/flipclock.css'
        resource url: 'js/flipclock.js'
    }

    charting {
        resource url: 'js/Chart.js'
    }

    maincss {
        resource url: 'css/main.css'
    }
}