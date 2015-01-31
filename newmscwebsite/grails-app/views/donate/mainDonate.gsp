<html>
<head>
    <meta name="layout" content="mainLayout" />
    <title>Donate Now</title>
</head>
<body>
    <div class="generalContainer">
	    <div class="formContainer">
	        <h1 class="redEventText wideBackground">Donate Now</h1>
	        <p class="bigp grayEventText">Help us care for the McDowell Sonoran Preserve. Your support will ensure that the Preserve continues to be a pristine open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>
	        <h2 class="redEventText wideBackground">Donation Details</h2>
	        <g:form name="donateForm" controller="donate" action="takeDonation">
	        <p class="bigp grayEventText">Choose the gift level you wish to support:</p>
	        <g:radioGroup values="[1, 2, 3, 4, 5, 6]" onclick="donationSelected(this)" id="donationSelection" value="1" name="giftLevel" labels="['$100 Copper Friends Gift',  '$250 Bronze Friends Gift', '$500 Silver Friends Gift', '$1000 Gold Friends Gift', '$1500 McDowell Sonoran Society','Other']">
	        <g:if test="${it.label == 'Other'}">
	        <p class="bigp grayEventText">${it.radio} ${it.label} $ <g:textField name="otherDonationAmount" onclick="selectOtherDonationAmount()"/></p>
	        </g:if>
	        <g:else>
	        <p class="bigp grayEventText">${it.radio} ${it.label}</p>
	        </g:else>
	        </g:radioGroup>
	        <input type="hidden" name="donationAmount" id="donationAmount" value="">
	        <h2 class="redEventText wideBackground">Billing Information</h2>
	        <table border="" class="donateTable">
	        <tr>
	            <td><label for="title"><g:message code="donation.title.label" default="Title" /></label></td>
	            <td><g:select name="title" from="${['', 'Mr', 'Mrs', 'Ms', 'Dr', 'Professor']}" valueMessagePrefix="donation.title" noSelection="['': '']"/></td>
	        </tr>        
	        <tr>
	            <td><label for="firstName"><g:message code="donation.firstName.label" default="First Name" /></label></td>
	            <td><g:textField name="firstName" maxlength="30" size="20" required="" /></td>
	        </tr>        
	        <tr>
	            <td><label for="lastName"><g:message code="donation.lastName.label" default="Last Name" /></label></td>
	            <td><g:textField name="lastName" maxlength="40" size="30" required="${true}"/></td>
	        </tr>        
	        <tr>
	            <td><label for="street"><g:message code="donation.street.label" default="Street" /></label></td>
	            <td><g:textField name="street" maxlength="40" size="40" required="${true}"/></td>
	        </tr>        
	        <tr>
	            <td><label for="apartment"><g:message code="donation.apartment.label" default="Apartment" /></label></td>
	            <td><g:textField name="apartment" maxlength="10" size="10" /></td>
	        </tr>        
	        <tr>
	            <td><label for="city"><g:message code="donation.city.label" default="City" /></label></td>
	            <td><g:textField name="city" maxlength="30" size="25" required="${true}"/></td>
	        </tr>        
	        <tr>
	            <td><label for="state"><g:message code="donation.state.label" default="State" /></label></td>
	            <td><g:textField name="state" maxlength="15" size="15" required="${true}"/></td>
	        </tr>        
	        <tr>
	            <td><label for="country"><g:message code="donation.country.label" default="Country" /></label></td>
	            <td><g:textField name="country" maxlength="20" size="15" required="${true}" value="USA"/></td>
	        </tr>        
	        <tr>
	            <td><label for="zip"><g:message code="donation.zip.label" default="Zip" /></label></td>
	            <td><g:textField name="zip" maxlength="20" size="15" required="${true}" value=""/></td>
	        </tr>        
	        <tr>
	            <td><label for="phone"><g:message code="donation.phone.label" default="Phone" /></label></td>
	            <td><g:textField name="phone" maxlength="20" size="12" required="${true}" /></td>
	        </tr>        
	        <tr>
	            <td><label for="email"><g:message code="donation.email.label" default="Email" /></label></td>
	            <td><g:textField name="email" maxlength="40" size="30" required="${true}" /></td>
	        </tr>        
	        </table>
	        <h2 class="redEventText wideBackground">Payment Information</h2>
	        <table border="" class="donateTable">
	        <tr>
	            <td><label for="cardType"><g:message code="donation.cardType.label" default="Card Type" /></label></td>
	            <td><g:select required="" name="cardType" from="${['Visa', 'Mastercard', 'American Express', 'Discover']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/></td>
	        </tr>        
	        <tr>
	            <td><label for="cardNumber"><g:message code="donation.cardNumber.label" default="Card Number" /></label></td>
	            <td><g:textField name="cardNumber" maxlength="40" size="24" required="${true}" /></td>
	        </tr>        
	        <tr>
	            <td><label for="expirationDate"><g:message code="donation.expirationDate.label" default="Expiration Date" /></label></td>
	            <td>
	                <g:select required="" name="expirationMonth" from="${['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/>
	                <g:select required="" name="expirationYear" from="${['2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023']}" valueMessagePrefix="donation.cardType" noSelection="['': '']"/>
	            </td>
	        </tr>        
	        <tr>
	            <td><label for="ccv"><g:message code="donation.ccv.label" default="CCV" /></label></td>
	            <td><g:textField name="ccv" maxlength="4" size="4" required="${true}" /></td>
	        </tr>        
	        <tr>
	            <td><label for="description"><g:message code="donation.description.label" default="Description" /></label></td>
	            <td><g:textField name="description" maxlength="50" size="50" /></td>
	        </tr>        
	        </table>
	        <p class="bigp grayEventText">
	            <g:checkBox name="tributeDonation" value="${false}" onclick="selectDeselectTributeDonation(this)" />
	            I would like to make this a Tribute Donation
	        </p>
	        <div id="tributeDonationDiv" style="visibility: collapse; height: 0; ">
		        <h2 class="redEventText wideBackground">Tribute Gift Information</h2>
		        <table class="donateTable">
		        <tr>
		            <td><label for="recipientName"><g:message code="donation.recipientName.label" default="Recipient Name" /></label></td>
		            <td><g:textField name="recipientName" maxlength="40" size="30" /></td>
		        </tr>        
	            <tr>
	                <td><label for="recipientEmail"><g:message code="donation.recipientEmail.label" default="Recipient Email" /></label></td>
	                <td><g:textField name="recipientEmail" maxlength="40" size="30" /></td>
	            </tr>        
	            <tr>
	                <td><label for="tributeSubject"><g:message code="donation.tributeSubject.label" default="eCard Subject" /></label></td>
	                <td><g:textField name="tributeSubject" maxlength="40" size="30" /></td>
	            </tr>        
	            <tr>
	                <td><label for="tributeBody"><g:message code="donation.tributeBody.label" default="eCard Message" /></label></td>
	                <td><g:textArea name="tributeBody" cols="100" rows="8" /></td>
	            </tr>        
		        </table>
		        <g:each var="eCard" in="${eCards}" status="index">
		           <input type="radio" name="eCardSelection" value="${index}" onclick="eCardSelected(this)" <g:if test="${index == 0}">checked="checked"</g:if>>
		           <div id="eCard${index}" class="eCardImage innerGlowSmall" style="width: 150px; height: ${(150 / eCard.width) * eCard.height}px; background-image: url('${eCard.fullPath()}'); background-size: cover;" onclick="selectECard(${index})" onmouseover="enlarge('#eCard${index}')" onmouseout="restore('#eCard${index}')">
		           </div>  
		        </g:each>
	        </div>
	        <input type="hidden" id="actualDonationAmount" name="actualDonationAmount">
	        <div style="width: 950px; float: right; ">
	        <!-- (c) 2005, 2012. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">var ANS_customer_id="5bd0fbb3-fa4d-4c00-b7eb-214f4a97f288";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Payment Processing</a> </div>     
	        </div>
	        <div style="padding: 35px; ">
	        <input type="button" id="donateSubmit" value="Donate" onclick="donateNow()">
	        </div>
	        <input type="submit" style="display:none" name="submitButton">
	        </g:form>
	    </div>
    </div>
    <script>
    
        var selectedAmountButton = 1;

        var amounts = [100, 250, 500, 100, 1500, 0]
    
        function donationSelected(radioButton) {
            selectedAmountButton = radioButton.value;
            if (radioButton.value == 6) {
                $("#otherDonationAmount").focus();
            }
        }
    
        function selectDeselectTributeDonation(checkbox) {
            if (checkbox.checked) {
                $('#tributeDonationDiv').css("visibility", "visible");
                $('#tributeDonationDiv').css("height", "auto");
            } else {
                $('#tributeDonationDiv').css("visibility", "collapse");
                $('#tributeDonationDiv').css("height", "0");
            }
        }

        function donateNow() {
            var button = selectedAmountButton;
            $('#actualDonationAmount').val(amounts[selectedAmountButton - 1]);
            if (selectedAmountButton == 6) {
                // Other amount selected
            	$('#actualDonationAmount').val($("#otherDonationAmount").val());
            }
            $('input[type=submit]').click();
        }

        function eCardSelect(radioButton) {
            $('#selectedECard').val(radioButton.value);
        }

        function enlarge(elementId) {      	
	   		$(elementId).animate({
	   	   		width: '300px',
	   		    height: '200px'
	   		}, 500);
   		}

   		function restore(elementId) {
            $(elementId).animate({
                width: '150px',
                height: '100px'
            }, 500);
   	   	}

   	   	function selectECard(radioNumber) {
   	   	   	var radio = $('input:radio[name=eCardSelection]')[radioNumber];
   	        eCardSelect(radio);
   	        radio.checked = true;
   	   	}

   	   	function selectOtherDonationAmount() {
   	   	   	var radio = $('input:radio[name=giftLevel]')[5];
   	   	   	selectedAmountButton = 6;
   	   	   	radio.checked = true;
   	   	}
    </script>
</body>
</html>