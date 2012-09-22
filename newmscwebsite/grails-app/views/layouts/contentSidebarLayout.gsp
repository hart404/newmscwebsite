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
    <div style="overflow: hidden; position: relative;">
		<div class="sidebarNavigation">
			<h1 class="sidebarHeading">${menu.title}</h1>
			<g:each var="menuItem" in="${menu.menuItems}">
				<g:if test="${menuItem.menuIsAllowed()}">
			        <g:if test="${link == menuItem.link}">
					<div class="sidebarLinkCurrent"><p>${menuItem.title}</p></div>
					</g:if>
					<g:else>
					<div class="sidebarLink"><a href="${menuItem.fullLink()}">${menuItem.title}</a></div>
					</g:else>
				</g:if>
			</g:each>
		</div>
		<g:layoutBody />
		<r:layoutResources disposition="defer"/>
	</div>
	<g:render template="/layouts/footer"/>
</div>
</body>
</html>