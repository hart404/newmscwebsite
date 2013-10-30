/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//Stores our opened window 

function selectedValue(selectid){
      if($( "select#program"+selectid+" option:selected").val() == "Patrol Program - Bike" || 
              $( "select#program"+selectid+" option:selected").val() == "Patrol Program - Horse" ||
              $( "select#program"+selectid+" option:selected").val() == "Patrol Program - Foot"
            )
       {
         $("#northarea"+selectid).removeAttr("disabled");
         $("#southarea"+selectid).removeAttr("disabled");
       }else{
         $("#northarea"+selectid).attr("disabled", "disabled");
         $("#southarea"+selectid).attr("disabled", "disabled");
       }
 }
 
jQuery(function($) {
        $('select.program option[value=""]').attr("selected",true);
        $(".northarea").attr("disabled", "disabled");
        $(".southarea").attr("disabled", "disabled");
	
	$(".northarea").click(function() {
			loading(); // loading
			setTimeout(function(){ // then show popup, deley in .5 second
				loadPopupNorth(); // function show popup 
			}, 500); // .5 second
//                        reportMapView();
	return false;
	});
        
        $(".southarea").click(function() {
			loading(); // loading
			setTimeout(function(){ // then show popup, deley in .5 second
				loadPopupSouth(); // function show popup 
			}, 500); // .5 second
//                        reportMapView();
	return false;
	});
	
	/* event for close the popup */
	$("div.close").hover(
					function() {
						$('span.ecs_tooltip').show();
					},
					function () {
    					$('span.ecs_tooltip').hide();
  					}
				);
	
	$("div.close").click(function() {
		disablePopup();  // function close pop up
	});
	
	$(this).keyup(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup();  // function close pop up
		}  	
	});
	
	$("div#backGroundPopup").click(function() {
		disablePopup();  // function close pop up
	});
	
//	$('a.livebox').click(function() {
//		alert('Hello World!');
//	return false;
//	});
	

	 /************** start: functions. **************/
	function loading() {
		$("div.loader").show();  
	}
	function closeloading() {
		$("div.loader").fadeOut('normal');  
	}
	
	var popupStatus = 0; // set value
	
	function loadPopupNorth() { 
		if(popupStatus == 0) { // if value is 0, show popup
			closeloading(); // fadeout loading
			$("#toPopup").fadeIn(0500); // fadein popup div
                        initialize(33.756172,-111.84391);
			$("#backGroundPopup").css("opacity", "0.7"); // css opacity, supports IE7, IE8
			$("#backGroundPopup").fadeIn(0001);               
			popupStatus = 1; // and set value to 1
		}	
	}
        
        function loadPopupSouth() { 
		if(popupStatus == 0) { // if value is 0, show popup
			closeloading(); // fadeout loading
			$("#toPopup").fadeIn(0500); // fadein popup div
                        initialize(33.64944,-111.858416);
			$("#backGroundPopup").css("opacity", "0.7"); // css opacity, supports IE7, IE8
			$("#backGroundPopup").fadeIn(0001);               
			popupStatus = 1; // and set value to 1
		}	
	}
		
	function disablePopup() {
		if(popupStatus == 1) { // if value is 1, close popup
			$("#toPopup").fadeOut("normal");  
			$("#backGroundPopup").fadeOut("normal");  
			popupStatus = 0;  // and set value to 0
		}
	}
	/************** end: functions. **************/
}); // jQuery End

/*******************Java Script For View Map***********************/

                    var map;
                    var src = 'https://mcdowellsonoran.org/maps/ReportingPins.kml';
                    var activeWindow;
                   
                    function initialize(x,y)
                      {   
                          map = new google.maps.Map(document.getElementById('popup_content'), {
                          center: new google.maps.LatLng(x,y),
                          zoom: 14,
                          mapTypeId: google.maps.MapTypeId.TERRAIN
                          });
                          loadKmlLayer(src, map);      
                      }
                     
                      function loadKmlLayer(src, map) {                        
                        var kmlLayer = new google.maps.KmlLayer(src, {
                          suppressInfoWindows: true,
                          preserveViewport: true,
                          map: map
                        });
                        google.maps.event.addListener(kmlLayer, 'click', function(event) {
                            showInContentWindow(event.latLng);
                        });                    
                      }
                      
                      function showInContentWindow(position) {                          
                        var content = '<div id="infoMap">'+
                                          '<div>'+
                                          '<div>Trail Segment Problem</div>'+
                                          '<table width="299" style="margin-top: 5px; table-layout: auto;">'+
                                          '<tbody>'+
                                          '<tr>'+
                                          '<td width="169">Trail Problem Type*</td>'+
                                          '<td width="161">'+
                                          '<select id="code" class="cdiui-input">'+
                                          '<option value="">(none)</option>'+
                                          '<option value="Bathrooms">Bathrooms</option>'+
                                          '<option value="Trash Cans">Trash cans</option>'+
                                          '<option value="Irrigation">Irrigation</option>'+
                                          '<option value="Gate Open/Closed">Gate open/closed</option>'+
                                          '<option value="Vegitation">Vegetation</option>'+
                                          '<option value="Signage">Signage</option>'+
                                          '<option value="Erosion">Erosion</option>'+
                                          '<option value="Clogged Drains">Clogged drains</option>'+
                                          '<option value="Trail Obstruction">Trail obstruction</option>'+
                                          '<option value="Trail Signs">Trail signs</option>'+
                                          '<option value="Illegal Parking">Illegal parking</option>'+
                                          '<option value="Vandalism">Vandalism</option>'+
                                          '<option value="Littering">Littering</option>'+
                                          '<option value="Animal at large">Animal at large</option>'+
                                          '<option value="Failure to yield">Failure to yeild</option>'+
                                          '<option value="Unauthorized commercial">Unauth commercial</option>'+
                                          '<option value="Unauthorized vehicle">Unauth vehicle</option>'+
                                          '<option value="Unauthorized off trail">Unauth off-trail</option>'+
                                          '</select>'+
                                          '</td>'+
                                          '</tr>'+
                                          '<tr>'+
                                          '<td>Trail Problem Description*</td>'+
                                          '<td>'+
                                          '<textarea id="comment" class="cdiui-input" rows="3" required></textarea></td>'+
                                          '</tr>'+
                                          '<tr>'+
                                          '</tr>'+
                                          '<tr>'+
                                          '<td colspan="2">'+
                                          '</td>'+
                                          '<tr>'+
                                          '<td colspan="2">'+
                                          '<input id="reportbutton" onclick="reportProblem();" type="button" value="Report Problem" title="save" >'+
                                          '</td>'+
                                          '</tr>'+
                                          '</tr>'+
                                          '</tbody>'+
                                          '</table>'+
                                          '</div>'+
                                          '</div>'+
                                          '</div>';
                        var infowindow = new google.maps.InfoWindow({
                        content: content, 
                        position: position
                       });     
                       //Close active window if exists 
                        if(activeWindow != null)
                           activeWindow.close();
                        //Open new window 
                        infowindow.open(map); 
                         //Store new window in global variable 
                        activeWindow = infowindow;
                    }
                    
