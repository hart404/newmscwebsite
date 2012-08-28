<%@ page import="newmscwebsite.NewsItem" %>



<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="newsItem.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${newsItemInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="newsItem.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="1000" required="" value="${newsItemInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'moreInformation', 'error')} required">
	<label for="moreInformation">
		<g:message code="newsItem.moreInformation.label" default="More Information" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="moreInformation" cols="40" rows="5" maxlength="10000" required="" value="${newsItemInstance?.moreInformation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'important', 'error')} ">
	<label for="important">
		<g:message code="newsItem.important.label" default="Important" />
		
	</label>
	<g:checkBox name="important" value="${newsItemInstance?.important}" />
</div>

<div
    class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'photo', 'error')} required">
    <label for="photo"> <g:message
            code="newsItem.photo.label" default="Photo" /> <span
        class="required-indicator">*</span>
    </label>
    <span id="photoFileName">-None Selected-</span>
    <button id="search">Search for Photo</button>
    <input type="hidden" name="photoId" id= "photoId" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'displayStartDate', 'error')} required">
	<label for="displayStartDate">
		<g:message code="newsItem.displayStartDate.label" default="Display Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<joda:datePicker name="displayStartDate" value="${newsItemInstance?.displayStartDate}" ></joda:datePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'displayEndDate', 'error')} required">
	<label for="displayEndDate">
		<g:message code="newsItem.displayEndDate.label" default="Display End Date" />
		<span class="required-indicator">*</span>
	</label>
	<joda:datePicker name="displayEndDate" value="${newsItemInstance?.displayEndDate}" ></joda:datePicker>
</div>


