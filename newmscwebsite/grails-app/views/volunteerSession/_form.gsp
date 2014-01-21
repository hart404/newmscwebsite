<%@ page import="newmscwebsite.VolunteerSession" %>
<%@ page import="newmscwebsite.ProgramReporting" %>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="volunteerSession.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="hours" step= "0.5" required="" value="${fieldValue(bean: volunteerSessionInstance, field: 'hours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="volunteerSession.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<joda:datePicker name="date" value="${volunteerSessionInstance?.date}" ></joda:datePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'program', 'error')} ">
	<label for="program">
		<g:message code="volunteerSession.program.label" default="Program" />
		
	</label>
	<g:select id="program" name="program" keys="${newmscwebsite.ProgramReporting.values()}" from="${newmscwebsite.ProgramReporting.values()*.representation()}" value="${(ProgramReporting)volunteerSessionInstance?.program}"></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerSessionInstance, field: 'person', 'error')}">
	<label for="person">
		<g:message code="volunteerSession.person.label" default="Person" />
	</label>
	${volunteerSessionInstance?.person}
</div>

