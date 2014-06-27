package cigwatcher

class PreviousActionFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
            }
        }
    }
}
