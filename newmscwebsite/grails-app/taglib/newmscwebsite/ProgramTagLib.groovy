package newmscwebsite

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

class ProgramTagLib {

    static namespace = "program"

    def reportingPrograms = {
        JSONArray programList = []
        ProgramReporting.values().findAll {program -> program.isShowable()}.each {
            JSONObject programMap = [:]
            programMap.put("programKey", it.name())
            programMap.put("programValue", it.value())
            programList << programMap
        }
        def jsonPrograms = programList.toString()
        out << jsonPrograms
    }

}
