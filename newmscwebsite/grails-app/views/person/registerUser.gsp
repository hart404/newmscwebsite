<html>
<head>
    <meta name="layout" content="mainLayout" />
    <title>Register User</title>
    <script>
		$(document).ready(function() {
			alert("Thank You for subscribing. Your request is being processed.")
		    $('#username').focus();
		});
    </script>
</head>
<body>
<h1 style="">Newsletter</h1>
<g:if test="${flash.message}">
    
     <h1>&nbsp;${flash.message}</h1>
    </g:if>
</body>
</html>