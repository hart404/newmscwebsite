<%@ page import="newmscwebsite.ProgramReporting; org.mcdowellsonoran.notification.NotificationType" %>
<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	%{--<script type="text/javascript" src="<g:createLinkTo dir='/js' file='maplabel.js'/>"></script>--}%
    <g:javascript src="stewardReporting.js" />
    <g:javascript src="trailReporting.js" />
    <g:javascript src="notificationType.js" />
    <g:javascript src="volunteersession/volunteerSession.js" />
    <g:javascript src="volunteersession/trailReport.js" />
    <g:javascript src="markerwithlabel.js" />
    <g:javascript src="maplabel.js" />
    <script type="text/javascript">
        window.appContext = '${request.contextPath}';
        var programs = ${program.reportingPrograms()};
        $(document).ready(function(){
            for (var i=0; i < 10; i++) {
                addReportingTableRow(programs);
            }
        });
    </script>
</head>
<body>
    <h1>Reporting Instructions</h1>
    <blockquote>
    	<p class="grayEventText">
1)  Select Date<br/>
2)  Select Program  (Note: When Patrol is selected, area map buttons will be accessible)<br/>
3)  Record your hours<br/>
4)  Click on appropriate area map and the map will appear<br/>
&nbsp;&nbsp;&nbsp;&nbsp;    a)  When the map opens, click on each pin that corresponds with the trail that you hiked.  The pin will turn green after one click. <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        If the trail is in good condition, click on Save.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;    b)  If there is an issue on the trail, click on the green pin a second time and it will turn to red. A "Report Trail Issue" screen pops up.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;    c)  Follow the instructions to complete the form and hit Save.<br/>  </p>
        <ul class="errors" role="alert" id="volunteerSessionErrors"></ul>
        <table id="stewardReportingTable">
            <tbody></tbody>
        </table>
        <br />
        <button class="buttonRight" id="reportingTableSubmit" onclick="submitStewardReport();">Submit</button>
    </blockquote>
    <div id="mapCanvasContainer"></div>
    <div id="trailReportingContainer"></div>
</body>
</html>