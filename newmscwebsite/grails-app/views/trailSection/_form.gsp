<%@ page import="newmscwebsite.TrailSection" %>



<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="trailSection.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${trailSectionInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'iconURL', 'error')} ">
	<label for="iconURL">
		<g:message code="trailSection.iconURL.label" default="Icon URL" />
		
	</label>
	<g:textField name="iconURL" value="${trailSectionInstance?.iconURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'anchorX', 'error')} required">
	<label for="anchorX">
		<g:message code="trailSection.anchorX.label" default="Anchor X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="anchorX" required="" value="${fieldValue(bean: trailSectionInstance, field: 'anchorX')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'anchorY', 'error')} required">
	<label for="anchorY">
		<g:message code="trailSection.anchorY.label" default="Anchor Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="anchorY" required="" value="${fieldValue(bean: trailSectionInstance, field: 'anchorY')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="trailSection.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${trailSectionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="trailSection.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${trailSectionInstance?.enabled}" />
</div>
<fieldset class="embedded"><legend><g:message code="trailSection.pinLocation.label" default="Pin Location" /></legend>
<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinLocation.id', 'error')} required">
	<label for="pinLocation.id">
		<g:message code="trailSection.pinLocation.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="id" required="" value="${fieldValue(bean: geographicCoordinatesInstance, field: 'id')}"/>
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

<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinLocation.version', 'error')} required">
	<label for="pinLocation.version">
		<g:message code="trailSection.pinLocation.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="version" required="" value="${fieldValue(bean: geographicCoordinatesInstance, field: 'version')}"/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: trailSectionInstance, field: 'pinName', 'error')} ">
	<label for="pinName">
		<g:message code="trailSection.pinName.label" default="Pin Name" />
		
	</label>
	<g:textField name="pinName" value="${trailSectionInstance?.pinName}"/>
</div>

