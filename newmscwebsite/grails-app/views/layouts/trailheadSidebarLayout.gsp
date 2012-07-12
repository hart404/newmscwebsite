<!DOCTYPE html 
      PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head profile="http://www.w3.org/2005/10/profile">
	<title><g:layoutTitle default="McDowell Sonoran Conservancy" /></title>
	<link rel="icon" type="image/png" href="<g:createLinkTo dir='/images/layout' file='img_cactus-16x16.png'/>" />
	<link rel="shortcut icon" href="<g:createLinkTo dir='/images/layout' file='img_cactus-16x16.png'/>" />
	<link rel="stylesheet" href="<g:createLinkTo dir='css' file='mscmain.css' />" />
	<link rel="stylesheet" href="<g:createLinkTo dir='/js/dropdowns/css' file='style.css'/>" type="text/css" media="screen, projection"/>
    <g:javascript library="jquery" plugin="jquery"/>    
    <r:layoutResources/>
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='/js/dropdowns/css' file='ie.css'/>" media="screen" />
	<![endif]-->	
	<script type="text/javascript" src="<g:createLinkTo dir='/js/dropdowns/js' file='jquery.dropdownPlain.js'/>"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='/js/galleria' file='galleria-1.2.6.min.js'/>"></script>
    <script type="text/javascript" src="<g:createLinkTo dir='/js/jquery-ui-1.8.21.custom/js' file='jquery-ui-1.8.21.custom.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='/js/jquery-ui-1.8.21.custom/css/custom-theme' file='jquery-ui-1.8.21.custom.css'/>"/>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=false"></script>
	<g:layoutHead />
	<ga:trackPageview />
</head>
<body>
<div class="container">
	<g:render template="/layouts/header"/>
	<g:render template="/layouts/navigationBar"/>
	<div class="sidebarNavigationNarrow bodyGreen">
		<h1 class="sidebarHeading">Visitor Information</h1>
		<g:if test="${currentView == 'mapOfThePreserve'}">
		<div class="sidebarLinkCurrent">Map of the Preserve</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='mapOfThePreserve'/>" class="sidebarLinkInner">Map of the Preserve</a></div>
		</g:else>
		<g:if test="${currentView == 'brownsRanch'}">
		<div class="sidebarLinkCurrent">Brown's Ranch</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='brownsRanch'/>" class="sidebarLinkInner">Brown's Ranch</a></div>
		</g:else>
		<g:if test="${currentView == 'gateway'}">
		<div class="sidebarLinkCurrent">Gateway</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='gateway'/>" class="sidebarLinkInner">Gateway</a></div>
		</g:else>
		<g:if test="${currentView == 'lostDog'}">
		<div class="sidebarLinkCurrent">Lost Dog Wash/Sunset Trail</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='lostDog'/>" class="sidebarLinkInner">Lost Dog Wash/Sunset Trail</a></div>
		</g:else>
		<g:if test="${currentView == 'tomsThumb'}">
		<div class="sidebarLinkCurrent">Tom's Thumb and East End</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='tomsThumb'/>" class="sidebarLinkInner">Tom's Thumb and East End</a></div>
		</g:else>
	</div>
	<div>
		<g:layoutBody />
		<r:layoutResources disposition="defer"/>
	</div>
	<g:render template="/layouts/footer"/>
</div>
</body>
</html>