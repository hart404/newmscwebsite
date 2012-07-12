<!DOCTYPE html 
      PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html
      xmlns="http://www.w3.org/1999/xhtml" 
      xml:lang="en-US"
      lang="en-US">
<head profile="http://www.w3.org/2005/10/profile">
	<title><g:layoutTitle default="McDowell Sonoran Conservancy" /></title>
	<link rel="icon" type="image/png" href="<g:createLinkTo dir='/images/layout' file='img_cactus-16x16.png'/>"/>
	<link rel="shortcut icon" href="<g:createLinkTo dir='/images/layout' file='img_cactus-16x16.png'/>"></link>
	<link rel="stylesheet" href="<g:createLinkTo dir='css' file='mscmain.css' />" />
	<link rel="stylesheet" href="<g:createLinkTo dir='/js/dropdowns/css' file='style.css'/>" type="text/css" media="screen, projection"/>
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='/js/dropdowns/css' file='ie.css'/>" media="screen" />
	<![endif]-->
	<g:javascript library="jquery" plugin="jquery"/>	
	<r:layoutResources />
	<script type="text/javascript" src="<g:createLinkTo dir='/js/dropdowns/js' file='jquery.dropdownPlain.js'/>"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='/js/galleria' file='galleria-1.2.6.min.js'/>"></script>
	<g:layoutHead />
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