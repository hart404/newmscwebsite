<%@ page import="newmscwebsite.ProgramReporting" %>
<%@ page import="org.mcdowellsonoran.volunteersession.VolunteerSession" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'volunteerSession.label', default: 'VolunteerSession')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-volunteerSession" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-volunteerSession" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="Volunteer Session" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>					
						<th><g:message code="volunteerSession.person.label" default="Person" /></th>
						<g:sortableColumn property="program" title="${message(code: 'volunteerSession.program.label', default: 'Program')}" />
						<g:sortableColumn property="date" title="${message(code: 'volunteerSession.date.label', default: 'Date')}" />
						<g:sortableColumn property="hours" title="${message(code: 'volunteerSession.hours.label', default: 'Hours')}" />
						<g:sortableColumn property="dateCreated" title="${message(code: 'volunteerSession.dateCreated.label', default: 'Date Created')}" />
						<g:sortableColumn property="lastUpdated" title="${message(code: 'volunteerSession.lastUpdated.label', default: 'Last Updated')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${volunteerSessionInstanceList}" status="i" var="volunteerSessionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="edit" id="${volunteerSessionInstance.id}">${fieldValue(bean: volunteerSessionInstance, field: "person")}</g:link></td>
						<td>${((ProgramReporting)(volunteerSessionInstance.program)).value()}</td>
						<td>${fieldValue(bean: volunteerSessionInstance, field: "date")}</td>
						<td>${fieldValue(bean: volunteerSessionInstance, field: "hours")}</td>
						<td><g:formatDate date="${volunteerSessionInstance.dateCreated}" /></td>
						<td><g:formatDate date="${volunteerSessionInstance.lastUpdated}" /></td>					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${volunteerSessionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
