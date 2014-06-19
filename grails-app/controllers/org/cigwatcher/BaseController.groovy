package org.cigwatcher

import org.cigwatcher.model.user.User

class BaseController {

    // dependency injection of base service instance
    def baseService

    /**
     * Store user object in session.
     *
     * @param user the user object to store.
     */
    void attachUserInSession(User user) {
        session["user"] = user
    }

    /**
     * Remove user object from session.
     */
    void detachUserFromSession() {
        session["user"] = null
    }

    /**
     * Retrieve user object stored in session.
     *
     * @return <code>User</code> the user instance object stored in session.
     */
    def getUserInSession() {
        return session["user"];
    }

    /**
     * Checks if a user instance object is stored in session. If that is
     * the case then we define that a user is logged in.
     *
     * @return <code>Boolean.TRUE</code> if user instance object is stored
     * in session, <code>Boolean.FALSE</code>, otherwise.
     */
    def isUserLoggedIn() {
        if (!session["user"])
            return Boolean.FALSE
        return Boolean.TRUE
    }
}
