<!DOCTYPE html 
      PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head profile="http://www.w3.org/2005/10/profile">
	<g:render template="/layouts/commonHead" />
	<g:layoutHead />
	<ga:trackPageview />
</head>
<body>
<div class="container">
	<g:render template="/layouts/header"/>
	<g:render template="/layouts/navigationBar"/>
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