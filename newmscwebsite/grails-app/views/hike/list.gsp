
<%@ page import="newmscwebsite.Hike" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hike.label', default: 'Hike')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hike" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hike" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'hike.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'hike.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="noteworthyFeatures" title="${message(code: 'hike.noteworthyFeatures.label', default: 'Noteworthy Features')}" />
					
						<g:sortableColumn property="directions" title="${message(code: 'hike.directions.label', default: 'Directions')}" />
					
						<g:sortableColumn property="kmlFileName" title="${message(code: 'hike.kmlFileName.label', default: 'Kml File Name')}" />
					
						<g:sortableColumn property="elevationGain" title="${message(code: 'hike.elevationGain.label', default: 'Elevation Gain')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hikeInstanceList}" status="i" var="hikeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hikeInstance.id}">${fieldValue(bean: hikeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: hikeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: hikeInstance, field: "noteworthyFeatures")}</td>
					
						<td>${fieldValue(bean: hikeInstance, field: "directions")}</td>
					
						<td>${fieldValue(bean: hikeInstance, field: "kmlFileName")}</td>
					
						<td>${fieldValue(bean: hikeInstance, field: "elevationGain")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hikeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
