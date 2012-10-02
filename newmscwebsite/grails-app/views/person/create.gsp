<%@ page import="newmscwebsite.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-person" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="person.username.label" default="Username" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="username" required="" value="${personInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
    <label for="firstName">
        <g:message code="person.firstName.label" default="First Name" />
        
    </label>
    <g:textField name="firstName" maxlength="30" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'middleInitial', 'error')} ">
    <label for="middleInitial">
        <g:message code="person.middleInitial.label" default="Middle Initial" />
        
    </label>
    <g:textField name="middleInitial" maxlength="4" value="${personInstance?.middleInitial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
    <label for="lastName">
        <g:message code="person.lastName.label" default="Last Name" />
        
    </label>
    <g:textField name="lastName" maxlength="50" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.street', 'error')} ">
    <label for="address.street">
        <g:message code="person.address.street.label" default="Street" />
        
    </label>
    <g:textField name="street" maxlength="70" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.apartment', 'error')} ">
    <label for="address.apartment">
        <g:message code="person.address.apartment.label" default="Apartment" />
        
    </label>
    <g:textField name="apartment" maxlength="10" value="${streetAddressInstance?.apartment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.city', 'error')} ">
    <label for="address.city">
        <g:message code="person.address.city.label" default="City" />
        
    </label>
    <g:textField name="city" maxlength="30" value="${streetAddressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.state', 'error')} ">
    <label for="address.state">
        <g:message code="person.address.state.label" default="State" />
        
    </label>
    <g:textField name="state" maxlength="2" value="${streetAddressInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.zip', 'error')} ">
    <label for="address.zip">
        <g:message code="person.address.zip.label" default="Zip" />
        
    </label>
    <g:textField name="zip" maxlength="10" value="${streetAddressInstance?.zip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homePhone.number', 'error')} ">
    <label for="homePhone.number">
        <g:message code="person.homePhone.number.label" default="Home Phone" />
        
    </label>
    <g:textField name="homePhone" maxlength="14" value="${phoneInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellPhone.number', 'error')} ">
    <label for="cellPhone.number">
        <g:message code="person.cellPhone.number.label" default="Cell Phone" />
        
    </label>
    <g:textField name="cellPhone" maxlength="14" value="${phoneInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'photo', 'error')} ">
    <label for="photo">
        <g:message code="person.photo.label" default="Photo" />     
    </label>
    <span id="photoFileName"><g:if test="${personInstance?.photo == null}">-None Selected-</g:if><g:else>${personInstance?.photo.originalFileName}</g:else></span>
    <button id="search">Search for Photo</button>
    <input type="hidden" name="photoId" id="photoId" value="${personInstance?.photo?.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'tshirtSize', 'error')} ">
    <label for="tshirtSize">
        <g:message code="person.tshirtSize.label" default="Tshirt Size" />
        
    </label>
    <g:select name="tshirtSize" from="${personInstance.constraints.tshirtSize.inList}" value="${personInstance?.tshirtSize}" valueMessagePrefix="person.tshirtSize" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'position', 'error')} ">
    <label for="position">
        <g:message code="person.position.label" default="Leadership" />
        
    </label>
    <g:select name="position" from="${newmscwebsite.CLTPosition?.values()}" keys="${newmscwebsite.CLTPosition.values()*.name()}" value="${personInstance?.position?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'classNumber', 'error')} ">
    <label for="classNumber">
        <g:message code="person.classNumber.label" default="Class Number" />
        
    </label>
    <g:textField name="classNumber" value="${personInstance?.classNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emergencyContact', 'error')} ">
    <label for="emergencyContact">
        <g:message code="person.emergencyContact.label" default="Emergency Contact" />
        
    </label>
    <g:textField name="emergencyContact" value="${personInstance?.emergencyContact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emergencyPhone', 'error')} ">
    <label for="emergencyPhone">
        <g:message code="person.emergencyPhone.label" default="Emergency Phone" />
        
    </label>
    <g:textField name="emergencyPhone" value="${personInstance?.emergencyPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emergencyRelationship', 'error')} ">
    <label for="emergencyRelationship">
        <g:message code="person.emergencyRelationship.label" default="Emergency Relationship" />
        
    </label>
    <g:textField name="emergencyRelationship" value="${personInstance?.emergencyRelationship}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'masterSteward', 'error')} ">
    <label for="masterSteward">
        <g:message code="person.masterSteward.label" default="Master Steward" />        
    </label>
    <g:checkBox name="masterSteward" value="${personInstance?.masterSteward}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'wantsWeeklyEmail', 'error')} ">
    <label for="wantsWeeklyEmail">
        <g:message code="person.wantsWeeklyEmail.label" default="Wants Weekly Email" />     
    </label>
    <g:checkBox name="wantsWeeklyEmail" value="${personInstance?.wantsWeeklyEmail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
        <g:message code="person.passwordExpired.label" default="Password Expired" />        
    </label>
    <g:checkBox name="passwordExpired" value="${personInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="person.enabled.label" default="Enabled" />
        
    </label>
    <g:checkBox name="enabled" value="${personInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
        <g:message code="person.accountLocked.label" default="Account Locked" />
        
    </label>
    <g:checkBox name="accountLocked" value="${personInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
        <g:message code="person.accountExpired.label" default="Account Expired" />
        
    </label>
    <g:checkBox name="accountExpired" value="${personInstance?.accountExpired}" />
</div>

<div>
<label>Admin</label>
    <g:checkBox name="role_admin" value="${false}" />
</div>

<div>
<label>Guest</label>
    <g:checkBox name="role_guest" value="${false}" />
</div>

<div>
<label>User</label>
    <g:checkBox name="role_user" value="${false}" />
</div>

<div>
<label>Steward</label>
    <g:checkBox name="role_steward" value="${false}" />
</div>

<div>
<label>Leader</label>
    <g:checkBox name="role_leader" value="${false}" />
</div>

<div>
<label>Board</label>
    <g:checkBox name="role_board" value="${false}" />
</div>

<div>
<label>Staff</label>
    <g:checkBox name="role_staff" value="${false}" />
</div>

<div>
<label>Web</label>
    <g:checkBox name="role_web" value="${false}" />
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		<g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
	</body>
</html>
