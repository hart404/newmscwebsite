
<%@ page import="newmscwebsite.Trailhead" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'trailhead.label', default: 'Trailhead')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trailhead" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-trailhead" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trailhead">
			
				<g:if test="${trailheadInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="trailhead.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${trailheadInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="trailhead.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${trailheadInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="trailhead.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${trailheadInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.coordinates}">
				<li class="fieldcontain">
					<span id="coordinates-label" class="property-label"><g:message code="trailhead.coordinates.label" default="Coordinates" /></span>
					
						<span class="property-value" aria-labelledby="coordinates-label"><g:fieldValue bean="${trailheadInstance}" field="coordinates"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.internalName}">
				<li class="fieldcontain">
					<span id="internalName-label" class="property-label"><g:message code="trailhead.internalName.label" default="Internal Name" /></span>
					
						<span class="property-value" aria-labelledby="internalName-label"><g:fieldValue bean="${trailheadInstance}" field="internalName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.hikes}">
				<li class="fieldcontain">
					<span id="hikes-label" class="property-label"><g:message code="trailhead.hikes.label" default="Hikes" /></span>
					
						<g:each in="${trailheadInstance.hikes}" var="h">
						<span class="property-value" aria-labelledby="hikes-label"><g:link controller="hike" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.mapName}">
				<li class="fieldcontain">
					<span id="mapName-label" class="property-label"><g:message code="trailhead.mapName.label" default="Map Name" /></span>
					
						<span class="property-value" aria-labelledby="mapName-label"><g:fieldValue bean="${trailheadInstance}" field="mapName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.descriptionMetadata}">
				<li class="fieldcontain">
					<span id="descriptionMetadata-label" class="property-label"><g:message code="trailhead.descriptionMetadata.label" default="Description Metadata" /></span>
					
						<span class="property-value" aria-labelledby="descriptionMetadata-label"><g:fieldValue bean="${trailheadInstance}" field="descriptionMetadata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.keywordsMetadata}">
				<li class="fieldcontain">
					<span id="keywordsMetadata-label" class="property-label"><g:message code="trailhead.keywordsMetadata.label" default="Keywords Metadata" /></span>
					
						<span class="property-value" aria-labelledby="keywordsMetadata-label"><g:fieldValue bean="${trailheadInstance}" field="keywordsMetadata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.activities}">
				<li class="fieldcontain">
					<span id="activities-label" class="property-label"><g:message code="trailhead.activities.label" default="Activities" /></span>
					
						<span class="property-value" aria-labelledby="activities-label"><g:fieldValue bean="${trailheadInstance}" field="activities"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trailheadInstance?.amenities}">
				<li class="fieldcontain">
					<span id="amenities-label" class="property-label"><g:message code="trailhead.amenities.label" default="Amenities" /></span>
					
						<span class="property-value" aria-labelledby="amenities-label"><g:fieldValue bean="${trailheadInstance}" field="amenities"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<br/>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${trailheadInstance?.id}" />
					<g:link class="edit" action="edit" id="${trailheadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
