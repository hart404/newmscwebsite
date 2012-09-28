<g:each var="event" in="${events}">
	<div class="eventOrNews">
	    <g:if test="${event.mainPhoto != null}">
		    <div class="eventPhoto innerGlow" style="background-image: url('${event.mainPhoto.fullPath()}')">
		    </div>
		</g:if>
		<g:else>
	        <div class="eventPhoto" >
	        </div>
		</g:else>
	    <div class="eventBody">
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
				<g:else><span class="bigp grayEventText">${event.otherLocation}</span></g:else>
				<g:if test="${event.stewardOnly}"> &nbsp; - <span class="highlight2">Steward Only</span></g:if>
			</p>
			<p class="bigp grayEventText">
				${event.shortDescription}
			</p>
			<p class="bigp grayEventText">
				${event.moreInformation}
			</p>
			<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STEWARD,ROLE_STAFF">
			    <g:if test="${event.stewardOnlyInformation}">
	                <h2>Steward Only Information</h2>
				    <p class="bigp grayEventText">
				        ${event.stewardOnlyInformation}
				    </p>
			    </g:if>
			</sec:ifAnyGranted>
		</div>
	</div>
</g:each>
<g:set var="totalPages" value="${Math.ceil(eventCount / max) as Integer}" />
<g:set var="page" value="${(offset / max) + 1}" />
<g:if test="${totalPages < 1}">
<p class="bigp grayEventText">No events found for for your selection.</p>
</g:if>
<g:else>
	<g:if test="${totalPages == 1}">
	</g:if>
	<g:else>
	    <span class="currentStep">Page ${page} of ${totalPages}</span>
	    <input type="button" name="previous" value="Previous" id="previous" onClick='findEvents(${offset} - ${max}, ${max})' />
	    <input type="button" name="next" value="Next" id="next" onClick='findEvents(${offset} + ${max}, ${max})' />
	    <g:if test="${page == 1}">
	        <script>
	            $('#previous').attr('disabled', true);
	        </script>
	    </g:if>
	    <g:else>
	        <script>
	            $('#previous').attr('disabled', false);
	        </script>
	    </g:else>
	    <g:if test="${page == totalPages}">
	        <script>
	            $('#next').attr('disabled', true);
	        </script>
	    </g:if>
	    <g:else>
	        <script>
	            $('#next').attr('disabled', false);
	        </script>
	    </g:else>
	</g:else>
</g:else>


