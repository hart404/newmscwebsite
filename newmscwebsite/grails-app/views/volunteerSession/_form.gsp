<%@ page import="newmscwebsite.VolunteerSession" %>



<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="volunteerSession.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hours" value="${fieldValue(bean: volunteerSessionInstance, field: 'hours')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="volunteerSession.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'time', 'error')} ">
	<label for="time">
		<g:message code="volunteerSession.time.label" default="Time" />
		
	</label>
	<g:field name="time" type="number" value="${volunteerSessionInstance.time}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'program', 'error')} ">
	<label for="program">
		<g:message code="volunteerSession.program.label" default="Program" />
		
	</label>
	<g:textField name="program" value="${volunteerSessionInstance?.program}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'trailsSections', 'error')} ">
	<label for="trailsSections">
		<g:message code="volunteerSession.trailsSections.label" default="Trails Sections" />
		
	</label>
	<g:select name="trailsSections" from="${newmscwebsite.TrailSection.list()}" multiple="multiple" optionKey="id" size="5" value="${volunteerSessionInstance?.trailsSections*.id}" class="many-to-many"/>
</div>

