<!DOCTYPE html>
<head>
    <g:render template="/layouts/commonHead" />
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
		<div class="sidebarLinkCurrent">Lost Dog Wash/Sunrise Trail</div>
		</g:if>
		<g:else>
		<div class="sidebarLink"><a href="<g:createLink controller='trailhead' action='lostDog'/>" class="sidebarLinkInner">Lost Dog Wash/Sunrise Trail</a></div>
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