<%@ page import="newmscwebsite.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="person.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${personInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="person.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${personInstance?.password}"/>
</div>
<fieldset class="embedded"><legend><g:message code="person.homePhone.label" default="Home Phone" /></legend>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homePhone.id', 'error')} required">
	<label for="homePhone.id">
		<g:message code="person.homePhone.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="id" required="" value="${fieldValue(bean: phoneInstance, field: 'id')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homePhone.number', 'error')} ">
	<label for="homePhone.number">
		<g:message code="person.homePhone.number.label" default="Number" />
		
	</label>
	<g:textField name="number" maxlength="12" value="${phoneInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homePhone.version', 'error')} required">
	<label for="homePhone.version">
		<g:message code="person.homePhone.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="version" required="" value="${fieldValue(bean: phoneInstance, field: 'version')}"/>
</div>
</fieldset><fieldset class="embedded"><legend><g:message code="person.cellPhone.label" default="Cell Phone" /></legend>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellPhone.id', 'error')} required">
	<label for="cellPhone.id">
		<g:message code="person.cellPhone.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="id" required="" value="${fieldValue(bean: phoneInstance, field: 'id')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellPhone.number', 'error')} ">
	<label for="cellPhone.number">
		<g:message code="person.cellPhone.number.label" default="Number" />
		
	</label>
	<g:textField name="number" maxlength="12" value="${phoneInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellPhone.version', 'error')} required">
	<label for="cellPhone.version">
		<g:message code="person.cellPhone.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="version" required="" value="${fieldValue(bean: phoneInstance, field: 'version')}"/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="person.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${personInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="person.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${personInstance?.accountLocked}" />
</div>
<fieldset class="embedded"><legend><g:message code="person.address.label" default="Address" /></legend>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.city', 'error')} ">
	<label for="address.city">
		<g:message code="person.address.city.label" default="City" />
		
	</label>
	<g:textField name="city" maxlength="30" value="${streetAddressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.id', 'error')} required">
	<label for="address.id">
		<g:message code="person.address.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="id" required="" value="${fieldValue(bean: streetAddressInstance, field: 'id')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.state', 'error')} ">
	<label for="address.state">
		<g:message code="person.address.state.label" default="State" />
		
	</label>
	<g:textField name="state" maxlength="2" value="${streetAddressInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.street', 'error')} ">
	<label for="address.street">
		<g:message code="person.address.street.label" default="Street" />
		
	</label>
	<g:textField name="street" maxlength="70" value="${streetAddressInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.version', 'error')} required">
	<label for="address.version">
		<g:message code="person.address.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="version" required="" value="${fieldValue(bean: streetAddressInstance, field: 'version')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.zip', 'error')} ">
	<label for="address.zip">
		<g:message code="person.address.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" maxlength="10" value="${streetAddressInstance?.zip}"/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${personInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="person.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${personInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="person.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${personInstance?.passwordExpired}" />
</div>

