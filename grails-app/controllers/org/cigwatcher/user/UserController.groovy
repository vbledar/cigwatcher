package org.cigwatcher.user

import org.cigwatcher.BaseController
import org.cigwatcher.model.user.User

class UserController extends BaseController {

    // dependency injection of the autorization service
    def authenticationService

    /**
     * User requested to register.
     */
    def registration() {

    }

    /**
     * Register user instance.
     *
     * @return
     */
    def registerUser() {
        log.error params

        User user = new User()
        bindData(user, params)

        if (!user.save()) {
            user.errors.each {
                log.error it
            }
            render (view: 'registration', model: [user: user])
        } else {
            authorizeUser()
        }
    }

    /**
     * Authorize user by username and password.
     */
    def authorizeUser() {
        String username = params.username
        String password = params.password

        User user = authenticationService.authorizeUser(username, password)
        if (user) {
            attachUserInSession(user)
        }

        redirect(controller: 'landing', action: 'index')
    }

    /**
     * Deauthorize user.
     */
    def deauthorizeUser() {
        detachUserFromSession()
        redirect(controller: 'landing', action: 'index')
    }
}
