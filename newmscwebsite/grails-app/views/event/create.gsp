y

<%@ page import="newmscwebsite.Event"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="mainLayout" />
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span> <span class="menuButton"><g:link
				class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link></span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${eventInstance}">
			<div class="errors">
				<g:renderErrors bean="${eventInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><label for="title"><g:message
										code="event.title.label" default="Title" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'title', 'errors')}">
								<g:textField name="title" required=""
									value="${eventInstance?.title}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="shortDescription"><g:message
										code="event.shortDescription.label"
										default="Short Description" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'shortDescription', 'errors')}">
								<g:textArea name="shortDescription" cols="40" rows="5"
									maxlength="500" value="${eventInstance?.shortDescription}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="moreInformation"><g:message
										code="event.moreInformation.label" default="More Information" /></label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'moreInformation', 'errors')}">
								<g:textArea name="moreInformation" cols="40" rows="5"
									maxlength="2000" value="${eventInstance?.moreInformation}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="location"><g:message
										code="event.location.label" default="Location" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'location', 'errors')}">
								<g:select id="location" name="location.id"
									from="${newmscwebsite.Trailhead.list()}" optionKey="id"
									value="${eventInstance?.location?.id}" class="many-to-one"
									noSelection="['null': '']" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
								<label for="location">
    								<g:message code="event.photo.label" default="Location" />
								</label>
							</td>
							<td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'photo', 'errors')}">
	 							<span id="photoFileName">-None Selected-</span>
								<button id="search">Search for Photo</button>
								<input type="hidden" name="photoId" id="photoId" value="" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="startTime"><g:message
										code="event.startTime.label" default="Start Time" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'startTime', 'errors')}">
								<richui:dateChooser name="startTime" format="MM-dd-yyyy"
									time="true" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="endTime"><g:message
										code="event.endTime.label" default="End Time" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'endTime', 'errors')}">
								<richui:dateChooser name="endTime" format="MM-dd-yyyy"
									time="true" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="showOnHomePage"><g:message
										code="event.showOnHomePage.label" default="Show on Home Page" /></label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: eventInstance, field: 'showOnHomePage', 'errors')}">
								<g:checkBox name="showOnHomePage" value="${false}" />
							</td>
						</tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="family"><g:message
                                        code="event.family.label" default="Family" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="family" value="${false}" />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="fitness"><g:message
                                        code="event.fitness.label" default="Fitness" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="fitness" value="${false}" />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="hike"><g:message
                                        code="event.hike.label" default="Hike" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="hike" value="${false}" />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="classOrLecture"><g:message
                                        code="event.classOrLecture.label" default="Class or Lecture" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="classOrLecture" value="${false}" />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="specialEvent"><g:message
                                        code="event.specialEvent.label" default="Special Event" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="specialEvent" value="${false}" />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="volunteerEvent"><g:message
                                        code="event.volunteerEvent.label" default="Volunteer Event" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: eventInstance, field: 'categories', 'errors')}">
                                <g:checkBox name="volunteerEvent" value="${false}" />
                            </td>
                        </tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="create"
						class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
			</div>
		</g:form>
	</div>
	<g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
</body>
</html>
