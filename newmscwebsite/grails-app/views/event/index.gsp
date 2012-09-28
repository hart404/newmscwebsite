<html>
<head>
<meta name="layout" content="mainLayout" />
<title>Events</title>
</head>
<body>
	<g:javascript>
		jQuery.ajaxSetup({
			beforeSend: function() {
				var element = $('#calendarSpinner');
				element.css('visibility', 'visible');
			},
			complete: function(){
				var element = $('#calendarSpinner');
				element.css('visibility', 'hidden');
			},
			success: function() {}
		});
	
		// Global variable to hold on to selections
		var currentDateSelections = [];
		var isMouseDown = false;
		var ajaxMode = "afterToday";   // Either "afterToday" or "dateAndCategory"
		
		function calendarDragStart(event, year, monthNumber, day, selectedDate) {
			isMouseDown = true;
			deselectAll();
			if (!event.shiftKey) {
				clearSelections();
			}
			selectedDate.style.backgroundColor = "rgb(255, 151, 54)";
			currentDateSelections.push([year, monthNumber, day, selectedDate]);
			return true;
		}
		
		function calendarDragOver(year, monthNumber, day, selectedDate) {
			if (isMouseDown) {
				deselectAll();
				selectedDate.style.backgroundColor = "rgb(255, 151, 54)";
				currentDateSelections.push([year, monthNumber, day, selectedDate]);
			}
		}
		
		function calendarDragEnd() {
			isMouseDown = false;
			deselectAll();
			getEvents();
			return false;
		}
		
		function getEvents() {
		    ajaxMode = "dateAndCategory";
			var requestedDates = getRequestedDates();
			var requestedCategories = getRequestedCategories();
			jQuery.ajax({type:'POST',data:{'dates': requestedDates, 'categories': requestedCategories, 'offset': 0, 'max': ${max}}, url:"<g:createLink
			controller='event' action='getEventsForDates' />",success:function(data,textStatus){setEvents(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}
		
        function getRequestedDates() {
            var requestedDatesString = '{"dates": [';
            for (var selection in currentDateSelections) {
                requestedDatesString += '{"year":';
                requestedDatesString += currentDateSelections[selection][0];
                requestedDatesString += ', "monthNumber":';
                requestedDatesString += currentDateSelections[selection][1];
                requestedDatesString += ', "day":';
                requestedDatesString += currentDateSelections[selection][2];
                requestedDatesString += '}';
                if (selection != currentDateSelections.length - 1) {
                    requestedDatesString += ',';
                }
            }
            requestedDatesString += ']}';
            return requestedDatesString;
        }
        
		function getRequestedCategories() {
		    var requestedCategories = '';
		    if ($("#family").attr("checked")) {
		        requestedCategories += '"family"';
		    }
		    if ($("#fitness").attr("checked")) {
		        if (requestedCategories.length > 0) requestedCategories += ', ';
                requestedCategories += '"fitness"';
            }
            if ($("#hike").attr("checked")) {
                if (requestedCategories.length > 0) requestedCategories += ', ';
                requestedCategories += '"hike"';
            }
            if ($("#classOrLecture").attr("checked")) {
                if (requestedCategories.length > 0) requestedCategories += ', ';
                requestedCategories += '"classOrLecture"';
            }
            if ($("#specialEvent").attr("checked")) {
                if (requestedCategories.length > 0) requestedCategories += ', ';
                requestedCategories += '"specialEvent"';
            }
            if ($("#volunteerEvent").attr("checked")) {
                if (requestedCategories.length > 0) requestedCategories += ', ';
                requestedCategories += '"volunteerEvent"';
            }
            return '{"categories": [' + requestedCategories + "]}";
		}
		
		function calendarResetToToday() {
		    ajaxMode = "afterToday";
			clearSelections();
			var requestedCategories = getRequestedCategories();
			jQuery.ajax({type:'POST',url:"<g:createLink controller='event'
			action='getEventsAfterToday' />", data: {'categories': requestedCategories, 'offset': 0, 'max': ${max}}, success:function(data,textStatus){setEvents(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}
		
		function findEvents(offset, max) {
		    var requestedDates = getRequestedDates();
            var requestedCategories = getRequestedCategories();
		    if (ajaxMode == "afterToday") {
		        jQuery.ajax({type:'POST',url:"<g:createLink controller='event'
                action='getEventsAfterToday' />", data: {'categories': requestedCategories, 'offset': offset, 'max': max}, success:function(data,textStatus){setEvents(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
            } else {
	            jQuery.ajax({type:'POST',data:{'dates': requestedDates, 'categories': requestedCategories, 'offset': offset, 'max': max}, url:"<g:createLink
	            controller='event' action='getEventsForDates' />",success:function(data,textStatus){setEvents(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});                
            }
		}
		
		function setEvents(data) {
		  $('#eventList').html(data);
		  var height = $('#eventSelection').height();
		  if (height < 791) {
		      $('#eventSelection').height(791);
		  }
		}
		
		function clearSelections() {
			for (var selection in currentDateSelections) {
				currentDateSelections[selection][3].style.backgroundColor = "#F0F0F0";
			}
			currentDateSelections = [];
		}	
		
		function setCheckboxes() {
		    var checkboxes = ["#family", "#fitness", "#hike", "#classOrLecture", "#specialEvent", "#volunteerEvent"];
		    for (index in checkboxes) {
		        $(checkboxes[index]).attr('checked', true);
		    }
		}
		
		function deselectAll() {
			if (window.getSelection) {
				if (window.getSelection().empty) {  // Chrome
					window.getSelection().empty();
				} else if (window.getSelection().removeAllRanges) {  // Firefox
					window.getSelection().removeAllRanges();
  				}
			} else if (document.selection) {  // IE?
  				document.selection.empty();
  			}
		}
	</g:javascript>
	<div class="relativeContainer"  id="eventSelection">
		<div class="eventSelection" >
			<div id="calendar">
				<div id="innerCalendar">
					<g:render template="/event/calendarTemplate"></g:render>
				</div>
			</div>
			<div id="calendarSpinner">
				<img src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>
			</div>
			<div class="actionButton">
				<img src="<g:createLinkTo dir='/images/layout' file='img_todayButton-122x30.png'/>" onClick="calendarResetToToday()" /> 
			</div>
			<div class="homePageSubItem">
				<h2 class="buffText">Event Type</h2>
				<p class="bigp">
					<g:checkBox name="family" value="${true}" onclick='getEvents()' />
					Family
				</p>
				<p class="bigp">
					<g:checkBox name="fitness" value="${true}" onclick='getEvents()' />
					Fitness
				</p>
				<p class="bigp">
					<g:checkBox name="hike" value="${true}" onclick='getEvents()' />
					Hikes
				</p>
				<p class="bigp">
					<g:checkBox name="classOrLecture" value="${true}" onclick='getEvents()' />
					Classes/Lectures
				</p>
				<p class="bigp">
					<g:checkBox name="specialEvent" value="${true}" onclick='getEvents()' />
					Special Events
				</p>
				<p class="bigp">
					<g:checkBox name="volunteerEvent" value="${true}" onclick='getEvents()' />
					Volunteer Events
				</p>
			</div>
		</div>
		<div class="eventContainer">
			<div class="blockHeader">
				<h1 class="redEventText">Events</h1>
			</div>	
			<div class="eventOrNews" id="eventList">
			    <g:render template="/event/eventsTemplate"></g:render>
			</div>
		</div>
	</div>
</body>
</html>