<%@ page import="org.mcdowellsonoran.notification.NotificationType" %>
<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='/js' file='maplabel.js'/>"></script>
    <resource:dateChooser/>
    <script type="text/javascript">
        window.appContext = '${request.contextPath}';
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
                open: function(event, ui) {google.maps.event.trigger(northMap, 'resize'); loadPinsNorth(northMap);},
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

		function setPinsNorth(pinJSON, map) {
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
                marker.set("color", color);
                marker.setTitle("Report Issue")
					
				google.maps.event.addListener(marker, 'click', function() {

                    if(marker.color == "888888" || marker.color == "FF0000") {
                        marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|00FF00" );
                        marker.color = "00FF00";
                    } else if (marker.color == "00FF00") {


                        $("#problemDate").datepicker({defaultDate: new Date(), dateFormat: 'yy-mm-dd'});

                        $.ajax({
                            type: "GET",
                            url: appContext + "/notificationType/getAllNotificationTypes"
                        }).done(function(data, textStatus, jqXHR) {
                                    $(data).each(function(i, d) {
                                        $("#problemSelect").append(new Option(d.display, d.code));
                                    });
                                }).fail(function(jqXHR, textStatus, errorThrown) {
                                    console.error("Error")
                                    console.error("Error Thrown: " + errorThrown)
                                    console.error("textStatus: " + textStatus)
                                });

                        var dialog = $("#dialog").dialog({
                            title: "Report Trail Issue",
                            width: 500,
                            height: 550,
                            resizable: false,
                            draggable: false,
                            buttons: {
                                "Save": function () {
                                    $.ajax({
                                        type: "POST",
                                        url: appContext + "/trailReportNotification/validateTrailReport",
                                        data: $("#trailReportForm").serialize()
                                    }).done(function(data, textStatus, jqXHR) {
                                                alert("No Validation Errors!");
                                            }).fail(function(jqXHR, textStatus, errorThrown) {
                                                alert("Validation Errors!");
                                                console.error("Error")
                                                console.error("Error Thrown: " + errorThrown)
                                                console.error("textStatus: " + textStatus)
                                            });
                                    marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|FF0000" );
                                    marker.color = "FF0000";
//                                    dialog.dialog('close');
                                },
                                "Cancel": function () {
                                    dialog.dialog('close');
                                }
                            },
                            closeOnEscape: false,
                            open: function(event, ui) { $(".ui-dialog-titlebar-close").hide();}
                        });
                    }
				});

			});			
		}

		function displaySouthAreaMap(index) {
			$("#map_canvas_south").dialog("open");
			var georssLayer = new google.maps.KmlLayer(southMapURL);
	        georssLayer.setMap(southMap);
			
			$.ajax({type:'GET',
                    url:"<g:createLink controller='trailSection' action='pinsForArea' />",
                    data: {'area': 'south'}, success:function(data,textStatus){setPinsSouth(data);},
                                             error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}

		function displayNorthAreaMap(index) {
			var georssLayer = new google.maps.KmlLayer(northMapURL);
	        georssLayer.setMap(northMap);
			$("#map_canvas_north").dialog("open")			
		}

		function loadPinsNorth(map) {
			$.ajax({type:'GET', url:"<g:createLink controller='trailSection' action='pinsForArea' />",
                    data: {'area': 'north'},
                    success:function(data,textStatus){setPinsNorth(data, map);},
                    error:function(XMLHttpRequest,textStatus,errorThrown){}});
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
        <g:form controller="person" action="saveReport">
            <table id="stewardReportingTable">
                <g:each var="index" in="${1}">
                    <tr>
                        <td>Date <richui:dateChooser name='date' format='MM/dd/yyyy' value='${new Date()}' /></td>
                        <td>Program <g:select name="program" id="program${index}" keys="${programs}" from="${programs*.representation()}" noSelection="${[null: 'Select One...']}" onchange="checkPatrolButtons(${index});" /></td>
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

<div id="dialog" title="Dialog Title" style="display:none">
    <p style="color: #54534a;">
        Please report any trail issues for this trail segment here. Note that all issues
        will not be logged and communicated until the report is saved as a whole.
        These fields can be updated as needed until the report is saved. Clicking
        "Cancel" will reset this trail section to an unpatrolled and clear the form.
    </p>
    <form name="trailReportForm" id="trailReportForm">
        <table style="border: none;">
            <tr>
                <td>Trail Problem Type</td>
                <td><select name="notificationType" id="problemSelect" style="width:18em;"></select></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><textarea name="problemDescription" style="width:18em; height:10em;"></textarea></td>
            </tr>
            <tr>
                <td>Date</td>
                <td><input type="text" name="problemDate" id="problemDate" style="width:18em;" /></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>