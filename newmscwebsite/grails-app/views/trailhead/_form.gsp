<%@ page import="newmscwebsite.Trailhead" %>



<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="trailhead.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="100" value="${trailheadInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="trailhead.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="160" rows="20" maxlength="1000" value="${trailheadInstance?.description}"/>
</div>
<fieldset class="embedded"><legend><g:message code="trailhead.address.label" default="Address" /></legend>
<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'address.street', 'error')} ">
    <label for="address.street">
        <g:message code="trailhead.address.street.label" default="Street" />
        
    </label>
    <g:textArea name="street" value="${streetAddressInstance?.street}" rows="1" cols="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'address.city', 'error')} ">
	<label for="address.city">
		<g:message code="trailhead.address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${streetAddressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'address.state', 'error')} ">
	<label for="address.state">
		<g:message code="trailhead.address.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${streetAddressInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'address.zip', 'error')} ">
	<label for="address.zip">
		<g:message code="trailhead.address.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" value="${streetAddressInstance?.zip}"/>
</div>
</fieldset><fieldset class="embedded"><legend><g:message code="trailhead.coordinates.label" default="Coordinates" /></legend>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'coordinates.latitude', 'error')} required">
	<label for="coordinates.latitude">
		<g:message code="trailhead.coordinates.latitude.label" default="Latitude" />
	</label>
	<g:field type="number decimal" name="latitude" id="latitude" value="${formatNumber(number: geographicCoordinatesInstance.latitude, format: "####.######")}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'coordinates.longitude', 'error')} required">
	<label for="coordinates.longitude">
		<g:message code="trailhead.coordinates.longitude.label" default="Longitude" />
	</label>
	<g:field type="number decimal" name="longitude" id="longitude" value="${formatNumber(number: geographicCoordinatesInstance.longitude, format: "####.######")}"/>
</div>

</fieldset>
<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'internalName', 'error')} ">
	<label for="internalName">
		<g:message code="trailhead.internalName.label" default="Internal Name" />
		
	</label>
	<g:textField name="internalName" maxlength="20" value="${trailheadInstance?.internalName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'hikes', 'error')} ">
	<label for="hikes">
		<g:message code="trailhead.hikes.label" default="Hikes" />
		
	</label>
	<g:select name="hikes" from="${newmscwebsite.Hike.list()}" multiple="multiple" optionKey="id" size="5" value="${trailheadInstance?.hikes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'amenities', 'error')} ">
    <label for="amenities">
        <g:message code="trailhead.amenities.label" default="Amenities" />
        <g:select name="amenities" from="${newmscwebsite.Amenity.values()}" multiple="multiple" size="5" value="${trailheadInstance?.amenities}" class="many-to-many"/>
    </label>
    
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'activities', 'error')} ">
    <label for="activities">
        <g:message code="trailhead.activities.label" default="Activities" />
        <g:select name="activities" from="${newmscwebsite.Activity.values()}" multiple="multiple" size="5" value="${trailheadInstance?.activities}" class="many-to-many"/>
    </label>
    
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'mapName', 'error')} ">
	<label for="mapName">
		<g:message code="trailhead.mapName.label" default="Map Name" />
		
	</label>
	<g:textField name="mapName" value="${trailheadInstance?.mapName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'descriptionMetadata', 'error')} ">
	<label for="descriptionMetadata">
		<g:message code="trailhead.descriptionMetadata.label" default="Description Metadata" />
		
	</label>
	<g:textArea cols="160" rows="3" name="descriptionMetadata" value="${trailheadInstance?.descriptionMetadata}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'keywordsMetadata', 'error')} ">
	<label for="keywordsMetadata">
		<g:message code="trailhead.keywordsMetadata.label" default="Keywords Metadata" />
		
	</label>
	<g:textArea cols="160" rows="3" name="keywordsMetadata" value="${trailheadInstance?.keywordsMetadata}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trailheadInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="trailhead.activities.label" default="Activities" />
		
	</label>
	
</div>


