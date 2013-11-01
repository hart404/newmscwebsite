<html>
<head>
<meta name="layout" content="trailheadSidebarLayout" />
<title>Trailhead</title>
<g:javascript>
        function preserveRegionHover(event, element) {
            var elementId = element.id;
            var image = document.getElementById(elementId + "Star");
            image.style.display = "inline";
        }
        
        function preserveRegionHoverOff(event, element) {
            var elementId = element.id;
            var image = document.getElementById(elementId + "Star");
            image.style.display = "none";
        }
        
        function preserveGoTo(event, element) {
            var elementId = element.id;
            var anchor = document.getElementById(elementId + "a");
            anchor.click();
        }
    </g:javascript>
</head>
<body>
	<div class="trailheadContainer">
		<div class="trailheadMapSurround">
			<h1 class="redEventText">Click an area to explore:</h1>
			<div class="trailheadMap">
				<div style="position: absolute; left: 80px; top: 34px; width: 200px; height: 140px; display: inline;" onmouseover='preserveRegionHover(event, this)'
					; onmouseout='preserveRegionHoverOff(event, this)' ; onclick='preserveGoTo(event, this)' ; id='brownsRanch';>
					<img src="../images/general/img_region-rollover-41x42.png" style="position: absolute; left: 65px; top: 105px; display: none;" id='brownsRanchStar' />
				</div>
				<div style="position: absolute; left: 200px; top: 174px; width: 75px; height: 260px; display: inline;" onmouseover='preserveRegionHover(event, this)'
					; onmouseout='preserveRegionHoverOff(event, this)' ; onclick='preserveGoTo(event, this)' ; id='tomsThumb';>
					<img src="../images/general/img_region-rollover-41x42.png" style="position: absolute; left: 32px; top: 112px; display: none;" id='tomsThumbStar' />
				</div>
				<div style="position: absolute; left: 110px; top: 330px; width: 90px; height: 150px; display: inline;" onmouseover='preserveRegionHover(event, this)'
					; onmouseout='preserveRegionHoverOff(event, this)' ; onclick='preserveGoTo(event, this)' ; id='gateway';>
					<img src="../images/general/img_region-rollover-41x42.png" style="position: absolute; left: 10px; top: 65px; display: none;" id='gatewayStar' />
				</div>
				<div style="position: absolute; left: 200px; top: 434px; width: 130px; height: 110px; display: inline;" onmouseover='preserveRegionHover(event, this)'
					; onmouseout='preserveRegionHoverOff(event, this)' ; onclick='preserveGoTo(event, this)' ; id='lostDog1';>
					<img src="../images/general/img_region-rollover-41x42.png" style="position: absolute; left: 7px; top: 82px; display: none;" id='lostDog1Star' />
				</div>
				<div style="position: absolute; left: 110px; top: 474px; width: 130px; height: 60px; display: inline;" onmouseover='preserveRegionHover(event, this)'
					; onmouseout='preserveRegionHoverOff(event, this)' ; onclick='preserveGoTo(event, this)' ; id='lostDog2';>
					<img src="../images/general/img_region-rollover-41x42.png" style="position: absolute; left: 97px; top: 42px; display: none;" id='lostDog2Star' />
				</div>
			</div>
		</div>
		<div>
			<a href="<g:createLink controller='trailhead' action='brownsRanch'/>" style='display: none' id='brownsRancha'>-</a> <a href="<g:createLink controller='trailhead' action='tomsThumb'/>"
				style='display: none' id='tomsThumba'>-</a> <a href="<g:createLink controller='trailhead' action='gateway'/>" style='display: none' id='gatewaya'>-</a> <a
				href="<g:createLink controller='trailhead' action='lostDog'/>" style='display: none' id='lostDog1a'>-</a> <a href="<g:createLink controller='trailhead' action='lostDog'/>" style='display: none'
				id='lostDog2a'>-</a>
		</div>
		<div class="scmsHtmlContainer trailheadsHtmlWidget">
			<scms:htmlWidget widget="${trailheadsMap}" />
		</div>
	</div>
	<g:render template="/widget/updateHtmlWidgetDialog" plugin="simple-cms" />
</body>
</html>