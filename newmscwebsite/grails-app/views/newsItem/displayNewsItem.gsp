<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>News Item</title>
</head>
<body>
	<div class="newsItemContainer">
		<div class="eventOrNews">
			<g:if test="${newsItem.photo != null}">
	            <div class="eventPhoto innerGlow" style="background-image: url('${newsItem.photo.fullPath()}')"></div>
	        </g:if>
	        <g:else>
	            <div class="eventPhoto"></div>
	        </g:else>
	        <div class="individualEventBody">
				<h2>${newsItem.title}</h2>
				<p class="bigp"><span class="highlight2">Summary: </span>${newsItem.summary}</p>
				<p class="bigp"><span class="highlight2">More Information: </span>${newsItem.moreInformation}</p>
		    </div>
		</div>
	</div>
</body>
</html>