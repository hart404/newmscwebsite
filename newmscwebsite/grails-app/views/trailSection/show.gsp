
<%@ page import="newmscwebsite.TrailSection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trailSection.label', default: 'TrailSection')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trailSection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-trailSection" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trailSection">
			
				<g:if test="${trailSectionInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="trailSection.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${trailSectionInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.iconURL}">
				<li class="fieldcontain">
					<span id="iconURL-label" class="property-label"><g:message code="trailSection.iconURL.label" default="Icon URL" /></span>
					
						<span class="property-value" aria-labelledby="iconURL-label"><g:fieldValue bean="${trailSectionInstance}" field="iconURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.anchorX}">
				<li class="fieldcontain">
					<span id="anchorX-label" class="property-label"><g:message code="trailSection.anchorX.label" default="Anchor X" /></span>
					
						<span class="property-value" aria-labelledby="anchorX-label"><g:fieldValue bean="${trailSectionInstance}" field="anchorX"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.anchorY}">
				<li class="fieldcontain">
					<span id="anchorY-label" class="property-label"><g:message code="trailSection.anchorY.label" default="Anchor Y" /></span>
					
						<span class="property-value" aria-labelledby="anchorY-label"><g:fieldValue bean="${trailSectionInstance}" field="anchorY"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="trailSection.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${trailSectionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="trailSection.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${trailSectionInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.pinLocation}">
				<li class="fieldcontain">
					<span id="pinLocation-label" class="property-label"><g:message code="trailSection.pinLocation.label" default="Pin Location" /></span>
					
						<span class="property-value" aria-labelledby="pinLocation-label"><g:fieldValue bean="${trailSectionInstance}" field="pinLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.pinName}">
				<li class="fieldcontain">
					<span id="pinName-label" class="property-label"><g:message code="trailSection.pinName.label" default="Pin Name" /></span>
					
						<span class="property-value" aria-labelledby="pinName-label"><g:fieldValue bean="${trailSectionInstance}" field="pinName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${trailSectionInstance?.id}" />
					<g:link class="edit" action="edit" id="${trailSectionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
