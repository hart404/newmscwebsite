package newmscwebsite

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.slf4j.LoggerFactory;

class RoleController {
    def log = LoggerFactory.getLogger(RoleController)

    def index() {
        if (SpringSecurityUtils.ifAllGranted('ROLE_STEWARD')) {
            log.debug("Role Dispatch, user has steward role, going to steward home page")
            redirect (uri : '/content/pages/stewardHome')
        } else {
            log.debug("Role Dispatch, no steward role, going to home page")
            redirect (uri : '/')
        }
    }
}
