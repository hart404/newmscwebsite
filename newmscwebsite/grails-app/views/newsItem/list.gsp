
<%@ page import="newmscwebsite.NewsItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'newsItem.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="summary" title="${message(code: 'newsItem.summary.label', default: 'Summary')}" />
					
						<g:sortableColumn property="moreInformation" title="${message(code: 'newsItem.moreInformation.label', default: 'More Information')}" />
					
						<g:sortableColumn property="important" title="${message(code: 'newsItem.important.label', default: 'Important')}" />
					
						<th><g:message code="newsItem.photo.label" default="Photo" /></th>
					
						<g:sortableColumn property="displayStartDate" title="${message(code: 'newsItem.displayStartDate.label', default: 'Display Start Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsItemInstanceList}" status="i" var="newsItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${newsItemInstance.id}">${fieldValue(bean: newsItemInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "summary")}</td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "moreInformation")}</td>
					
						<td><g:formatBoolean boolean="${newsItemInstance.important}" /></td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "photo")}</td>
					
						<td>${fieldValue(bean: newsItemInstance, field: "displayStartDate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
