package org.cigwatcher.anonymous

import org.cigwatcher.BaseController

class LandingController extends BaseController {

    def index() {

        if (flash.sessionexpired) {
            flash.warning = message(code: 'session.expired', default: 'Session expired. Please, login again.')
        }
        render (view: 'index')

    }
}
