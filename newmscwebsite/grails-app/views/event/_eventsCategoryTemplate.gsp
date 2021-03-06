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
	    <div class="eventBodyForCategory">
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
			<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STEWARD,ROLE_STAFF,ROLE_WEB">
			    <g:if test="${event.stewardOnlyInformation}">
	                <h2>Steward Only Information</h2>
				    <p class="bigp grayEventText">
				        ${event.stewardOnlyInformation}
				    </p>
			    </g:if>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STAFF,ROLE_WEB">
                <div class="bigp">
                    <a href="<g:createLink controller='event' action='edit' id='${event.id}'/> ">Edit Event</a>
                </div>
            </sec:ifAnyGranted>
		</div>
	</div>
</g:each>
<g:set var="totalPages" value="${Math.ceil(eventCount / max) as Integer}" />
<g:set var="page" value="${(offset / max) + 1}" />
<g:if test="${totalPages < 1}">
<p class="bigp grayEventText">No events found for your selection.</p>
</g:if>
<g:else>
	<g:if test="${totalPages == 1}">
	</g:if>
	<g:else>
	    <span class="currentStep">Page ${page} of ${totalPages}</span>
	    <input type="button" name="previous" value="Previous" id="previous" onClick="findEventsForCategory(${offset} - ${max}, ${max}, '${category}')" />
	    <input type="button" name="next" value="Next" id="next" onClick="findEventsForCategory(${offset} + ${max}, ${max}, '${category}')" />
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


