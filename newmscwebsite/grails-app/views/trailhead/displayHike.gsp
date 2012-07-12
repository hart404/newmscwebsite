<html>
<head>
<meta name="layout" content="trailheadSidebarLayout" />
<title>Trailhead</title>
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
            $("#map_canvas1").dialog({
                autoOpen:false,
                width: 1000,
                height: 900,
                title: "${hike.name}",
                resizeStop: function(event, ui) {google.maps.event.trigger(map2, 'resize');},
                open: function(event, ui) {google.maps.event.trigger(map2, 'resize');},   
                close: function(event, ui) {georssLayer.setMap(map);},
                show: "blind",
                hide: "blind"
            });  

            $("#showMap").click(function() {           
                $("#map_canvas1").dialog("open");
                georssLayer.setMap(map2);                    
                google.maps.event.trigger(map2, 'resize');
                return false;
            });    
            $("input:submit,input:button, a, button", "#controls").button();  
            var mapOptions = {
                    zoom: 16,
                    mapTypeId: google.maps.MapTypeId.HYBRID
            }
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            var georssLayer = new google.maps.KmlLayer("http://newmscwebsite.cloudfoundry.com/maps/${hike.kmlFileName.encodeAsURL()}");
            georssLayer.setMap(map);                    
            var map2 = new google.maps.Map(document.getElementById("map_canvas1"), mapOptions);
 		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>	  
</head>
<body>
    <div id="map_canvas1" style="display: none"></div>
    <div class="trailheadContainer">
		<div class="mapSurround">
			<div class="hikeMap">
				<div id="map_canvas"></div>
			</div>
			<div id="controls">
                <input type="button" name="showMap" value="Enlarge Map" id="showMap" />
            </div>    
		</div>
		<div class="trailhead">
			<h2 class="redEventText">
				${hike.name}
			</h2>
			<p class="bigp grayEventText">
				<span class="redEventText">Description: </span>
				${hike.description}
			</p>
			<p class="bigp grayEventText">
				<span class="redEventText">Noteworthy Features: </span>
				${hike.noteworthyFeatures}
			</p>
            <p class="bigp grayEventText">
                <span class="redEventText">Roundtrip Distance: </span>
                <g:formatNumber number="${hike.roundTripDistance}" format="#.#" /> miles
            </p>			
            <p class="bigp grayEventText">
                <span class="redEventText">Elevation Gain: </span>
                <g:formatNumber number="${hike.elevationGain}" format="#,##0" /> feet
            </p>
		</div>
	</div>
</body>
</html>