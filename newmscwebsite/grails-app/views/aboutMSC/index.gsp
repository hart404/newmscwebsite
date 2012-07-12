<html>
<head>
	<meta name="layout" content="mainLayout" />
	<title>About Us</title>
	<resource:timeline /></head>
<body onload="initTimeline();">
	<richui:timeline style="height: 350px; border: 1px solid #aaa; width: 100%;" datasource="${createLink(action: 'history', controller: 'aboutMSC')}" eventBandWidth="85" eventIntervalPixels="100" legendBandWidth="30" legendIntervalPixels="200" eventIntervalUnit="year" startDate="${new Date(91, 0, 1, 0, 0, 0) }" legendIntervalUnit="year" />
</body>
</html>




