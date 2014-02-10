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
		var pins = null;
		var map = null;
		var mapToDisplay = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/7cfd43c8-85e6-4341-b763-6f1155e43ee85459184511650637164.kmz";
		function initialize() {
			var mapOptions = {
				zoom: 12,
				center: new google.maps.LatLng(33.647900, -111.862236),
				mapTypeId: google.maps.MapTypeId.TERRAIN
		  	}
			map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			var georssLayer = new google.maps.KmlLayer(mapToDisplay);
            georssLayer.setMap(map);
			
			$.ajax({type:'GET', url:"<g:createLink controller='trailSection' action='pinsForArea' />", data: {'area': 'south'}, success:function(data,textStatus){setPins(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}
		
		function setPins(pinJSON) {
			var pins = eval(pinJSON);

			$.each(pins, function(index, pin) {
				var color = pin.color;
				if (color == null) color = '888888';
				var marker = new google.maps.Marker({
				    position: new google.maps.LatLng(pin.latitude, pin.longitude),
				    icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|" + color,
				    map: map,
				    title: pin.pinName
				});
				marker.set("id", pin.id);

				
				google.maps.event.addListener(marker, 'click', function() {
				    marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|00FF00" );
				});
					
			});			
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>	
</head>
<body>
	<div class=map id="map_canvas"></div>
</body>
</html>