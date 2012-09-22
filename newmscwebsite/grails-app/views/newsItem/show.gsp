
<%@ page import="newmscwebsite.NewsItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsItem">
			
				<g:if test="${newsItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="newsItem.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${newsItemInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.moreInformation}">
				<li class="fieldcontain">
					<span id="moreInformation-label" class="property-label"><g:message code="newsItem.moreInformation.label" default="More Information" /></span>
					
						<span class="property-value" aria-labelledby="moreInformation-label"><g:fieldValue bean="${newsItemInstance}" field="moreInformation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.important}">
				<li class="fieldcontain">
					<span id="important-label" class="property-label"><g:message code="newsItem.important.label" default="Important" /></span>
					
						<span class="property-value" aria-labelledby="important-label"><g:formatBoolean boolean="${newsItemInstance?.important}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="newsItem.photo.label" default="Photo" /></span>
					
						<span class="property-value" aria-labelledby="photo-label"><g:link controller="SCMSPhoto" action="show" id="${newsItemInstance?.photo?.id}">${newsItemInstance?.photo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.displayStartDate}">
				<li class="fieldcontain">
					<span id="displayStartDate-label" class="property-label"><g:message code="newsItem.displayStartDate.label" default="Display Start Date" /></span>
					
						<span class="property-value" aria-labelledby="displayStartDate-label"><g:fieldValue bean="${newsItemInstance}" field="displayStartDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.displayEndDate}">
				<li class="fieldcontain">
					<span id="displayEndDate-label" class="property-label"><g:message code="newsItem.displayEndDate.label" default="Display End Date" /></span>
					
						<span class="property-value" aria-labelledby="displayEndDate-label"><g:fieldValue bean="${newsItemInstance}" field="displayEndDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newsItem.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newsItemInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="newsItem.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${newsItemInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newsItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${newsItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
