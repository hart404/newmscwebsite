<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>${newsItem.title}</title>
</head>
<body>
	<div class="newsItemContainer">
		<div class="eventOrNews">
			<g:if test="${newsItem.photo != null}">
			    <img src='${newsItem.photo.fullPath()}' style='display: none;'>
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
		    <div class="sharethisnewsitem">
				<span class='st_facebook_hcount' displayText='Facebook'></span>
				<span class='st_twitter_hcount' displayText='Tweet'></span>
				<span class='st_pinterest_hcount' displayText='Pinterest'></span>
				<span class='st_googleplus_hcount' displayText='Google +'></span>
				<span class='st_email_hcount' displayText='Email'></span>
				<span class='st_sharethis_hcount' displayText='ShareThis'></span>			
			</div>
		</div>
	</div>
</body>
</html>