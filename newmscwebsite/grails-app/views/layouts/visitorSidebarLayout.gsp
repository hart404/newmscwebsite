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
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='/js/dropdowns/css' file='ie.css'/>" media="screen" />
	<![endif]-->	
	<g:javascript library="jquery" plugin="jquery"/>	
	<r:layoutResources/>
	<script type="text/javascript" src="<g:createLinkTo dir='/js/dropdowns/js' file='jquery.dropdownPlain.js'/>"/>
	<script type="text/javascript" src="<g:createLinkTo dir='/js/galleria' file='galleria-1.2.6.min.js'/>"/>
	<script type="text/javascript" src="<g:createLinkTo dir='js/breadcrumbs/js' file='jquery.easing.js'/>"></script>
	<script type="text/javascript" src="<g:createLinkTo dir='js/breadcrumbs/js' file='jquery.jBreadCrumb.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='js/breadcrumbs/css' file='BreadCrumb.css'/>" media="screen"/>
	<gui:resources components="['richEditor','dialog', 'toolTip', 'datePicker']"/>
	<g:layoutHead />
	<ga:trackPageview />
</head>
<body>
<div class="container">
	<g:render template="/layouts/header"/>
	<g:render template="/layouts/navigationBar"/>
	<div>
		<crumbs:trail/>
	</div>
	<div class="sidebarNavigation">
		<h1 class="sidebarHeading">Visitor Information</h1>
		<g:if test="${currentView == 'planYourVisit'}">
		<div class="sidebarLinkCurrent"><p>Plan Your Visit</p></div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='visitorInformation' action='index'/>">Plan Your Visit</a></div>
		</g:else>
		<g:if test="${currentView == 'knowBeforeYouGo'}">
		<div class="sidebarLinkCurrent"><p>Know Before You Go</p></div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='visitorInformation' action='knowBeforeYouGo'/>">Know Before You Go</a></div>
		</g:else>
		<g:if test="${currentView == 'faqs'}">
		<div class="sidebarLinkCurrent"><p>Frequently Asked Questions</p></div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='visitorInformation' action='faqs'/>">Frequently Asked Questions</a></div>
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