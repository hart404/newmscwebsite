<%@ page import="newmscwebsite.Person" %>

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
    <g:textField name="street" maxlength="70" value="${personInstance?.address?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.apartment', 'error')} ">
    <label for="address.apartment">
        <g:message code="person.address.apartment.label" default="Apartment" />        
    </label>
    <g:textField name="apartment" maxlength="10" value="${personInstance?.address?.apartment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.city', 'error')} ">
	<label for="address.city">
		<g:message code="person.address.city.label" default="City" />
		
	</label>
	<g:textField name="city" maxlength="30" value="${personInstance?.address?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.state', 'error')} ">
	<label for="address.state">
		<g:message code="person.address.state.label" default="State" />
		
	</label>
	<g:textField name="state" maxlength="2" value="${personInstance?.address?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address.zip', 'error')} ">
	<label for="address.zip">
		<g:message code="person.address.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" maxlength="10" value="${personInstance?.address?.zip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homePhone.number', 'error')} ">
	<label for="homePhone.number">
		<g:message code="person.homePhone.number.label" default="Home Phone" />
		
	</label>
	<g:textField name="homePhone" maxlength="20" value="${personInstance?.homePhone?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cellPhone.number', 'error')} ">
	<label for="cellPhone.number">
		<g:message code="person.cellPhone.number.label" default="Cell Phone" />
		
	</label>
	<g:textField name="cellPhone" maxlength="20" value="${personInstance?.cellPhone?.number}"/>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="person.photo.label" default="Photo" />		
	</label>
    <span id="photoFileName"><g:if test="${personInstance?.photo == null}">-None Selected-</g:if><g:else>${personInstance?.photo.originalFileName}</g:else></span>
    <button id="search">Search for Photo</button>
    <input type="hidden" name="photoId" id="photoId" value="${personInstance?.photo?.id}" />
</div>
</sec:ifAnyGranted>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'dateOfBirth', 'error')} ">
    <label for="tshirtSize">
        <g:message code="person.dateOfBirth.label" default="Date of Birth" />
        
    </label>
    <g:datePicker name="dateOfBirth" value="${personInstance?.dateOfBirth}" precision="day" years="${years}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'tshirtSize', 'error')} ">
	<label for="tshirtSize">
		<g:message code="person.tshirtSize.label" default="Tshirt Size" />
		
	</label>
	<g:select name="tshirtSize" from="${personInstance.constraints.tshirtSize.inList}" value="${personInstance?.tshirtSize}" valueMessagePrefix="person.tshirtSize" noSelection="['': '']"/>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="person.position.label" default="Leadership" />
		
	</label>
	<g:select name="position" from="${newmscwebsite.CLTPosition?.values()}" keys="${newmscwebsite.CLTPosition.values()*.name()}" value="${personInstance?.position?.name()}" noSelection="['': '']"/>
</div>
</sec:ifAnyGranted>

<sec:ifNotGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'position', 'error')} ">
    <label for="position">
        <g:message code="person.position.label" default="Leadership" />        
    </label>
    <em>${personInstance?.position}</em>
</div>
</sec:ifNotGranted>

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

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'masterSteward', 'error')} ">
	<label for="masterSteward">
		<g:message code="person.masterSteward.label" default="Master Steward" />		
	</label>
	<g:checkBox name="masterSteward" value="${personInstance?.masterSteward}" />
</div>
</sec:ifAnyGranted>

<sec:ifNotGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'masterSteward', 'error')} ">
    <label for="masterSteward">
        <g:message code="person.masterSteward.label" default="Master Steward" />        
    </label>
    <em><g:if test="${personInstance.masterSteward}">Yes</g:if><g:else>No</g:else></em>
</div>
</sec:ifNotGranted>

<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'leadSteward', 'error')} ">
    <label for="leadSteward">
        <g:message code="person.leadSteward.label" default="Lead Steward" />        
    </label>
    <g:checkBox name="leadSteward" value="${personInstance?.leadSteward}" />
</div>
</sec:ifAnyGranted>

<sec:ifNotGranted roles="ROLE_ADMIN,ROLE_LEADER,ROLE_STAFF">
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'leadSteward', 'error')} ">
    <label for="leadSteward">
        <g:message code="person.leadSteward.label" default="Lead Steward" />        
    </label>
    <em><g:if test="${personInstance.leadSteward}">Yes</g:if><g:else>No</g:else></em>
</div>
</sec:ifNotGranted>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'wantsWeeklyEmail', 'error')} ">
	<label for="wantsWeeklyEmail">
		<g:message code="person.wantsWeeklyEmail.label" default="Wants Weekly Email" />		
	</label>
	<g:checkBox name="wantsWeeklyEmail" value="${personInstance?.wantsWeeklyEmail}" />
</div>

<div>
<h2>Interests</h2>
	<div>
	    <g:checkBox name="bikePatrol" value="${personInstance?.hasInterest('bikePatrol')}" />
	    Bike Patrol
	</div>
	<div>
	    <g:checkBox name="communityRelations" value="${personInstance?.hasInterest('communityRelations')}" onclick='getEvents()' />
	    Community Relations
	</div>
	<div>
	    <g:checkBox name="constructionAndMaintenance" value="${personInstance?.hasInterest('constructionAndMaintenance')}" onclick='getEvents()' />
	    Construction and Maintenance
	</div>
	<div>
	    <g:checkBox name="hike" value="${personInstance?.hasInterest('hike')}" />
	    Hike
	</div>
	<div>
	    <g:checkBox name="natureGuides" value="${personInstance?.hasInterest('natureGuides')}" />
	    Nature Guides
	</div>
	<div>
	    <g:checkBox name="informationTechnology" value="${personInstance?.hasInterest('informationTechnology')}" />
	    Information Technology
	</div>
    <div>
        <g:checkBox name="fundraising" value="${personInstance?.hasInterest('fundraising')}" />
        Fundraising
    </div>
    <div>
        <g:checkBox name="pathfinders" value="${personInstance?.hasInterest('pathfinders')}" />
        Pathfinders
    </div>
    <div>
        <g:checkBox name="patrol" value="${personInstance?.hasInterest('patrol')}" />
        Patrol
    </div>
    <div>
        <g:checkBox name="research" value="${personInstance?.hasInterest('research')}" />
        Citizen Science
    </div>
    <div>
        <g:checkBox name="stewardEducation" value="${personInstance?.hasInterest('stewardEducation')}" />
        Steward Education
    </div>
    <div>
        <g:checkBox name="volunteerSupport" value="${personInstance?.hasInterest('volunteerSupport')}" />
        Volunteer Support
    </div>
    <br/>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN">
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
<g:if test="${personInstance.hasAuthority('ROLE_ADMIN')}">
    <g:checkBox name="role_admin" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_admin" value="${false}" />
</g:else>
</div>

<div>
<label>Guest</label>
<g:if test="${personInstance.hasAuthority('ROLE_GUEST')}">
    <g:checkBox name="role_guest" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_guest" value="${false}" />
</g:else>
</div>

<div>
<label>User</label>
<g:if test="${personInstance.hasAuthority('ROLE_USER')}">
    <g:checkBox name="role_user" value="${true }" />
</g:if>
<g:else>
    <g:checkBox name="role_user" value="${false}" />
</g:else>
</div>

<div>
<label>Steward</label>
<g:if test="${personInstance.hasAuthority('ROLE_STEWARD')}">
    <g:checkBox name="role_steward" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_steward" value="${false}" />
</g:else>
</div>

<div>
<label>Leader</label>
<g:if test="${personInstance.hasAuthority('ROLE_LEADER')}">
    <g:checkBox name="role_leader" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_leader" value="${false}" />
</g:else>
</div>

<div>
<label>Board</label>
<g:if test="${personInstance.hasAuthority('ROLE_BOARD')}">
    <g:checkBox name="role_board" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_board" value="${false}" />
</g:else>
</div>

<div>
<label>Staff</label>
<g:if test="${personInstance.hasAuthority('ROLE_STAFF')}">
    <g:checkBox name="role_staff" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_staff" value="${false}" />
</g:else>
</div>

<div>
<label>Web</label>
<g:if test="${personInstance.hasAuthority('ROLE_WEB')}">
    <g:checkBox name="role_web" value="${true}" />
</g:if>
<g:else>
    <g:checkBox name="role_web" value="${false}" />
</g:else>
</div>

</sec:ifAnyGranted>

