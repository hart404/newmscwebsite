<html>
<head>
    <meta name="layout" content="mainLayout" />
    <title>Donate</title>
</head>
<body>
    <div class="generalContainer">
        <h1 class="redEventText">Donate Now</h1>
        <p class="bigp grayEventText">Help us care for the McDowell Sonoran Preserve. Your support will ensure that the Preserve continues to be a pristine open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>
        <h2 class="redEventText">Donation Details</h2>
        <g:form name="donateForm" controller="donate" action="donateNow">
        <p class="bigp grayEventText">Choose the gift level you wish to support:</p>
        <g:radioGroup values="[1, 2, 3, 4, 5, 6, 7]" onclick="donationSelected(this)" id="donationSelection" value="1" name="giftLevel" labels="['$1500 McDowell Sonoran Society', '$1000 Steward Circle', '$500 Trailbuilder Circle', '$250 Caretaker Circle', '$100 Pathfinder Circle', '$50 Hiker Circle', 'Other']">
        <g:if test="${it.label == 'Other'}">
        <p class="bigp grayEventText">${it.radio} ${it.label} $ <g:textField name="otherDonationAmount" /></p>
        </g:if>
        <g:else>
        <p class="bigp grayEventText">${it.radio} ${it.label}</p>
        </g:else>
        </g:radioGroup>
        <input type="hidden" name="donationAmount" id="donationAmount" value="">
        <p class="bigp grayEventText">Gift Frequency: Choose to make a one-­time gift or a monthly recurring gift</p>
        <g:radioGroup values="[1, 2]" name="giftFrequency" value='1' labels="['I want to make a one-­time gift', 'I want to make a monthly recurring gift']">
        <p class="bigp grayEventText">${it.radio} ${it.label}</p>
        </g:radioGroup>
        <h2>Billing Information</h2>
        <table border="" class="donateTable">
        <tr>
            <td><label for="title"><g:message code="donation.title.label" default="Title" /></label></td>
            <td><g:select name="title" from="${['', 'Mr', 'Mrs', 'Ms', 'Dr', 'Professor']}" valueMessagePrefix="donation.title" noSelection="['': '']"/></td>
        </tr>        
        <tr>
            <td><label for="firstName"><g:message code="donation.firstName.label" default="First Name" /></label></td>
            <td><g:textField name="firstName" maxlength="30" size="20" required="true"/></td>
        </tr>        
        <tr>
            <td><label for="lastName"><g:message code="donation.lastName.label" default="Last Name" /></label></td>
            <td><g:textField name="lastName" maxlength="40" size="30" required="true"/></td>
        </tr>        
        <tr>
            <td><label for="street"><g:message code="donation.street.label" default="Street" /></label></td>
            <td><g:textField name="street" maxlength="40" size="40" required="true"/></td>
        </tr>        
        <tr>
            <td><label for="apartment"><g:message code="donation.apartment.label" default="Apartment" /></label></td>
            <td><g:textField name="apartment" maxlength="10" size="10" /></td>
        </tr>        
        <tr>
            <td><label for="city"><g:message code="donation.city.label" default="City" /></label></td>
            <td><g:textField name="city" maxlength="30" size="25" required="true"/></td>
        </tr>        
        <tr>
            <td><label for="state"><g:message code="donation.state.label" default="State" /></label></td>
            <td><g:textField name="state" maxlength="15" size="15" required="true"/></td>
        </tr>        
        <tr>
            <td><label for="country"><g:message code="donation.country.label" default="Country" /></label></td>
            <td><g:textField name="country" maxlength="20" size="15" required="true" value="USA"/></td>
        </tr>        
        <tr>
            <td><label for="phone"><g:message code="donation.phone.label" default="Phone" /></label></td>
            <td><g:textField name="phone" maxlength="20" size="12" required="true" /></td>
        </tr>        
        <tr>
            <td><label for="email"><g:message code="donation.email.label" default="Email" /></label></td>
            <td><g:textField name="email" maxlength="40" size="30" required="true" /></td>
        </tr>        
        </table>
        <h2>Payment Information</h2>
        <table border="" class="donateTable">
        <tr>
            <td><label for="cardType"><g:message code="donation.cardType.label" default="Card Type" /></label></td>
            <td><g:select required="" name="cardType" from="${['Visa', 'Mastercard', 'American Express', 'Discover']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/></td>
        </tr>        
        <tr>
            <td><label for="cardNumber"><g:message code="donation.cardNumber.label" default="Card Number" /></label></td>
            <td><g:textField name="cardNumber" maxlength="40" size="16" required="true" /></td>
        </tr>        
        <tr>
            <td><label for="expirationDate"><g:message code="donation.expirationDate.label" default="Expiration Date" /></label></td>
            <td>
                <g:select required="" name="expirationMonth" from="${['01', '02', '03', '04', '05', '06', '07', '08', '08', '10', '11', '12']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/>
                <g:select required="" name="expirationYear" from="${['2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/>
            </td>
        </tr>        
        <tr>
            <td><label for="ccv"><g:message code="donation.ccv.label" default="CCV" /></label></td>
            <td><g:textField name="ccv" maxlength="6" size="6" required="true" /></td>
        </tr>        
        </table>
        <p class="bigp grayEventText">
            <g:checkBox name="tributeDonation" value="${false}" onclick="selectDeselectTributeDonation(this)" />
            I would like to make this a Tribute Donation
        </p>
        <div id="tributeDonationDiv" style="visibility: collapse; height: 0; ">
	        <h2>Tribute Gift Information</h2>
	        <table class="donateTable">
	        <tr>
	            <td><label for="recipientName"><g:message code="donation.recipientName.label" default="Recipient Name" /></label></td>
	            <td><g:textField name="recipientName" maxlength="40" size="30" required="true" /></td>
	        </tr>        
            <tr>
                <td><label for="recipientEmail"><g:message code="donation.recipientEmail.label" default="Recipient Email" /></label></td>
                <td><g:textField name="recipientEmail" maxlength="40" size="30" required="true" /></td>
            </tr>        
            <tr>
                <td><label for="tributeSubject"><g:message code="donation.tributeSubject.label" default="eCard Subject" /></label></td>
                <td><g:textField name="tributeSubject" maxlength="40" size="30" required="true" /></td>
            </tr>        
            <tr>
                <td><label for="tributeBody"><g:message code="donation.tributeBody.label" default="eCard Message" /></label></td>
                <td><g:textArea name="tributeBody" cols="100" rows="8" required="true" /></td>
            </tr>        
	        </table>
	        <g:each var="eCard" in="${eCards}" status="index">
	           <input type="radio" name="eCardSelection" value="${index}" onclick="eCardSelected(this)" <g:if test="${index == 0}">checked="checked"</g:if>>
	           <div class="eCardImage innerGlowSmall" style="width: 150px; height: ${(150 / eCard.width) * eCard.height}px; background-image: url('${eCard.fullPath()}'); background-size: cover;">
	           </div>  
	        </g:each>
        </div>
        <input type="button" value="Donate" onclick="donateNow()">
        </g:form>
    </div>
    <script>
        function donationSelected(radioButton) {
            if (radioButton.value == 7) {
                $("#otherDonationAmount").focus()
            }
        }
    
        function selectDeselectTributeDonation(checkbox) {
            if (checkbox.checked) {
                $('#tributeDonationDiv').css("visibility", "visible")
                $('#tributeDonationDiv').css("height", "auto")
            } else {
                $('#tributeDonationDiv').css("visibility", "collapse")
                $('#tributeDonationDiv').css("height", "0")
            }
        }

        function donateNow() {
        }

        function eCardSelect(radioButton) {
        }
    </script>
</body>
</html>