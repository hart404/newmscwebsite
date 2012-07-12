<g:each var="event" in="${events}">
	<h2 class="redEventText">
		${event.title}
	</h2>
	<p class="bigp grayEventText">
		${event.formattedDateOnly()} - ${event.formattedTimeOnly()}
	</p>
	<p class="bigp">
		<span class="highlight2">Location: </span>
		<g:if test="${event.location}">
			<g:link controller="trailhead" action="displayLocation" id="${event.location.id}">${event.location}</g:link>
		</g:if>
		<g:else>TBD</g:else>
	</p>
	<p class="bigp grayEventText">
		${event.shortDescription}
	</p>
	<p class="bigp grayEventText">
		${event.moreInformation}
	</p>
</g:each>

