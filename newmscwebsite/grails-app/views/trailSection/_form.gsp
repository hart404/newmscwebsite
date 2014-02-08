<%@ page import="newmscwebsite.TrailSection" %>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinName', 'error')} ">
	<label for="pinName">
		<g:message code="trailSection.pinName.label" default="Pin Name" />
		
	</label>
	<g:textField name="pinName" value="${trailSectionInstance?.pinName}" size="20"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'trailName', 'error')} ">
	<label for="trailName">
		<g:message code="trailSection.trailName.label" default="Trail Name" />
		
	</label>
	<g:textField name="trailName" value="${trailSectionInstance?.trailName}" size="80"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="trailSection.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${trailSectionInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="trailSection.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${trailSectionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="trailSection.color.label" default="Color" />
		
	</label>
	<g:textField name="color" value="${trailSectionInstance?.color}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="trailSection.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${trailSectionInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'usedForReporting', 'error')} ">
	<label for="usedForReporting">
		<g:message code="trailSection.usedForReporting.label" default="Used For Reporting" />
		
	</label>
	<g:checkBox name="usedForReporting" value="${trailSectionInstance?.usedForReporting}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'anchorX', 'error')} required">
	<label for="anchorX">
		<g:message code="trailSection.anchorX.label" default="Anchor X" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="anchorX" from="${-200..200}" class="range" required="" value="${fieldValue(bean: trailSectionInstance, field: 'anchorX')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'anchorY', 'error')} required">
	<label for="anchorY">
		<g:message code="trailSection.anchorY.label" default="Anchor Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="anchorY" from="${-200..200}" class="range" required="" value="${fieldValue(bean: trailSectionInstance, field: 'anchorY')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'iconURL', 'error')} ">
	<label for="iconURL">
		<g:message code="trailSection.iconURL.label" default="Icon URL" />
		
	</label>
	<g:textField name="iconURL" value="${trailSectionInstance?.iconURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'frequency', 'error')} ">
	<label for="frequency">
		<g:message code="trailSection.frequency.label" default="Frequency" />
		
	</label>
	<g:select name="frequency" from="${newmscwebsite.PatrolFrequency?.values()}" keys="${newmscwebsite.PatrolFrequency.values()*.name()}" value="${trailSectionInstance?.frequency?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'northPins', 'error')} ">
	<label for="northPins">
		<g:message code="trailSection.northPins.label" default="North Pins" />
		
	</label>
	<g:checkBox name="northPins" value="${trailSectionInstance?.northPins}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'southPins', 'error')} ">
	<label for="southPins">
		<g:message code="trailSection.southPins.label" default="South Pins" />
		
	</label>
	<g:checkBox name="southPins" value="${trailSectionInstance?.southPins}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinLocation.latitude', 'error')} required">
	<label for="pinLocation.latitude">
		<g:message code="trailSection.pinLocation.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="latitude" required="" value="${fieldValue(bean: geographicCoordinatesInstance, field: 'latitude')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinLocation.longitude', 'error')} required">
	<label for="pinLocation.longitude">
		<g:message code="trailSection.pinLocation.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="longitude" required="" value="${fieldValue(bean: geographicCoordinatesInstance, field: 'longitude')}"/>
</div>


