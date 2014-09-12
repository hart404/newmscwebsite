<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Location</title>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/styledmarker/src/StyledMarker.js"></script>
	<script type="text/javascript" src="http://mcdowellsonoran.org/js/jquery/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="http://mcdowellsonoran.org/js/jquery-ui-1.8.21.custom/js/jquery-ui-1.8.21.custom.min.js"></script> 
	<script type="text/javascript" src="http://mcdowellsonoran.org/js/jquery-ui-1.8.21.custom/js/dialog-patch.js"></script>
	<script type="text/javascript" src="http://mcdowellsonoran.org/js/markerwithlabel.js"></script>
	
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
		var southMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/7cfd43c8-85e6-4341-b763-6f1155e43ee85459184511650637164.kmz";
		var northMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/84b6660a-7de1-407e-bccf-ebc16b3a2c711460419313501223830.kmz";
		
		var pins = null;
		var map = null;
		function initialize() {
			var mapOptions = {
				zoom: 17,
				center: new google.maps.LatLng(${latitude}, ${longitude}),
				mapTypeId: google.maps.MapTypeId.TERRAIN
		  	}
			map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			setPins();
			
		}
		
		function setPins() {
			
			var marker = new MarkerWithLabel({
			    position: new google.maps.LatLng(${latitude}, ${longitude}),
			    icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FF0000",
			    map: map,
			    labelContent: '${pinName}'
			});
			marker.set("id", 1);
			
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>	
</head>
<body>
	<div class=map id="map_canvas"></div>
</body>
</html>