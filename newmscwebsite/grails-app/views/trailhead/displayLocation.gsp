<html>
<head>
<meta name="layout" content="trailheadSidebarLayout" />
<title>Trailhead</title>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false">
</script>
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
            // var georssLayer = new google.maps.KmlLayer("http://newmscwebsite.cloudfoundry.com/maps/HorseshoeLoop.kml");
            // georssLayer.setMap(map)
 		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>	  
</head>
<body>
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
			<p class="bigp grayEventText">
				<span class="redEventText">Location: </span>
				<g:link url="http://maps.google.com/maps?ll=${location.coordinates}" target="_blank">click here</g:link>
			</p>
			<p>
				<g:each var="amenity" in="${location.amenities}">
					<img src="<g:createLinkTo dir='/images/amenities' file='${amenity.icon()}'/>" width="32" height="32"/>
				</g:each>
			</p>
			<p>
				<g:each var="activity" in="${location.activities}">
					<img src="<g:createLinkTo dir='/images/activities' file='${activity.icon()}'/>" width="32" height="32"/>
				</g:each>
			</p>
			<g:if test="${location.hikes != null && (!location.hikes.isEmpty())}" >
		        <p class="bigp">
	                <span class="redEventText">Hikes: </span>
	                <ul class="hikeList">
		                <g:each var="hike" in="${location.getHikesInOrder()}">
		                    <li><g:link controller='trailhead' action='displayHike' id='${hike.id}'>${hike.name}</g:link></li>
		                </g:each>
	                </ul>
	            </p>
            </g:if>
    		
		</div>
	</div>
</body>
</html>