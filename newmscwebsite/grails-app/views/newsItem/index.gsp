<html>
<head>
<meta name="layout" content="mainLayout" />
<title>News Items</title>
</head>
<body>
	<div class="newsContainer">
			<g:each var="newsItem" in="${newsItems}">
                <div class="eventOrNews">
					<g:if test="${newsItem.photo != null}">
						<div class="eventPhoto innerGlow" style="background-image: url('${newsItem.photo.fullPath()}')"></div>
					</g:if>
					<g:else>
						<div class="eventPhoto"></div>
					</g:else>
					<div class="newsItemBody">
						<h2 class="redEventText">
							${newsItem.title}
						</h2>
						<p class="bigp grayEventText">
							<span class="highlight2">Summary: </span>
							${newsItem.summary}
						</p>
						<p class="bigp grayEventText">
							<span class="highlight2">More Information: </span>
							${newsItem.moreInformation}
						</p>
					</div>
				</div>
			</g:each>
		<div class="pagination">
			<g:paginate total="${newsItemCount}" max="5" />
		</div>
	</div>
</body>
</html>