package org.mcdowellsonoran

import grails.plugins.springsecurity.SpringSecurityService
import org.apache.log4j.MDC

class ActivityFilters {

    SpringSecurityService springSecurityService

    private static final String USER_KEY = "userName";
    private static final String ACTION_KEY = "actionId"
    private static final String REQUEST_KEY = "requestId"
    private static final String SESSION_KEY = "sessionId"

    def filters = {
        all(controller:'*', action:'*') {

            before = {
                MDC.put(USER_KEY, springSecurityService?.principal ?: "ANON_USER")
                MDC.put(ACTION_KEY, "$controllerName.$actionName: params:$params")
                MDC.put(REQUEST_KEY, request?.hashCode())
                MDC.put(SESSION_KEY, session?.id?.hashCode())
            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                MDC.remove(USER_KEY)
                MDC.remove(ACTION_KEY)
                MDC.remove(REQUEST_KEY)
                MDC.remove(SESSION_KEY)
            }
        }
    }
}
