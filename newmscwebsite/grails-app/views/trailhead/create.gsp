

<%@ page import="newmscwebsite.Trailhead"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="mainLayout" />
<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></span> <span class="menuButton"><g:link
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
		<g:hasErrors bean="${locationInstance}">
			<div class="errors">
				<g:renderErrors bean="${locationInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="name"><g:message code="location.name.label" default="Name" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'name', 'errors')}">
							<g:textField name="name" maxlength="100"
									value="${locationInstance?.name}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message code="location.description.label" default="Description" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'description', 'errors')}">
							<g:textArea name="description"
									cols="40" rows="5" maxlength="300" value="${locationInstance?.description}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="street"><g:message code="location.street.label" default="Street Address" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'address', 'errors')}">
							<g:textField name="street" cols="70"
									maxlength="70" value="${locationInstance?.address?.street}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="city"><g:message code="location.city.label" default="City" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'address', 'errors')}">
							<g:textField name="city" cols="30" rows="1"
									maxlength="30" value="${locationInstance?.address?.city}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="state"><g:message code="location.state.label" default="State" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'address', 'errors')}">
							<g:textField name="state" cols="2" rows="1"
									maxlength="2" value="${locationInstance?.address?.state}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="zip"><g:message code="location.zipcode.label" default="Zipcode" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'address', 'errors')}">
							<g:textField name="zip" cols="10" rows="1"
									maxlength="10" value="${locationInstance?.address?.zip}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="latitude"><g:message code="location.latitude.label" default="Latitude" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'coordinates', 'errors')}">
							<g:textField name="latitude" cols="20"
									rows="1" maxlength="20" value="${locationInstance?.coordinates?.latitude}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="longitude"><g:message code="location.longitude.label" default="Longitude" /></label></td>
							<td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'coordinates', 'errors')}">
							<g:textField name="longitude" cols="20"
									rows="1" maxlength="20" value="${locationInstance?.coordinates?.longitude}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
			</div>
		</g:form>
	</div>
</body>
</html>
