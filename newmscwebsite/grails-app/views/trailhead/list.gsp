
<%@ page import="newmscwebsite.Trailhead" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="generatedLayout" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'location.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'location.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'location.description.label', default: 'Description')}" />
                        
                            <th><g:message code="location.address.label" default="Address" /></th>
                        
                            <th><g:message code="location.coordinates.label" default="Coordinates" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${locationInstanceList}" status="i" var="locationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: locationInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: locationInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: locationInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: locationInstance, field: "coordinates")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${locationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
