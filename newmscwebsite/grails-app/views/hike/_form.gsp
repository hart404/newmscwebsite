<%@ page import="newmscwebsite.Hike" %>



<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="hike.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${hikeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="hike.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" required="" value="${hikeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'noteworthyFeatures', 'error')} required">
	<label for="noteworthyFeatures">
		<g:message code="hike.noteworthyFeatures.label" default="Noteworthy Features" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="noteworthyFeatures" cols="40" rows="5" maxlength="2000" required="" value="${hikeInstance?.noteworthyFeatures}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'directions', 'error')} required">
	<label for="directions">
		<g:message code="hike.directions.label" default="Directions" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="directions" cols="40" rows="5" maxlength="2000" required="" value="${hikeInstance?.directions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'kmlFileName', 'error')} ">
	<label for="kmlFileName">
		<g:message code="hike.kmlFileName.label" default="Kml File Name" />
		
	</label>
	<g:textField name="kmlFileName" value="${hikeInstance?.kmlFileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'elevationGain', 'error')} required">
	<label for="elevationGain">
		<g:message code="hike.elevationGain.label" default="Elevation Gain" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="elevationGain" min="0" max="3000" required="" value="${hikeInstance.elevationGain}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'roundTripDistance', 'error')} required">
	<label for="roundTripDistance">
		<g:message code="hike.roundTripDistance.label" default="Round Trip Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="roundTripDistance" min="0.1" max="25.0" required="" value="${fieldValue(bean: hikeInstance, field: 'roundTripDistance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'elevationProfile', 'error')} ">
	<label for="elevationProfile">
		<g:message code="hike.elevationProfile.label" default="Elevation Profile" />
		
	</label>
	<g:textField name="elevationProfile" value="${hikeInstance?.elevationProfile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'descriptionMetadata', 'error')} ">
	<label for="descriptionMetadata">
		<g:message code="hike.descriptionMetadata.label" default="Description Metadata" />
		
	</label>
	<g:textField name="descriptionMetadata" value="${hikeInstance?.descriptionMetadata}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hikeInstance, field: 'keywordsMetadata', 'error')} ">
	<label for="keywordsMetadata">
		<g:message code="hike.keywordsMetadata.label" default="Keywords Metadata" />
		
	</label>
	<g:textField name="keywordsMetadata" value="${hikeInstance?.keywordsMetadata}"/>
</div>

