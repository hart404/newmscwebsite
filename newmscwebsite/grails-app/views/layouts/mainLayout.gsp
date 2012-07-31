<!DOCTYPE html
	  PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html
      xmlns="http://www.w3.org/1999/xhtml" 
      xml:lang="en-US"
      lang="en-US">
<head profile="http://www.w3.org/2005/10/profile">
    <g:render template="/layouts/commonHead" />
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