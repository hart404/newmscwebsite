<html>
    <head>
        <title>Steward Reporting</title>
        <meta name="layout" content="mainLayout">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
        
    </head>
    <body>
     <div id ="stewardreporting">
     <div id="reportHead" style ="padding-top: 20px;">
	<h1>
		Steward Reporting</h1>
</div>
<div id="reportForm">
<p><h3>Report-1</h3></p>
  Date <input id="date1" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program1" name="program" onchange="selectedValue(1);"><option selected="selected" value=""></option><option  value="Patrol Program - Bike">Patrol Program - Bike</option><option  value="Patrol Program - Foot">Patrol Program - Foot</option><option  value="Patrol Program - Horse">Patrol Program - Horse</option><option  value="Steward Education Program">Steward Education Program</option><option  value="Hike Program">Hike Program</option><option  value="Board of Directors">Board of Directors</option><option  value="Research - field/analysis">Research - field/analysis</option><option  value="MSC Challenge">MSC Challenge</option><option  value="Volunteer Support Program">Volunteer Support Program</option><option  value="Tour de Scottsdale">Tour de Scottsdale</option><option  value="Research Program Support">Research Program Support</option><option  value="Core Leadership Team">Core Leadership Team</option><option  value="Construction/Maintenance Program">Construction/Maintenance Program</option><option  value="Office and Web Work">Office and Web Work</option><option  value="Pathfinder Program">Pathfinder Program</option><option  value="Nature Guides Program">Nature Guides Program</option><option  value="Partnership Development Program">Partnership Development Program</option><option  value="Community Relations Program">Community Relations Program</option>
</select>&nbsp;&nbsp; Hours <input id="hours1" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime1" value=""><option  value="50000">5:00am</option><option  value="53000">5:30am</option><option  value="60000">6:00am</option><option  value="63000">6:30am</option><option  value="70000">7:00am</option><option  value="73000">7:30am</option><option  value="80000">8:00am</option><option  value="83000">8:30am</option><option  value="90000">9:00am</option><option  value="93000">9:30am</option><option  value="100000">10:00am</option><option  value="103000">10:30am</option><option  value="110000">11:00am</option><option  value="113000">11:30am</option><option  value="120000">12:00pm</option><option  value="123000">12:30pm</option><option  value="130000">1:00pm</option><option  value="133000">1:30pm</option><option  value="140000">2:00pm</option><option  value="143000">2:30pm</option><option  value="150000">3:00pm</option><option  value="153000">3:30pm</option><option  value="160000">4:00pm</option><option  value="163000">4:30pm</option><option  value="170000">5:00pm</option><option  value="173000">5:30pm</option><option  value="180000">6:00pm</option><option  value="183000">6:30pm</option><option  value="190000">7:00pm</option><option  value="193000">7:30pm</option><option  value="200000">8:00pm</option><option  value="203000">8:30pm</option><option  value="210000">9:00pm</option><option  value="213000">9:30pm</option><option  value="220000">10:00pm</option><option  value="223000">10:30pm</option><option  value="230000">11:00pm</option><option  value="233000">11:30pm</option></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea1" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea1" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-2</h3></p>
	Date <input id="date2" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program2" name="program" onchange="selectedValue(2);"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours2" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime2" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea2" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea2" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-3</h3></p>
	Date <input id="date3" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program3" name="program" onchange="selectedValue(3);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours3" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime3" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea3" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea3" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-4</h3></p>
	Date <input id="date4" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program4" name="program" onchange="selectedValue(4);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours4" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime4" value=""></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea4" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea4" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-5</h3></p>
	Date <input id="date5" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program5" name="program" onchange="selectedValue(5);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours5" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time<select class="cdiui-input cdiui-select" id="starttime5" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea5" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea5" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-6</h3></p>
	Date <input id="date6" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program6" name="program" onchange="selectedValue(6);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours6" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime6" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea6" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea6" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-7</h3></p>
	Date <input id="date7" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program7" name="program" onchange="selectedValue(7);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours7" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime7" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea7" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea7" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-8</h3></p>
	Date <input id="date8" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program8" name="program" onchange="selectedValue(8);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours8" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime8" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea8" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea8" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-9</h3></p>
	Date <input id="date9" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program9" name="program" onchange="selectedValue(9);" ><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours9" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime9" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea9" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea9" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
		<p><h3>Report-10</h3></p>
	Date <input id="date10" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program10" name="program" onchange="selectedValue(10);"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours10" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime10" value=""></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea10" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea10" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
	<p>
		&nbsp;</p>
        <input id="submit" name="Submit" onclick="submitReport();" type="button" value="Submit" />&nbsp;
        <p>
                &nbsp;</p>
</div>
<div id="toPopup" style="display: none;">
	<div class="close">
		&nbsp;</div>
	<span class="ecs_tooltip" style="display: none;">Press Esc to close </span>
	<div id="popup_content" style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden;">
	</div>
	<!--your content end--></div>
<!--toPopup end-->
<div class="loader" style="display: none;">
	&nbsp;</div>
<div id="backGroundPopup" style="opacity: 0.7; display: none;">
	&nbsp;</div>
     </div>
    <g:javascript>
      $(document).ready(function(){
    		//copies all contents of program1 into program*
			for($i=2;$i<=10;$i++)
			{
                          $("#program"+$i).html($("#program1").html());
                          $("#starttime"+$i).html($("#starttime1").html());
			}
		});
    </g:javascript>
    </body>
</html>
