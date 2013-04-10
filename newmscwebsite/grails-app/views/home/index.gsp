<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>
</head>
<body>
	<div id="gallery" class="mscGallery">
	</div>
	<script>
	    function loadAdSpace(json) {
	    	if (typeof console == "undefined" || typeof console.log == "undefined") 
	    	{
	    	   var console = { log: function() {} }; 
	    	}
	        var data = eval(json);
	        Galleria.loadTheme("<g:createLinkTo dir='/js/galleria/themes/classic/' file='galleria.classic.min.js'/>");
	        $("#gallery").galleria({
	            dataSource: data,
	            showInfo: false,
	            transition: 'fade',
	            transitionSpeed: 1000,
	            showImagenav: false,
	            autoplay: 5000,
	            width: 1194,
	            height: 400,
	            imageCrop: true
	        });
	    };
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight">
			<div class="blockHeader headerBlue">
				<h1>Support Us</h1>
			</div>
			<div class="homePageSubItem bodyBlue" >
				<div class="imageContainer">
				    <scms:photoWidget widget='${donatePhoto}' photoCssClass="innerGlow imageDonate"/>
					<div class="imageText">
						<p><scms:htmlWidget widget="${donateText}" /></p>
					</div>
					<div class="imageButton">
						<a href="https://www.networkforgood.org/donation/MakeDonation.aspx?ORGID2=860674350" target="_blank"><img src="<g:createLinkTo dir='images/layout' file='img_donate-89x28.png'/>" class = "buttonDropShadow"/></a>
					</div>
				</div>
				<div class="imageText bodyBlue">
					<h2>Stay in Touch</h2>
					<p>Signup for the biweekly eNewsletter to stay informed about the Conservancy.</p>
				</div>
				<div class="imageButton bodyBlue">
				    <g:form name="registerUser" url="[action:'registerUser',controller:'person']">
                        <input type="text" name="email" class="email" placeholder="email address"/>
                        <input type="image" value="Submit" class="subscribeButton" alt="Submit" src="<g:createLinkTo dir='images/layout' file='img_subscribe-112x28.png'/>"/>
					</g:form>
					<p></p>
				</div>
			</div>
			<div class="blockFooter headerBlue">
                <a href="https://www.networkforgood.org/donation/MakeDonation.aspx?ORGID2=860674350" target="_blank">Support us &raquo</a>
            </div>          
		</div>
		<div class="homePageItem marginRight">
			<div class="blockHeader headerGreen">
				<h1>Latest News</h1>
			</div>
			<div class="homePageSubItem bodyGreen">
				<g:each var="newsItem" in="${newsItems}">
					<h2>
						${newsItem.title}
					</h2>
					<p>
						${newsItem.summary}
						<g:link controller="newsItem" action="displayNewsItem" id="${newsItem.id}">Read more &raquo</g:link>
					</p>
				</g:each>
			</div>
			<div class="blockFooter headerGreen">
                <a href="<g:createLink controller='newsItem'/>">See all news &raquo</a>
            </div>          
			
		</div>
		<div class="homePageItem">
			<div class="blockHeader headerYellow">
				<h1>Highlighted Events &amp; Hikes</h1>
			</div>
			<div class="homePageSubItem bodyYellow">
				<g:each var="event" in="${events}">
				    <div class='outerEvent'>
					    <div class='calendarIcon'>
	                        <img src="<g:createLinkTo dir='images/layout' file='calendar-${event.startTime.dayOfMonth}.png'/>">
	                    </div>
	                    <div class='eventShort'>
							<h2>
								${event.title}
							</h2>
							<p>
								<span class="date"> ${event.formattedStartTime()}
								</span>&nbsp;
							</p>
							<p>
								<g:link controller="event" action="displayEvent" id="${event.id}">Learn More &raquo</g:link>
							</p>
						</div>
					</div>
				</g:each>
			</div>
			<div class="blockFooter headerYellow">
                <a href="<g:createLink controller='event'/>">See all events &raquo</a>
            </div>			
		</div>
    </div>
    <g:render template="/widget/updateHtmlWidgetDialog" plugin="simple-cms" />
    <g:render template="/widget/updatePhotoWidget" plugin="simple-cms" />
    <g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
</body>
</html>