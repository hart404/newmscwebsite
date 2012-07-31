<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>Donate</title>
</head>
<body>
<h1>Donate Now</h1>
<p class="bigp">Help us care for the McDowell Sonoran Preserve. Your support will ensure that the Preserve continues to be a pristine open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>
<h2>Donation Details</h2>
<g:form name="donateForm" controller="donate" action="donateNow">
<p class="bigp">Choose the gift level you wish to support:</p>
<g:radioGroup values="[1, 2, 3, 4, 5, 6, 7]" name="giftLevel" labels="['$1500 McDowell Sonoran Society', '$1000 Steward Circle', '$500 Trailbuilder Circle', '$250 Caretaker Circle', '$100 Pathfinder Circle', '$50 Hiker Circle', 'Other']">
<g:if test="${it.label == 'Other'}">
<p class="bigp">${it.radio} ${it.label} $ <g:textField name="otherDonationAmount" /></p>
</g:if>
<g:else>
<p>${it.radio} ${it.label}</p>
</g:else>
</g:radioGroup>
<p class="bigp">Gift Frequency: Choose to make a one-­time gift or a monthly recurring gift</p>
<g:radioGroup values="[1, 2]" name="giftFrequency" labels="['I want to make a one-­time gift', 'I want to make a monthly recurring gift']">
<p>${it.radio} ${it.label}</p>
</g:radioGroup>
</g:form>
</body>
</html>