<html>
<head>
<meta name="layout" content="mainLayout" />
<title>Display Event</title>
</head>
<body>
	<div class="eventOrNews bodyLightYellow">
		<g:if test="${event.mainPhoto != null}">
			<div class="eventPhoto innerGlow" style="background-image: url('${event.mainPhoto.fullPath()}')"></div>
		</g:if>
		<g:else>
			<div class="eventPhoto"></div>
		</g:else>
		<div class="individualEventBody">
			<h2 class="redEventText">
				${event.title}
			</h2>
			<p class="bigp grayEventText">
				${event.formattedDateOnly()}
				-
				${event.formattedTimeOnly()}
			</p>
			<p class="bigp">
				<span class="highlight2">Location: </span>
				<g:if test="${event.location}">
					<g:link controller="trailhead" action="displayLocation" id="${event.location.id}">
						${event.location}
					</g:link>
				</g:if>
				<g:else>
					<span class="bigp grayEventText">
						${event.otherLocation}
					</span>
				</g:else>
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
</body>
</html>