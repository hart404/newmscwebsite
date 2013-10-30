
<%@ page import="newmscwebsite.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="generatedLayout">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list person">
			
				<g:if test="${personInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="person.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${personInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.middleInitial}">
				<li class="fieldcontain">
					<span id="middleInitial-label" class="property-label"><g:message code="person.middleInitial.label" default="Middle Initial" /></span>
					
						<span class="property-value" aria-labelledby="middleInitial-label"><g:fieldValue bean="${personInstance}" field="middleInitial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="person.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${personInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.homePhone}">
				<li class="fieldcontain">
					<span id="homePhone-label" class="property-label"><g:message code="person.homePhone.label" default="Home Phone" /></span>
					
						<span class="property-value" aria-labelledby="homePhone-label"><g:fieldValue bean="${personInstance}" field="homePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.cellPhone}">
				<li class="fieldcontain">
					<span id="cellPhone-label" class="property-label"><g:message code="person.cellPhone.label" default="Cell Phone" /></span>
					
						<span class="property-value" aria-labelledby="cellPhone-label"><g:fieldValue bean="${personInstance}" field="cellPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="person.photo.label" default="Photo" /></span>
					
						<span class="property-value" aria-labelledby="photo-label"><g:link controller="SCMSPhoto" action="show" id="${personInstance?.photo?.id}">${personInstance?.photo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.tshirtSize}">
				<li class="fieldcontain">
					<span id="tshirtSize-label" class="property-label"><g:message code="person.tshirtSize.label" default="Tshirt Size" /></span>
					
						<span class="property-value" aria-labelledby="tshirtSize-label"><g:fieldValue bean="${personInstance}" field="tshirtSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="person.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${personInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.classNumber}">
				<li class="fieldcontain">
					<span id="classNumber-label" class="property-label"><g:message code="person.classNumber.label" default="Class Number" /></span>
					
						<span class="property-value" aria-labelledby="classNumber-label"><g:fieldValue bean="${personInstance}" field="classNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="person.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${personInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="person.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${personInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="person.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${personInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.emergencyContact}">
				<li class="fieldcontain">
					<span id="emergencyContact-label" class="property-label"><g:message code="person.emergencyContact.label" default="Emergency Contact" /></span>
					
						<span class="property-value" aria-labelledby="emergencyContact-label"><g:fieldValue bean="${personInstance}" field="emergencyContact"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.emergencyPhone}">
				<li class="fieldcontain">
					<span id="emergencyPhone-label" class="property-label"><g:message code="person.emergencyPhone.label" default="Emergency Phone" /></span>
					
						<span class="property-value" aria-labelledby="emergencyPhone-label"><g:fieldValue bean="${personInstance}" field="emergencyPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.emergencyRelationship}">
				<li class="fieldcontain">
					<span id="emergencyRelationship-label" class="property-label"><g:message code="person.emergencyRelationship.label" default="Emergency Relationship" /></span>
					
						<span class="property-value" aria-labelledby="emergencyRelationship-label"><g:fieldValue bean="${personInstance}" field="emergencyRelationship"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="person.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${personInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="person.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${personInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.masterSteward}">
				<li class="fieldcontain">
					<span id="masterSteward-label" class="property-label"><g:message code="person.masterSteward.label" default="Master Steward" /></span>
					
						<span class="property-value" aria-labelledby="masterSteward-label"><g:formatBoolean boolean="${personInstance?.masterSteward}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.wantsWeeklyEmail}">
				<li class="fieldcontain">
					<span id="wantsWeeklyEmail-label" class="property-label"><g:message code="person.wantsWeeklyEmail.label" default="Wants Weekly Email" /></span>
					
						<span class="property-value" aria-labelledby="wantsWeeklyEmail-label"><g:formatBoolean boolean="${personInstance?.wantsWeeklyEmail}" /></span>
					
				</li>
				</g:if>
				<li class="fieldcontain">
                    <span id="authorities-label" class="property-label"><g:message code="person.authorities.label" default="Authorities" /></span>
                        <span class="property-value" aria-labelledby="authorities-label"><g:fieldValue bean="${personInstance}" field="authorities" /></span>
                </li>
                <li class="fieldcontain">
                    <span id="interests-label" class="property-label"><g:message code="person.interests.label" default="Interests" /></span>
                        <span class="property-value" aria-labelledby="interests-label"><g:fieldValue bean="${personInstance}" field="interests" /></span>
                </li>
			
			</ul>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.id}" />
					<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"  />
                    <g:actionSubmit class="edit" action="changePassword" value="${message(code: 'default.button.changepassword.label', default: 'Change Password')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
