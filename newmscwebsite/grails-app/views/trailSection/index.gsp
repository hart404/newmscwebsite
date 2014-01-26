
<%@ page import="newmscwebsite.TrailSection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
					
						<g:sortableColumn property="notes" title="${message(code: 'trailSection.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="iconURL" title="${message(code: 'trailSection.iconURL.label', default: 'Icon URL')}" />
					
						<g:sortableColumn property="anchorX" title="${message(code: 'trailSection.anchorX.label', default: 'Anchor X')}" />
					
						<g:sortableColumn property="anchorY" title="${message(code: 'trailSection.anchorY.label', default: 'Anchor Y')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'trailSection.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'trailSection.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trailSectionInstanceList}" status="i" var="trailSectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trailSectionInstance.id}">${fieldValue(bean: trailSectionInstance, field: "notes")}</g:link></td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "iconURL")}</td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "anchorX")}</td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "anchorY")}</td>
					
						<td>${fieldValue(bean: trailSectionInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${trailSectionInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trailSectionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
