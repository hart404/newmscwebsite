
<%@ page import="newmscwebsite.TrailSection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
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
			
				<g:if test="${trailSectionInstance?.pinName}">
				<li class="fieldcontain">
					<span id="pinName-label" class="property-label"><g:message code="trailSection.pinName.label" default="Pin Name" /></span>
					
						<span class="property-value" aria-labelledby="pinName-label"><g:fieldValue bean="${trailSectionInstance}" field="pinName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.trailName}">
				<li class="fieldcontain">
					<span id="trailName-label" class="property-label"><g:message code="trailSection.trailName.label" default="Trail Name" /></span>
					
						<span class="property-value" aria-labelledby="trailName-label"><g:fieldValue bean="${trailSectionInstance}" field="trailName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="trailSection.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${trailSectionInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="trailSection.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${trailSectionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="trailSection.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${trailSectionInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="trailSection.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${trailSectionInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.usedForReporting}">
				<li class="fieldcontain">
					<span id="usedForReporting-label" class="property-label"><g:message code="trailSection.usedForReporting.label" default="Used For Reporting" /></span>
					
						<span class="property-value" aria-labelledby="usedForReporting-label"><g:formatBoolean boolean="${trailSectionInstance?.usedForReporting}" /></span>
					
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
			
				<g:if test="${trailSectionInstance?.iconURL}">
				<li class="fieldcontain">
					<span id="iconURL-label" class="property-label"><g:message code="trailSection.iconURL.label" default="Icon URL" /></span>
					
						<span class="property-value" aria-labelledby="iconURL-label"><g:fieldValue bean="${trailSectionInstance}" field="iconURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.lastPatrolled}">
				<li class="fieldcontain">
					<span id="lastPatrolled-label" class="property-label"><g:message code="trailSection.lastPatrolled.label" default="Last Patrolled" /></span>
					
						<span class="property-value" aria-labelledby="lastPatrolled-label"><g:fieldValue bean="${trailSectionInstance}" field="lastPatrolled"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.frequency}">
				<li class="fieldcontain">
					<span id="frequency-label" class="property-label"><g:message code="trailSection.frequency.label" default="Frequency" /></span>
					
						<span class="property-value" aria-labelledby="frequency-label"><g:fieldValue bean="${trailSectionInstance}" field="frequency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="trailSection.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${trailSectionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="trailSection.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${trailSectionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.northPins}">
				<li class="fieldcontain">
					<span id="northPins-label" class="property-label"><g:message code="trailSection.northPins.label" default="North Pins" /></span>
					
						<span class="property-value" aria-labelledby="northPins-label"><g:formatBoolean boolean="${trailSectionInstance?.northPins}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.pinLocation}">
				<li class="fieldcontain">
					<span id="pinLocation-label" class="property-label"><g:message code="trailSection.pinLocation.label" default="Pin Location" /></span>
					
						<span class="property-value" aria-labelledby="pinLocation-label"><g:fieldValue bean="${trailSectionInstance}" field="pinLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailSectionInstance?.southPins}">
				<li class="fieldcontain">
					<span id="southPins-label" class="property-label"><g:message code="trailSection.southPins.label" default="South Pins" /></span>
					
						<span class="property-value" aria-labelledby="southPins-label"><g:formatBoolean boolean="${trailSectionInstance?.southPins}" /></span>
					
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
