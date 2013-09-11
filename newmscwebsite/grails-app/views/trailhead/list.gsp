
<%@ page import="newmscwebsite.Trailhead" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'trailhead.label', default: 'Trailhead')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trailhead" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trailhead" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'trailhead.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'trailhead.description.label', default: 'Description')}" />
					
						<th><g:message code="trailhead.address.label" default="Address" /></th>
					
						<th><g:message code="trailhead.coordinates.label" default="Coordinates" /></th>
					
						<g:sortableColumn property="internalName" title="${message(code: 'trailhead.internalName.label', default: 'Internal Name')}" />
					
						<g:sortableColumn property="mapName" title="${message(code: 'trailhead.mapName.label', default: 'Map Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trailheadInstanceList}" status="i" var="trailheadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${trailheadInstance.id}">${fieldValue(bean: trailheadInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: trailheadInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: trailheadInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: trailheadInstance, field: "coordinates")}</td>
					
						<td>${fieldValue(bean: trailheadInstance, field: "internalName")}</td>
					
						<td>${fieldValue(bean: trailheadInstance, field: "mapName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trailheadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
