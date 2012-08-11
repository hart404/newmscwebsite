<g:set var="emailIcon"><g:createLinkTo dir='images/layout' file="img_at.png"/></g:set>
<g:set var="emailIconOn"><g:createLinkTo dir='images/layout' file="img_email_on-24x24.png"/></g:set>
<g:set var="facebookIcon"><g:createLinkTo dir='images/layout' file="img_facebook.png"/></g:set>
<g:set var="facebookIconOn"><g:createLinkTo dir='images/layout' file="img_facebook_on-24x24.png"/></g:set>
<g:set var="twitterIcon"><g:createLinkTo dir='images/layout' file="img_twitter.png"/></g:set>
<g:set var="twitterIconOn"><g:createLinkTo dir='images/layout' file="img_twitter_on-24x24.png"/></g:set>
<g:set var="rssIcon"><g:createLinkTo dir='images/layout' file="img_rss-feed.png"/></g:set>
<g:set var="rssIconOn"><g:createLinkTo dir='images/layout' file="img_rss_on-24x24.png"/></g:set>
<div class="pageHeader">
	<img class="logo" alt="logo" src="<g:resource dir='images/layout' file='img_msc-logo-white-157x105.png'/>">
	<div class="headerIcons">
        <a href="http://www.facebook.com/pages/McDowell-Sonoran-Conservancy/163961445687?ref=ts" target="_blank"><img src="<g:createLinkTo dir='images/layout' file="img_like.png"/>" alt="Like" /></a> 
		<a href="<g:createLink action='registerForEmail'/>"><img src="${emailIcon}" alt="Email" onmouseover="this.src='${emailIconOn}}'" onmouseout="this.src='${emailIcon}'"/></a> 
		<a href="http://www.facebook.com/pages/McDowell-Sonoran-Conservancy/163961445687?ref=ts" target="_blank"><img src="${facebookIcon}" alt="Facebook"  onmouseover="this.src='${facebookIconOn}'" onmouseout="this.src='${facebookIcon}'"/></a> 
		<a href="http://twitter.com/McDowellSonoran" target="_blank"><img src="${twitterIcon}" alt="Twitter"  onmouseover="this.src='${twitterIconOn}'" onmouseout="this.src='${twitterIcon}'"/></a> 
		<a href="http://mcdowellsonoranconservancy.wordpress.com/" target="_blank"><img src="${rssIcon}" alt="Blogspot"  onmouseover="this.src='${rssIconOn}'" onmouseout="this.src='${rssIcon}'"/></a>
        <div class="searchBar">
            <g:form name="registerUser" url="[action:'search',controller:'home']" class='searchForm'>
                <input type="text" name="searchInput" class="searchInput" placeholder="SEARCH"/>
                <input type="image" value="Submit" class="searchButton" alt="Submit" src="<g:createLinkTo dir='images/layout' file='img_searchButton-27x24.png'/>"/>
            </g:form>
            <p></p>
        </div>
	</div>
	<div class="topMenu">
		<ul class="topMenuList">
			<li class="topMenuListItem"><a href="<g:createLink controller='donate' action='index' />" class="parent"><span>DONATE NOW</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='newsItem' action='index' />" class="parent"><span>NEWS</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='event' action='index' />" class="parent"><span>EVENTS</span></a></li>
		</ul>
	</div>
</div>
