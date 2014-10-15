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
4)  Click on appropriate area map and the map will appear<br/></p>
    	<p class="grayEventText">Please note, if the trail is in good condition <em>DO NOT</em> file a report.</p>
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