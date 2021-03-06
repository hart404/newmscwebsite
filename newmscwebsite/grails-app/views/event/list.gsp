
<%@ page import="newmscwebsite.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="generatedLayout" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="shortDescription" title="${message(code: 'event.shortDescription.label', default: 'Short Description')}" />
                        
                            <g:sortableColumn property="moreInformation" title="${message(code: 'event.moreInformation.label', default: 'More Information')}" />
                        
                            <th><g:message code="event.location.label" default="Location" /></th>
                            <th><g:message code="event.otherLocation.label" default="Other Location" /></th>
                            <th><g:message code="event.stewardOnly.label" default="Steward Only" />
                        
                            <g:sortableColumn property="startTime" title="${message(code: 'event.startTime.label', default: 'Start Time')}" />
                        
                            <g:sortableColumn property="endTime" title="${message(code: 'event.endTime.label', default: 'End Time')}" />
                            
                            <th><g:message code="event.photo.label" default="Photo" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventInstanceList}" status="i" var="eventInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "title")}</g:link></td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "shortDescription")}</td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "moreInformation")}</td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "location")}</td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "otherLocation")}</td>
                            
                            <td>
                                <g:if test="${eventInstance.stewardOnly}">Yes</g:if><g:else>No</g:else>
                            </td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "startTime")}</td>
                        
                            <td>${fieldValue(bean: eventInstance, field: "endTime")}</td>
                        
                            <td>
                                <g:if test="${eventInstance.mainPhoto}" >
                                    <img src="${eventInstance.mainPhoto?.fullPath()}" height="100" width="${(100 / eventInstance.mainPhoto.height) * eventInstance.mainPhoto.width}" />
                                </g:if>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
