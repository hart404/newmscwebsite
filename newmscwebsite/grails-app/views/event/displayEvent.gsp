<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>Display Event</title>
</head>
<body>
	<div class="eventOrNews">
		<h2>${event.title}</h2>
		<p class="bigp"><span class="highlight2">Date: </span>${event.formattedDateOnly()}</p>
		<p class="bigp"><span class="highlight2">Time: </span>${event.formattedTimeOnly()}</p>
		<p class="bigp"><span class="highlight2">Location: </span><g:if test="${event.location}"><g:link controller="trailhead" action="displayLocation" id="${event.location.id}">${event.location}</g:link></g:if><g:else>TBD</g:else></p>
		<p class="bigp">${event.shortDescription}</p>
		<p class="bigp">${event.moreInformation}</p>
	</div>
</body>
</html>