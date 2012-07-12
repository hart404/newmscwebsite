y

<%@ page import="newmscwebsite.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mainLayout" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="event.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" required="" value="${eventInstance?.title}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortDescription"><g:message code="event.shortDescription.label" default="Short Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'shortDescription', 'errors')}">
                                    <g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${eventInstance?.shortDescription}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moreInformation"><g:message code="event.moreInformation.label" default="More Information" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'moreInformation', 'errors')}">
                                    <g:textArea name="moreInformation" cols="40" rows="5" maxlength="2000" value="${eventInstance?.moreInformation}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="event.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'location', 'errors')}">
                                    <g:select id="location" name="location.id" from="${newmscwebsite.Trailhead.list()}" optionKey="id" value="${eventInstance?.location?.id}" class="many-to-one" noSelection="['null': '']"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startTime"><g:message code="event.startTime.label" default="Start Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'startTime', 'errors')}">
                                    <gui:datePicker id="startTime" value="${eventInstance?.startTime?.toDate()}" includeTime="true" formatString="${joda.inputPattern()}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endTime"><g:message code="event.endTime.label" default="End Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'endTime', 'errors')}">
                                    <gui:datePicker id="endTime" value="${eventInstance?.endTime?.toDate()}" includeTime="true" formatString="${joda.inputPattern()}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eventPriority"><g:message code="event.eventPriority.label" default="Event Priority" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'eventPriority', 'errors')}">
                                    <g:select name="eventPriority" from="${1..10}" class="range" required="" value="${fieldValue(bean: eventInstance, field: 'eventPriority')}"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
