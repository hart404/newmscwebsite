
<%@ page import="org.mcdowellsonoran.volunteersession.VolunteerSession" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'volunteerSession.label', default: 'VolunteerSession')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-volunteerSession" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-volunteerSession" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list volunteerSession">
			
				<g:if test="${volunteerSessionInstance?.trailSections}">
				<li class="fieldcontain">
					<span id="trailSections-label" class="property-label"><g:message code="volunteerSession.trailSections.label" default="Trail Sections" /></span>
					
						<g:each in="${volunteerSessionInstance.trailSections}" var="t">
						<span class="property-value" aria-labelledby="trailSections-label"><g:link controller="trailSection" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.hours}">
				<li class="fieldcontain">
					<span id="hours-label" class="property-label"><g:message code="volunteerSession.hours.label" default="Hours" /></span>
					
						<span class="property-value" aria-labelledby="hours-label"><g:fieldValue bean="${volunteerSessionInstance}" field="hours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="volunteerSession.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:fieldValue bean="${volunteerSessionInstance}" field="date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.program}">
				<li class="fieldcontain">
					<span id="program-label" class="property-label"><g:message code="volunteerSession.program.label" default="Program" /></span>
					
						<span class="property-value" aria-labelledby="program-label"><g:fieldValue bean="${volunteerSessionInstance}" field="program"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="volunteerSession.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${volunteerSessionInstance?.person?.id}">${volunteerSessionInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="volunteerSession.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${volunteerSessionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerSessionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="volunteerSession.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${volunteerSessionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${volunteerSessionInstance?.id}" />
					<g:link class="edit" action="edit" id="${volunteerSessionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
