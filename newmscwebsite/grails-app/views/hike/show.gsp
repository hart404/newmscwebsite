
<%@ page import="newmscwebsite.Hike" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'hike.label', default: 'Hike')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hike" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hike" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hike">
			
				<g:if test="${hikeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="hike.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${hikeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="hike.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${hikeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.noteworthyFeatures}">
				<li class="fieldcontain">
					<span id="noteworthyFeatures-label" class="property-label"><g:message code="hike.noteworthyFeatures.label" default="Noteworthy Features" /></span>
					
						<span class="property-value" aria-labelledby="noteworthyFeatures-label"><g:fieldValue bean="${hikeInstance}" field="noteworthyFeatures"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.directions}">
				<li class="fieldcontain">
					<span id="directions-label" class="property-label"><g:message code="hike.directions.label" default="Directions" /></span>
					
						<span class="property-value" aria-labelledby="directions-label"><g:fieldValue bean="${hikeInstance}" field="directions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.kmlFileName}">
				<li class="fieldcontain">
					<span id="kmlFileName-label" class="property-label"><g:message code="hike.kmlFileName.label" default="Kml File Name" /></span>
					
						<span class="property-value" aria-labelledby="kmlFileName-label"><g:fieldValue bean="${hikeInstance}" field="kmlFileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.elevationGain}">
				<li class="fieldcontain">
					<span id="elevationGain-label" class="property-label"><g:message code="hike.elevationGain.label" default="Elevation Gain" /></span>
					
						<span class="property-value" aria-labelledby="elevationGain-label"><g:fieldValue bean="${hikeInstance}" field="elevationGain"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.roundTripDistance}">
				<li class="fieldcontain">
					<span id="roundTripDistance-label" class="property-label"><g:message code="hike.roundTripDistance.label" default="Round Trip Distance" /></span>
					
						<span class="property-value" aria-labelledby="roundTripDistance-label"><g:fieldValue bean="${hikeInstance}" field="roundTripDistance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.elevationProfile}">
				<li class="fieldcontain">
					<span id="elevationProfile-label" class="property-label"><g:message code="hike.elevationProfile.label" default="Elevation Profile" /></span>
					
						<span class="property-value" aria-labelledby="elevationProfile-label"><g:fieldValue bean="${hikeInstance}" field="elevationProfile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.descriptionMetadata}">
				<li class="fieldcontain">
					<span id="descriptionMetadata-label" class="property-label"><g:message code="hike.descriptionMetadata.label" default="Description Metadata" /></span>
					
						<span class="property-value" aria-labelledby="descriptionMetadata-label"><g:fieldValue bean="${hikeInstance}" field="descriptionMetadata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hikeInstance?.keywordsMetadata}">
				<li class="fieldcontain">
					<span id="keywordsMetadata-label" class="property-label"><g:message code="hike.keywordsMetadata.label" default="Keywords Metadata" /></span>
					
						<span class="property-value" aria-labelledby="keywordsMetadata-label"><g:fieldValue bean="${hikeInstance}" field="keywordsMetadata"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hikeInstance?.id}" />
					<g:link class="edit" action="edit" id="${hikeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
