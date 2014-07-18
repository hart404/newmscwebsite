<%@ page import="org.mcdowellsonoran.notification.NotificationType" %>
<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='/js' file='maplabel.js'/>"></script>
    <g:javascript src="stewardReporting.js" />
    <g:javascript src="trailReporting.js" />
    <g:javascript src="notificationType.js" />
    <script type="text/javascript">
        window.appContext = '${request.contextPath}';
        $(document).ready(addReportingTableRow);
    </script>
</head>
<body>
    <h1>Steward Reporting</h1>
    <blockquote>
        <table id="stewardReportingTable">
            <tbody></tbody>
        </table>
        <br />
        <button id="reportingTableSubmit">Submit</button> <button onclick="addReportingTableRow();">Add Another..</button>
    </blockquote>
    %{--<div id="mapCanvas" style="width: 1px; height: 1px;"></div>--}%
    <div id="mapCanvasContainer"></div>
    <div id="trailReportingContainer"></div>
</body>
</html>