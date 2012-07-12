<html>
<head>
<meta name="layout" content="homeLayout" />
<title>Home</title>
</head>
<body>
	<div id="gallery" class="mscGallery">
		<img src="<g:createLinkTo dir='images/adspace' file='img_challenge.png'/>" longdesc="<g:createLink controller='event' action='challenge'/>">
		<img src="<g:createLinkTo dir='images/adspace' file='img_poppies.png'/>" longdesc="<g:createLink controller='event' action='wildflowers'/>">
		<img src="<g:createLinkTo dir='images/adspace' file='img_tomsthumb.png'/>" longdesc="<g:createLink controller='donate' action='index'/>">
	</div>
	<script>
		Galleria.loadTheme("<g:createLinkTo dir='/js/galleria/themes/classic/' file='galleria.classic.min.js'/>");
		$("#gallery").galleria({
			showInfo: false,
			transition: 'fade',
			transitionSpeed: 1000,
			showImagenav: false,
			autoplay: 5000,
			width: 1194,
			height: 400,
			imageCrop: true
		});
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight">
			<div class="blockHeader headerBlue">
				<h1>Support Us</h1>
			</div>
			<div class="bodyBlue withHeight">
				<img class="imageLeft" src="<g:createLinkTo dir='images/general' file='img_black-throated-sparrow-150x150.png'/>" />
				<div class="relativeContainerRight">
					<div class="imageText">
						<p>Aenean elit justo, sagittis quis convallis et, congue quis tortor. Duis varius interdum ultricies.</p>
					</div>
					<div class="imageButton">
						<img src="<g:createLinkTo dir='images/layout' file='img_actionbutton-donateNow-164x30.png'/>" />
					</div>
				</div>
				<div class="imageText bodyBlue">
					<h2>Stay in Touch</h2>
					<p>Signup for the biweekly eNewsletter to stay informed about the MSC.</p>
				</div>
				<div class="imageButton bodyBlue">
					<img src="<g:createLinkTo dir='images/layout' file='img_actionbutton-signupNow-164x30.png'/>" />
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
					<h2>
						${event.title}
					</h2>
					<p>
						<span class="date"> ${event.formattedStartTime()}
						</span>&nbsp;
						<g:link controller="event" action="displayEvent" id="${event.id}">Learn More &raquo</g:link>
					</p>
				</g:each>
			</div>
			<div class="blockFooter headerYellow">
                See all events &raquo
            </div>			
		</div>
    </div>
</body>
</html>