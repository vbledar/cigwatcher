package org.cigwatcher.user

import org.cigwatcher.BaseService
import org.cigwatcher.model.user.User

class AuthenticationService extends BaseService {

    /**
     * Attempt user authorization through username and password.
     *
     * @param username the username of the user instance to search for.
     * @param password the password of the user instance to search for.
     *
     * @return <code>User</code> if user instance is found,
     * <code>null</code>, otherwise.
     */
    def authorizeUser(String username, String password) {

        // retrieve user instance from database
        User user = User.findByUsernameAndPassword(username, password)

        // when user instance is found then authorization is complete
        if (user) {
            return user
        }

        // no user instance met the given username and password criteria
        return null
    }

}
