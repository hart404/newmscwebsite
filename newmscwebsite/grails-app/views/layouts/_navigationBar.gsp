<div class="menuContainer">
	<div class="menu">
		<ul class="dropdown">
			<li><a href="<g:createLink controller='home' action='index' />"><span>Home</span></a></li>
			<li><a
				href="<g:createLink controller='visitorInformation' action='index' />"><span>Visitor
						Information</span></a>
					<div style='position: relative;'>
					<ul class="sub_menu">
						<li><a href="#"><span>Plan Your Visit</span></a>
							<ul class="sub_menu">
								<li><a href="#"><span>Pathfinders</span></a></li>
								<li><a href="#"><span>Nature Guides</span></a></li>
								<li><a href="#"><span>Family Passport</span></a></li>
								<li><a href="#"><span>Know Before You Go</span></a></li>
							</ul>
						</li>
						<li><a href="<g:createLink controller='trailhead' action='mapOfThePreserve'/>"><span>Trailheads &amp; Directions</span></a></li>
						<li><a href="#"><span>Recreation</span></a></li>
						<li><a href="#"><span>Photo Gallery</span></a></li>
					</ul>
					</div>
			</li>
			<li><a
				href="<g:createLink controller='aboutMSC' action='index' />"><span>About
						Us</span></a></li>
			<li><a
				href="<g:createLink controller='educationAndResearch' action='index' />"><span>Education
						&amp; Research</span></a>
                    <div style='position: relative;'>
					<ul class="sub_menu">
						<li><a href="#" class="parent"><span>Birds</span></a></li>
						<li><a href="#" class="parent"><span>Small Mammals</span></a></li>
						<li><a href="#" class="parent"><span>Large Mammals</span></a></li>
						<li><a href="#" class="parent"><span>Flora</span></a></li>
					</ul>
					</div>
			</li>
			<li><a
				href="<g:createLink controller='volunteer' action='index' />"
				class="parent"><span>Volunteer</span></a></li>
			<li><a
				href="<g:createLink controller='supportUs' action='index' />"
				class="parent"><span>Support Us</span></a>
			</li>
			<sec:ifAnyGranted roles="ROLE_ADMIN" >
			 <li><a href="#"><span>Admin</span></a>
			     <div style='position: relative;'>
                    <ul class="sub_menu">
                        <li><a href="<g:createLink controller='person' action='list'/>"><span>Manage Users</span></a>
                        </li>
                        <li><a href="<g:createLink controller='photo' action='list'/>"><span>Photos</span></a>
                            <ul class="sub_menu">
                                <li><a href="<g:createLink controller='photo' action='list'/>"><span>Manage Photos</span></a></li>
                                <li><a href="<g:createLink controller='photo' action='uploadPhotos'/>"><span>Upload Photos</span></a></li>
                                <li><a href="<g:createLink controller='photo' action='deleteAllPhotos'/>"><span>Delete All Photos</span></a></li>
                           </ul>
                        </li>
                        <li><a href="<g:createLink controller='event' action='list'/>"><span>Manage Events</span></a>
                        </li>
                        <li><a href="<g:createLink controller='adSpacePhoto' action='list'/>"><span>Manage Ad Space</span></a></li>
                        <li><a href="<g:createLink uri='/searchable'/>"><span>Search</span></a></li>
                    </ul>
                 </div>
			 </li>
			</sec:ifAnyGranted>
		</ul>
	</div>
</div>