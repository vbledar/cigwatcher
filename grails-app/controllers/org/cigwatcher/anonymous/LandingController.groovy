package org.cigwatcher.anonymous

import org.cigwatcher.BaseController

class LandingController extends BaseController {

    def index() {

        render (view: 'index')

    }
}
