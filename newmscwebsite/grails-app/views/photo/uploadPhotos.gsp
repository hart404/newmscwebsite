<html>
<head>
<title>Photo Upload</title>
<meta name="layout" content="mainLayout" />
<head>
<r:require module="fileuploader" />
</head>
<body>
	<h1>Photo Upload</h1>
	<p>Please select the photos you wish to upload. Please ensure that the photos contain all the necessary meta information (photographers,
		keywords, etc).</p>
	<uploader:uploader id="mscUploader" url="${[controller:'photo', action:'upload']}" buttonText="Upload Photos"/>
</body>
</html>