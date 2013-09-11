<html>
<head>
<meta name="layout" content="trailheadSidebarLayout" />
<title>${location.name}</title>
<meta name="description" content="${location.descriptionMetadata}" />
<meta name="keywords" content="${location.keywordsMetadata}" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}
</style> 
	<script>
		function initialize() {
			var itemLocation = new google.maps.LatLng(${location.coordinates});
			var mapOptions = {
				zoom: 16,
				center: itemLocation,
				mapTypeId: google.maps.MapTypeId.HYBRID
		  	}
			var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            marker = new google.maps.Marker({
                map: map,
                position: itemLocation
            });
            <g:if test="${mapName}">
            var georssLayer = new google.maps.KmlLayer("${mapName}");
            georssLayer.setMap(map);  
            </g:if>                  
 		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	<style type="text/css">
		.hovertip {
			padding: 4px 8px;
			color: rgb(139, 14, 4);
			background-color: rgb(196, 150, 12);
			position: absolute;
			left: 0;
			top: 100%;
			white-space: nowrap;
			z-index: 20px;
			-moz-border-radius: 1px;
			-webkit-border-radius: 1px;
			border-radius: 1px;
			border-color: rgb(149, 111, 0);
			-moz-box-shadow: 0px 0px 4px #222;
			-webkit-box-shadow: 0px 0px 4px #222;
			box-shadow: 0px 0px 4px #222;
		}​	
</style>	  
</head>
<body>
    <script type="text/javascript" src="<g:createLinkTo dir='/js/wz_tooltip' file='wz_tooltip.js'/>"></script>
    <div class="trailheadContainer">
		<div class="mapSurround">
			<div class="trailheadMap">
				<div id="map_canvas"></div>
			</div>
		</div>
		<div class="trailhead">
			<h2 class="redEventText">
				${location.name}
			</h2>
			<p class="bigp grayEventText">
				<span class="redEventText">Description: </span>
				${location.description}
			</p>
			<p class="bigp grayEventText">
				<span class="redEventText">Address: </span>
				${location.address}
			</p>
			<g:if test="${location.internalName != 'tomsThumb'}">
			<p class="bigp grayEventText">
				<span class="redEventText">Location: </span>
				<g:link url="http://maps.google.com/maps?ll=${location.coordinates}" target="_blank">click here</g:link>
			</p>
			</g:if>
			<p>
				<g:each var="amenity" in="${location.amenities}" status="index">
				    <g:set var="cssid" value="${'amenity' + index}"/>
					<a href="#" onmouseover="TagToTip('${cssid}', BGCOLOR, 'rgb(196, 150, 12)', FONTCOLOR, 'rgb(139, 14, 4)', BORDERCOLOR, 'rgb(149, 111, 0)', FONTFACE, 'arial, helvetica, sans-serif')" onmouseout="UnTip()"><img src="<g:createLinkTo dir='/images/amenities' file='${amenity.icon()}'/>" width="32" height="32"/><span id='${cssid}' class='hovertip'>${amenity.title()}</span></a>
				</g:each>
			</p>
			<p>
				<g:each var="activity" in="${location.activities}" status="index">
                    <g:set var="cssid" value="${'activity' + index}"/>
					<a href="#" onmouseover="TagToTip('${cssid}', BGCOLOR, 'rgb(196, 150, 12)', FONTCOLOR, 'rgb(139, 14, 4)', BORDERCOLOR, 'rgb(149, 111, 0)', FONTFACE, 'arial, helvetica, sans-serif')" onmouseout="UnTip()"><img src="<g:createLinkTo dir='/images/activities' file='${activity.icon()}'/>" width="32" height="32"/><span id='${cssid}' class='hovertip'>${activity.title()}</span></a>
				</g:each>
			</p>
			<g:if test="${location.hikes != null && (!location.hikes.isEmpty())}" >
		        <p class="bigp">
	                <span class="redEventText">Hikes: </span><br/>
	                <span class="bigp grayEventText">Click on a link below to see a map of the hike</span>
	                <ul class="hikeList">
		                <g:each var="hike" in="${location.getHikesInOrder()}">
		                    <li><g:link controller='trailhead' action='displayHike' id='${hike.id}'>${hike.name}</g:link></li>
		                </g:each>
	                </ul>
	            </p>
            </g:if>
		</div>
		<div class="sharethistrailhead">
            <span class='st_facebook_hcount' displayText='Facebook'></span>
            <span class='st_twitter_hcount' displayText='Tweet'></span>
            <span class='st_pinterest_hcount' displayText='Pinterest'></span>
            <span class='st_googleplus_hcount' displayText='Google +'></span>
            <span class='st_email_hcount' displayText='Email'></span>
            <span class='st_sharethis_hcount' displayText='ShareThis'></span>
        </div>                  		
	</div>
</body>
</html>