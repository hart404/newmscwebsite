<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>News Item</title>
</head>
<body>
	<div class="eventOrNews">
		<g:each var="newsItem" in="${newsItems}">
			<h2>${newsItem.title}</h2>
			<p class="bigp"><span class="highlight2">Date: </span>${newsItem.title}</p>
			<p class="bigp"><span class="highlight2">Summary: </span>${newsItem.summary}</p>
			<p class="bigp"><span class="highlight2">More Information: </span>${newsItem.moreInformation}</p>
		</g:each>
	</div>
</body>
</html>