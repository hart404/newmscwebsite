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
	<link rel="stylesheet" href="<g:createLinkTo dir='css' file='bottomMenu.css' />" />
    <link rel="stylesheet" href="<g:createLinkTo dir='css' file='mscmain.css' />" />
    <script src="<g:createLinkTo dir='/js/jquery' file='jquery-1.7.1.min.js'/>" type="text/javascript"></script>
    <link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'spring-security-ui.css',plugin:'spring-security-ui')}"/>
    <link rel="stylesheet" media="screen" href="<g:createLinkTo file='jquery-ui-1.8.21.custom.css' dir='/js/jquery-ui-1.8.21.custom/css/custom-theme'/>"/>
    <link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'jquery.jgrowl.css',plugin:'spring-security-ui')}"/>
    <link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'jquery.safari-checkbox.css',plugin:'spring-security-ui')}"/>
    <link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'auth.css')}"/>
    <g:layoutHead />
    <ga:trackPageview />
</head>
<body>
<div class="container">
	<img class="logo" alt="logo" src="<g:resource dir='images/layout' file='img_logo_rgb_for-web.png'/>" />
	<g:layoutBody />
	<g:render template="/layouts/footer"/>
</div>
</body>
</html>