
<%@ page import="newmscwebsite.TrailSection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'trailSection.label', default: 'TrailSection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trailSection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trailSection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="pinName" title="${message(code: 'trailSection.pinName.label', default: 'Pin Name')}" />
					
						<g:sortableColumn property="trailName" title="${message(code: 'trailSection.trailName.label', default: 'Trail Name')}" />
					
						<g:sortableColumn property="frequency" title="${message(code: 'trailSection.frequency.label', default: 'Frequency')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'trailSection.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'trailSection.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trailSectionInstanceList}" status="i" var="trailSectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${trailSectionInstance.id}">${fieldValue(bean: trailSectionInstance, field: "pinName")}</g:link></td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "trailName")}</td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "frequency")}</td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "color")}</td>
					
						<td><g:formatBoolean boolean="${trailSectionInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trailSectionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
