<html>
<head>
<meta name="layout" content="mainLayout" />
<title>News Item</title>
</head>
<body>
	<div class="newsContainer">
		<div class="eventOrNews">
			<g:each var="newsItem" in="${newsItems}">
				<h2 class="redEventText">
					${newsItem.title}
				</h2>
				<p class="bigp grayEventText">
					<span class="highlight2">Date: </span>
					${newsItem.title}
				</p>
				<p class="bigp grayEventText">
					<span class="highlight2">Summary: </span>
					${newsItem.summary}
				</p>
				<p class="bigp grayEventText">
					<span class="highlight2">More Information: </span>
					${newsItem.moreInformation}
				</p>
			</g:each>
			<div class="pagination">
				<g:paginate total="${newsItemCount}" max="5" />
			</div>
		</div>
	</div>
</body>
</html>