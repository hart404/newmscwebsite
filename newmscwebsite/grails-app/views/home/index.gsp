<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>

<script type="text/javascript" src="https://js.stripe.com/v1/"></script>
<link rel="stylesheet" href="${resource(dir:'css',file:'grid/style.css')}" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js">
	
</script>
<script src="js/galleria/galleria-1.2.6.min.js"></script>
<script src="js/script.js"></script>
<script src="js/donate.js"></script>
</head>

<body>
	<div id="gallery" class="mscGallery"></div>
	<script>
		function loadAdSpace(json) {
			if (typeof console == "undefined"
					|| typeof console.log == "undefined") {
				var console = {
					log : function() {
					}
				};
			}
			var data = eval(json);
			Galleria
					.loadTheme("<g:createLinkTo dir='/js/galleria/themes/classic/' file='galleria.classic.min.js'/>");
			$("#gallery").galleria({
				dataSource : data,
				showInfo : false,
				transition : 'fade',
				transitionSpeed : 1000,
				showImagenav : false,
				autoplay : 5000,
				width : 1194,
				height : 400,
				imageCrop : true
			});
		};
		jQuery
				.ajax({
					type : 'POST',
					url : "<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />",
					success : function(json, textStatus) {
						loadAdSpace(json);
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						console.log(errorThrown)
					}
				});
	</script>

	<div class="homePageItems">
		<div class="homePageItem marginRight">
			<div class="blockHeader headerBlue">
				<h1>Support Us</h1>
			</div>
			<div class="homePageSubItem bodyBlue">
				<div class="imageContainer">
					<scms:photoWidget widget='${donatePhoto}' photoCssClass="innerGlow imageDonate" />
					<div class="imageText">
						<p>
							<scms:htmlWidget widget="${donateText}" />
						</p>
					</div>
					<div class="imageButton">
						<a href="<g:createLink controller='donate' action='mainDonate'/>"><img src="<g:createLinkTo dir='images/layout' file='img_donate-89x28.png'/>" class = "buttonDropShadow"/></a>
					</div>
					<g:if test="${flash.message}">

						<h3 style="color: #F70000;">
							&nbsp;${flash.message}
						</h3>
					</g:if>
				</div>
				<div class="imageText bodyBlue">
					<h2>Stay in Touch</h2>
					<p>Signup for the biweekly eNewsletter to stay informed about the Conservancy.</p>
				</div>
				<div class="imageButton bodyBlue">

					<span style="visibility: hidden;">ffffffuuuuuuuuuddd</span> <input type="image" value="Submit" class="subscribeButton" alt="Submit"
						src="<g:createLinkTo dir='images/layout' file='img_subscribe-112x28.png'/>" />
					<p></p>
					<span style="color: #F70000;">
						${message}
					</span>
				</div>


			</div>
			<div class="blockFooter headerBlue">
				<a href="<g:createLink controller='donate' action='mainDonate'/>" class="supportUs">Support us &raquo</a>
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

	<!-- start of userfull info popup -->

	<div class="" id="myDiv6" style="float: right;">
		<!--span-->
		<div class="span12">
			<!--box-->

			<!--box header  class="blockHeader headerGreen" -->
			<div style="margin-top: -1px; width: 98.5%;" class="blockHeader headerGreen">
				<h1>SUBSCRIPTION</h1>
				<a id="myDivPopupBoxClose6" class="close"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
			</div>

			<div class="bodyGreen" style="background: white;">
				<div class="generalContainer" style="width: 93%; height: 500px;">
					<div class="formContainer" style="width: 93%; height: 488px;">
						<form action="subscribeInfo" name="subscForm" id="subscForm" class="newclass" method="post">
							<div style="">
								<div style="width: 100%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label Style="font-weight: bold;">Subscription Information</label>
								</div>
								<input type="checkbox" name="" style="background:; visibility: hidden;">
							</div>
							<div style="">
								<div style="width: 30%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label>Email Address:</label>
								</div>
								<input type="text" class="" placeholder="email address" name="email_addess" id="email_addess" style="width: 200px;">
							</div>
							<span id="email_addessError" style="color: #F70000; margin-left: 150px;"></span>
							<div style="">
								<div style="width: 30%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label>First Name:</label>
								</div>
								<input type="text" class="" placeholder="first name" name="firstname" id="firstname" style="width: 200px;">
							</div>
							<span id="firstnameError" style="color: #F70000; margin-left: 150px;"></span>
							<div style="">
								<div style="width: 30%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label>Last Name:</label>
								</div>
								<input type="text" class="" placeholder="last name" name="lastname" id="lastname" style="width: 200px;">
							</div>
							<span id="lastnameError" style="color: #F70000; margin-left: 150px;"></span>
							<div style="">
								<div style="width: 30%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label>Company:</label>
								</div>
								<input type="text" class="" placeholder="company name" name="company" id="company" style="width: 200px;">
							</div>
							<span id="companyError" style="color: #F70000; margin-left: 150px;"></span>
							<div style="visibility: hidden;">
								<label>Name:</label> <input type="text" class="" placeholder="email address" style="width: 150px;">
							</div>
							<div style="">
								<div style="width: 30%; background:; float: left; visibility: hidden;">
									<label style="visibility: hidden;">Na</label> <label>Description:</label>
								</div>

								<input type="button" value="SUBSCRIBE" class="saveBtn" onclick="validateForm();">
							</div>
							<div style="visibility: hidden;">
								<div style="width: 30%; background:; float: left;">
									<label style="visibility: hidden;">Na</label> <label>Description:</label>
								</div>
								<input type="text" class="" placeholder="Description">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="blockFooter headerGreen" style="width: 100%; background:;"></div>
		</div>
	</div>
	<!--row-fluid popup end-->
</body>
</html>