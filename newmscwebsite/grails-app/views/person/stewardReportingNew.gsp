<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='/js' file='maplabel.js'/>""></script>
    <resource:dateChooser/>
    <script type="text/javascript">
    	function checkPatrolButtons(index) {
        	var programValue = $("#program" + index).val();
        	if (programValue.substring(0,7) == 'PATROL_') {
            	enablePatrolButtons(index);
            } else {
                disablePatrolButtons(index);
            }
        }

		var pins = null;
		var southMap = null;
		var northMap = null;
		var southMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/7cfd43c8-85e6-4341-b763-6f1155e43ee85459184511650637164.kmz";
		var northMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/84b6660a-7de1-407e-bccf-ebc16b3a2c711460419313501223830.kmz";

        function initialize() {
			var mapOptions = {
				zoom: 12,
				center: new google.maps.LatLng(33.647900, -111.862236),
				mapTypeId: google.maps.MapTypeId.TERRAIN
		  	}
			southMap = new google.maps.Map(document.getElementById("map_canvas_south"), mapOptions);
			northMap = new google.maps.Map(document.getElementById("map_canvas_north"), mapOptions);
			            
            $("#map_canvas_south").dialog({
                autoOpen:false,
                width: 1000,
                height: 900,
                title: "South Area Reporting",
                resizeStop: function(event, ui) {google.maps.event.trigger(southMap, 'resize');},
                open: function(event, ui) {google.maps.event.trigger(southMap, 'resize');},   
                show: "blind",
                hide: "blind"
            });  

            $("#map_canvas_north").dialog({
                autoOpen:false,
                width: 1000,
                height: 900,
                title: "North Area Reporting",
                resizeStop: function(event, ui) {},
                open: function(event, ui) {google.maps.event.trigger(northMap, 'resize'); loadPinsNorth();},   
                show: "blind",
                hide: "blind"
            });  
        }
		
		function setPinsSouth(pinJSON) {
			var pins = eval(pinJSON);

			$.each(pins, function(index, pin) {
				var color = pin.color;
				if (color == null) color = '888888';
				var latLong = new google.maps.LatLng(pin.latitude, pin.longitude);
				var anchorPoint = new google.maps.Point(pin.anchorX, pin.anchorY);
				var marker = new google.maps.Marker({
				    position: latLong,
				    icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|" + color,
				    map: southMap,
				    title: pin.pinName
				});
				marker.set("id", pin.id);
			
				google.maps.event.addListener(marker, 'click', function() {
				    marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|00FF00" );
				});
					
			});			
		}

		function setPinsNorth(pinJSON) {
			var pins = eval(pinJSON);

			$.each(pins, function(index, pin) {
				var color = pin.color;
				if (color == null) color = '888888';
				var latLong = new google.maps.LatLng(pin.latitude, pin.longitude);
				var anchorPoint = new google.maps.Point(pin.anchorX, pin.anchorY);

				var marker = new google.maps.Marker({
				    map: northMap,
				    position: latLong,
				    icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|" + color,
				    title: pin.pinName
				});
				marker.set("id", pin.id);
					
				google.maps.event.addListener(marker, 'click', function() {
				    marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|00FF00" );
				});

			});			
		}

		function displaySouthAreaMap(index) {
			$("#map_canvas_south").dialog("open");
			var georssLayer = new google.maps.KmlLayer(southMapURL);
	        georssLayer.setMap(southMap);
			
			$.ajax({type:'GET', url:"<g:createLink controller='trailSection' action='pinsForArea' />", data: {'area': 'south'}, success:function(data,textStatus){setPinsSouth(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});				
		}

		function displayNorthAreaMap(index) {
			var georssLayer = new google.maps.KmlLayer(northMapURL);
	        georssLayer.setMap(northMap);
			$("#map_canvas_north").dialog("open")			
		}

		function loadPinsNorth() {
			$.ajax({type:'GET', url:"<g:createLink controller='trailSection' action='pinsForArea' />", data: {'area': 'north'}, success:function(data,textStatus){setPinsNorth(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});				
		}

		function enablePatrolButtons(index) {
			$('#southarea' + index).attr('disabled', false);
			$('#northarea' + index).attr('disabled', false);
		}
		        
		function disablePatrolButtons(index) {
			$('#southarea' + index).attr('disabled', true);
			$('#northarea' + index).attr('disabled', true);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
		        
    </script>
</head>
<body>
    <h1>Steward Reporting</h1>
    <blockquote>
        <g:form>
            <table id="stewardReportingTable">
                <g:each var="index" in="${1..10}">
                    <tr>
                        <td>Date <richui:dateChooser name='reportingDate${index}' format='MM/dd/yyyy' value='${new Date()}' /></td>
                        <td>Program <g:select name="program" id="program${index}" keys="${programs}" from="${programs*.representation()}" noSelection="${[null: 'Select One...']}" onchange="checkPatrolButtons(${index});"></g:select></td>
                        <td>Hours <input id="hours" name="hours" type="number" min="0" value="0" step="0.5"/></td>
                        <td><input class="southarea" disabled="disabled" id="southarea${index}" name="southarea" type="button" value="South Area" onClick="displaySouthAreaMap(${index});"/></td>
                        <td><input class="northarea" disabled="disabled" id="northarea${index}" name="northarea" type="button" value="North Area" onClick="displayNorthAreaMap(${index});"/></td>
                    </tr>
                </g:each>
            </table>
            <br />
            <g:submitButton name="submit" value="Submit" />
        </g:form>
    </blockquote>
    <div id="map_canvas_south" style="width: 1px; height: 1px;"></div>
    <div id="map_canvas_north" style="width: 1px; height: 1px;"></div>
</body>
</html>