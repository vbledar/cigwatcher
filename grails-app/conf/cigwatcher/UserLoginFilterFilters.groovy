package cigwatcher

import javax.servlet.http.HttpSession

class UserLoginFilterFilters {

    def filters = {
        all( controllerExclude: 'landing') {
            before = {
//                HttpSession session = request.getSession()
//                if (session == null || session.isNew()) {
//                    log.error 'Session is invalid. Login required.'
//                    flash.sessionexpired = true
//                    redirect(controller: 'landing', action: 'index')
//                    return false
//                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
