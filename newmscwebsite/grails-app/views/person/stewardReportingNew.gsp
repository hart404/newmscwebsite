<%@ page import="newmscwebsite.ProgramReporting; org.mcdowellsonoran.notification.NotificationType" %>
<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
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
        $(document).ready(function(){
            var programs = ${program.reportingPrograms()};
            addReportingTableRow(programs);
        });
    </script>
</head>
<body>
    <h1>Steward Reporting</h1>
    <blockquote>
        <ul class="errors" role="alert" id="volunteerSessionErrors"></ul>
        <table id="stewardReportingTable">
            <tbody></tbody>
        </table>
        <br />
        <button id="reportingTableSubmit" onclick="submitStewardReport();">Submit</button>
    </blockquote>
    <div id="mapCanvasContainer"></div>
    <div id="trailReportingContainer"></div>
</body>
</html>