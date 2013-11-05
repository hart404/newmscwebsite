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
  Date <input id="date1" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program1" name="program" onchange="selectedValue(1);" onclick="addOption_listprogram('program1');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours1" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime1" value="" onclick="addOption_listtime('starttime1');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea1" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea1" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit1" name="Submit" onclick="storeReport(1);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date2" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program2" name="program" onchange="selectedValue(2);" onclick="addOption_listprogram('program2');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours2" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime2" value="" onclick="addOption_listtime('starttime2');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea2" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea2" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit2" name="Submit" onclick="storeReport(2);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date3" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program3" name="program" onchange="selectedValue(3);" onclick="addOption_listprogram('program3');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours3" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime3" value="" onclick="addOption_listtime('starttime3');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea3" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea3" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit3" name="Submit" onclick="storeReport(3);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date4" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program4" name="program" onchange="selectedValue(4);" onclick="addOption_listprogram('program4');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours4" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime4" value="" onclick="addOption_listtime('starttime4');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea4" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea4" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit4" name="Submit" onclick="storeReport(4);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date5" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program5" name="program" onchange="selectedValue(5);" onclick="addOption_listprogram('program5');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours5" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time<select class="cdiui-input cdiui-select" id="starttime5" value="" onclick="addOption_listtime('starttime5');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea5" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea5" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit5" name="Submit" onclick="storeReport(5);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date6" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program6" name="program" onchange="selectedValue(6);" onclick="addOption_listprogram('program6');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours6" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime6" value="" onclick="addOption_listtime('starttime6');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea6" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea6" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit6" name="Submit" onclick="storeReport(6);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date7" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program7" name="program" onchange="selectedValue(7);" onclick="addOption_listprogram('program7');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours7" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime7" value="" onclick="addOption_listtime('starttime7');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea7" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea7" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit7" name="Submit" onclick="storeReport(7);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date8" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program8" name="program" onchange="selectedValue(8);" onclick="addOption_listprogram('program8');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours8" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime8" value="" onclick="addOption_listtime('starttime8');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea8" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea8" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit8" name="Submit" onclick="storeReport(8);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date9" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program9" name="program" onchange="selectedValue(9);" onclick="addOption_listprogram('program9');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours9" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime9" value="" onclick="addOption_listtime('starttime9');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea9" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea9" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit9" name="Submit" onclick="storeReport(9);" type="button" value="Submit" />&nbsp;
	<p>
		&nbsp;</p>
	Date <input id="date10" name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <select class="program" id="program10" name="program" onchange="selectedValue(10);" onclick="addOption_listprogram('program10');"><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours10" name="hours" type="number" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime10" value="" onclick="addOption_listtime('starttime10');"></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea10" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea10" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;<input id="submit10" name="Submit" onclick="storeReport(10);" type="button" value="Submit" />&nbsp;
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
    </body>
</html>
