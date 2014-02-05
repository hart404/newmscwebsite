
<div class="bottomMenu">
	<ul class="bottomMenuList">
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'content', action: 'handlePage', params: [link: 'termsOfService'])}" class="parent"><span>Terms Of Service</span></a></li>
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'content', action: 'handlePage', params: [link: 'privacyPolicy'])}" class="parent"><span>Privacy Policy</span></a></li>
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'content', action: 'handlePage', params: [link: 'photoCredits'])}" class="parent"><span>Photo Credits</span></a></li>
		<li class="bottomMenuListItem"><a href="${createLink(controller: 'content', action: 'handlePage', params: [link: 'contactUs'])}" class="parent"><span>Contact Us</span></a></li>
		<li class="bottomMenuListItem"><a href="${createLink(controller: 'content', action: 'handlePage', params: [link: 'sitemap'])}" class="parent"><span>Sitemap</span></a></li>
        <li class="bottomMenuListItem"><a href="${createLink(controller: 'person', action: 'stewardReporting') }" class="parent"><span>Steward Reporting</span></a></li>
		<sec:ifNotLoggedIn>
			<li class="bottomMenuListItem"><a href="${createLink(controller: 'login')}" class="parent"><span>Login</span></a></li>
		</sec:ifNotLoggedIn>	
		<sec:ifLoggedIn>
			<li class="bottomMenuListItem"><a href="${createLink(controller: 'logout')}" class="parent"><span>Logout</span></a></li>
			<li class="bottomMenuListItem">Welcome, <sec:loggedInUserInfo field="username" class="bottomMenuListItem"/></li>
		</sec:ifLoggedIn>
		&nbsp;<span class='grayEventText'><g:meta name="app.version"/></span>
	</ul>
</div>
