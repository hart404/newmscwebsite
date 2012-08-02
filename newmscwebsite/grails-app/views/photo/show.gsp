<html>
<head>
	<title>Show Photo</title>
	<meta name="layout" content="mainLayout" />
</head>
<body>
	<g:if test="${photo.width > 600}">
		<div>
			<img src="<g:createLinkTo dir='${photo.path}' file='${photo.fileName}'/>" width="600" height="${(600 / photo.width) * photo.height}"/>
		</div>
	</g:if>
	<g:else>
		<div>
			<img src="${photo.source}"/>
		</div>
	</g:else>
	<p class="bigp">Name: ${photo.fileName}</p>
	<p class="bigp">Artist: ${photo.artist}</p>
	<p class="bigp">Keywords: ${photo.allKeywords}</p>
	<p class="bigp">Date Taken: ${photo.dateCreated}</p>
	<p class="bigp">Copyright: ${photo.copyright}</p>
	<p class="bigp">Dimensions: ${photo.width}x${photo.height}</p>	
</body>
</html>