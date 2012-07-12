<html>
<head>
<meta name="layout" content="mainLayout" />
<title>Events</title>
</head>
<body>
	<g:javascript>
		jQuery.ajaxSetup({
			beforeSend: function() {
				var el = $('#calendarSpinner');
				el.css('visibility', 'visible');
			},
			complete: function(){
				var el = $('#calendarSpinner');
				el.css('visibility', 'hidden');
			},
			success: function() {}
		});
	
		// Global variable to hold on to selections
		var currentDateSelections = [];
		var isMouseDown = false;
		
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
			jQuery.ajax({type:'POST',data:{'dates': requestedDatesString}, url:"<g:createLink
			controller='event' action='getEventsForDates' />",success:function(data,textStatus){jQuery('#eventList').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}
		
		function calendarResetToToday() {
			clearSelections();
			jQuery.ajax({type:'POST',url:"<g:createLink controller='event'
			action='getEventsAfterToday' />",success:function(data,textStatus){jQuery('#eventList').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
		}
		
		function clearSelections() {
			for (var selection in currentDateSelections) {
				currentDateSelections[selection][3].style.backgroundColor = "#F0F0F0";
			}
			currentDateSelections = [];
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
	<div class="relativeContainer">
		<div class="eventSelection">
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
					<g:checkBox name="family" value="${true}" />
					Family
				</p>
				<p class="bigp">
					<g:checkBox name="fitness" value="${true}" />
					Fitness
				</p>
				<p class="bigp">
					<g:checkBox name="hikes" value="${true}" />
					Hikes
				</p>
				<p class="bigp">
					<g:checkBox name="classesLectures" value="${true}" />
					Classes/Lectures
				</p>
				<p class="bigp">
					<g:checkBox name="specialEvents" value="${true}" />
					Special Events
				</p>
				<p class="bigp">
					<g:checkBox name="volunteerEvents" value="${true}" />
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