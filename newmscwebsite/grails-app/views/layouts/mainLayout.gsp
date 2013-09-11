<!DOCTYPE html>
<html
      xmlns="http://www.w3.org/1999/xhtml" 
      xml:lang="en-US"
      lang="en-US">
<head profile="http://www.w3.org/2005/10/profile">
    <g:render template="/layouts/commonHead" />
    <ga:trackPageview />
</head>
<body onload="${pageProperty(name:'body.onload')}">
<div class="container">
	<g:render template="/layouts/header"/>
	<g:render template="/layouts/navigationBar"/>
	<g:layoutBody />
	<r:layoutResources disposition="defer"/>
	<g:render template="/layouts/footer"/>
</div>
</body>
</html>