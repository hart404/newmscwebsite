
<div class="bottomMenu">
	<ul class="bottomMenuList">
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'home', action: 'termsOfService')}" class="parent"><span>Terms Of Service</span></a></li>
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'home', action: 'privacyPolicy')}" class="parent"><span>Privacy Policy</span></a></li>
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'home', action: 'photoCredits')}" class="parent"><span>Photo Credits</span></a></li>
		<li class="bottomMenuListItem"><a href="${createLink(controller: 'home', action: 'contactUs')}" class="parent"><span>Contact Us</span></a></li>
		<li class="bottomMenuListItem"><a href="${createLink(controller: 'home', action: 'sitemap')}" class="parent"><span>Sitemap</span></a></li>
		<sec:ifNotLoggedIn>
			<li class="bottomMenuListItem"><a href="${createLink(controller: 'login')}" class="parent"><span>Steward Login</span></a></li>
		</sec:ifNotLoggedIn>	
		<sec:ifLoggedIn>
			<li class="bottomMenuListItem"><a href="${createLink(controller: 'logout')}" class="parent"><span>Logout</span></a></li>
			Welcome, <sec:loggedInUserInfo field="username" class="bottomMenuListItem"/>
		</sec:ifLoggedIn>	
	</ul>
</div>
