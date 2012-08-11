<html>
<head>
<meta name="layout" content="homeLayout" />
<title>Home</title>
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
				    <div class="innerGlow">
                    </div>
					<div class="imageText">
						<p>The McDowell Sonoran Conservancy is a non-profit conservation organization that engages the community to protect the McDowell Sonoran Preserve.  
						Your support will ensure that the Preserve continues to be a natural open space to visit and enjoy, as well as a permanent sanctuary for wildlife.</p>
					</div>
					<div class="imageButton">
						<img src="<g:createLinkTo dir='images/layout' file='img_donate-89x28.png'/>" class = "buttonDropShadow"/>
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
                Support us &raquo
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
                See all news &raquo
            </div>          
			
		</div>
		<div class="homePageItem">
			<div class="blockHeader headerYellow">
				<h1>Highlighted Events</h1>
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
                See all events &raquo
            </div>			
		</div>
    </div>
</body>
</html>