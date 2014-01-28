<link rel="stylesheet" href="${resource(dir:'css',file:'calender.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'header.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'homeindex.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'mapPopUp.css')}" />

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA06rHmQZkZE4U8ReKgerDPJvPSoczh8j0&sensor=true"></script>
<g:javascript src="reportmap.js" />
<g:javascript src="donate.js" />
<g:javascript src="homeindex.js" />
<g:javascript src="calender.js" />
<g:javascript src="header.js" />

<g:javascript>
  var donate_url="${createLink(controller:'home', action:'saveFullinfoData')}"
  var ajax_url="${createLink(controller:'home', action:'storeReport')}"
  var contact_url="${createLink(controller:'person', action:'registerUser')}"
  var nameemail_url="${createLink(controller:'home', action:'saveNameEmail')}"
  var nodata_url="${createLink(controller:'home', action:'saveNonData')}"
</g:javascript>
<script>
	var reported = false;

	function storeReport(id) {
		var date = document.getElementById('date' + id).value;
		var program = document.getElementById('program' + id).value;
		var hours = document.getElementById('hours' + id).value;

		var dataString = 'date=' + date + '&hours=' + hours + '&program='
				+ program;
		$.ajax({
			type : "GET",
			url : ajax_url,
			data : dataString,
			cache : false,
			success : function(text) {
				// location.reload();
				document.getElementById('date' + id).value = "";
				document.getElementById('program' + id).value = "";
				document.getElementById('hours' + id).value = "";
				$("#northarea" + id).attr("disabled", "disabled");
				$("#southarea" + id).attr("disabled", "disabled");
			}

		}).fail(function() {
			alert("Sorry, there was an error. Please try again");
		});
	}

	function submitReport() {
		for ( var i = 1; i <= 10; i++) {
			var date = document.getElementById('date' + i).value;
			var program = document.getElementById('program' + i).value;
			var hours = document.getElementById('hours' + i).value;

			if (date && program && hours) {
				storeReport(i);
				reported = true;
				if (i == 10 && reported == true) {
					alert("Your have successfully submitted " + i + " reports");
					reported = false;
				}
			} else {
				if (reported == true) {
					alert("Your have successfully submitted " + (i - 1) + " report(s)");
					reported = false;
				} else {
					alert("Please your reports......");
				}
				break;
			}

		}
	}

	function submitReportProblem() {
		for ( var i = 1; i <= 10; i++) {
			var date = document.getElementById('date' + i).value;
			var program = document.getElementById('program' + i).value;
			var hours = document.getElementById('hours' + i).value;
			var code = document.getElementById('code').value;
			var comment = document.getElementById('comment').value;

			if (date && program && hours && code && comment) {
				reportProblem(i);
				break;
			}

			if (i == 10) {
				alert("Please enter the values into all the fields of your report");
			}
		}
	}
</script>

<g:javascript>
  var report_url="${createLink(controller:'home', action:'saveReportProblem')}"
</g:javascript>
<script>
	function reportProblem(id) {
		var date = document.getElementById('date' + id).value;
		var program = document.getElementById('program' + id).value;
		var hours = document.getElementById('hours' + id).value;
		var code = document.getElementById('code').value;
		var comment = document.getElementById('comment').value;
		var dataString = 'code=' + code + '&comments=' + comment + '&name='
				+ marker_name + '&latitude=' + latitude + '&longitude='
				+ longitude + '&date=' + date
				+ '&program=' + program + '&hours=' + hours;
		$.ajax({
			type : "GET",
			url : report_url,
			data : dataString,
			cache : false,
			success : function(text) {
				// location.reload();
				document.getElementById('code').value = "";
				document.getElementById('comment').value = "";
				document.getElementById('date' + id).value = "";
				document.getElementById('program' + id).value = "";
				document.getElementById('hours' + id).value = "";
				alert("Your entry has been added");
				location.reload();
			}

		}).fail(function() {
			alert("Sorry, there was an error. Please try again");
		});

	}
</script>

<g:set var="emailIcon">
	<g:createLinkTo dir='images/layout' file="img_at.png" />
</g:set>
<g:set var="emailIconOn">
	<g:createLinkTo dir='images/layout' file="img_email_on-24x24.png" />
</g:set>
<g:set var="facebookIcon">
	<g:createLinkTo dir='images/layout' file="img_facebook.png" />
</g:set>
<g:set var="facebookIconOn">
	<g:createLinkTo dir='images/layout' file="img_facebook_on-24x24.png" />
</g:set>
<g:set var="twitterIcon">
	<g:createLinkTo dir='images/layout' file="img_twitter.png" />
</g:set>
<g:set var="twitterIconOn">
	<g:createLinkTo dir='images/layout' file="img_twitter_on-24x24.png" />
</g:set>
<g:set var="rssIcon">
	<g:createLinkTo dir='images/layout' file="img_rss-feed.png" />
</g:set>
<g:set var="rssIconOn">
	<g:createLinkTo dir='images/layout' file="img_rss_on-24x24.png" />
</g:set>
<div class="pageHeader">
	<img class="logo" alt="logo" src="<g:resource dir='images/layout' file='img_msc-logo-white-157x105.png'/>">
	<div class="headerIcons">
		<a href="http://www.facebook.com/pages/McDowell-Sonoran-Conservancy/163961445687?ref=ts" target="_blank"><img src="<g:createLinkTo dir='images/layout' file="img_like.png"/>" alt="Like" /></a> <a
			href="<g:createLink controller="person" action='registerUser'/>"><img src="${emailIcon}" alt="Email" onmouseover="this.src='${emailIconOn}}'" onmouseout="this.src='${emailIcon}'" /></a> <a
			href="http://www.facebook.com/pages/McDowell-Sonoran-Conservancy/163961445687?ref=ts" target="_blank"><img src="${facebookIcon}" alt="Facebook" onmouseover="this.src='${facebookIconOn}'"
			onmouseout="this.src='${facebookIcon}'" /></a> <a href="http://twitter.com/McDowellSonoran" target="_blank"><img src="${twitterIcon}" alt="Twitter" onmouseover="this.src='${twitterIconOn}'"
			onmouseout="this.src='${twitterIcon}'" /></a> <a href="http://mcdowellsonoranconservancy.wordpress.com/" target="_blank"><img src="${rssIcon}" alt="Blogspot" onmouseover="this.src='${rssIconOn}'"
			onmouseout="this.src='${rssIcon}'" /></a>
		<div class="searchBar">
			<g:form name="searchSite" url="[action:'search',controller:'home']" class='searchForm'>
				<input type="text" name="searchInput" class="searchInput" placeholder="SEARCH" />
				<input type="image" value="Submit" class="searchButton" alt="Submit" src="<g:createLinkTo dir='images/layout' file='img_searchButton-27x24.png'/>" />
			</g:form>
			<p></p>
		</div>
	</div>
	<div class="topMenu">
		<ul class="topMenuList">
			<li class="topMenuListItem"><a href="<g:createLink controller='donate' action='mainDonate' />" class="parent"><span>DONATE NOW</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='newsItem' action='index' />" class="parent"><span>NEWS</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='event' action='index' />" class="parent"><span>EVENTS</span></a></li>
		</ul>
	</div>
</div>






<!-- start of userfull info popup -->

<div class="" id="myDiv2" style="float: right;">
	<!--span-->
	<div class="span12">

		<div style="margin-top: -1px; width: 98.5%;" class="blockHeader headerGreen">
			<h1>BILLING INFORMATION</h1>
			<a id="myDivPopupBoxClose2" onclick="unloadPopupBox2();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
		</div>

		<div class="bodyGreen" style="background: white;">



			<div class="generalContainer" style="width: 93%; height: 500px;">

				<div class="formContainer" style="width: 93%; height: 488px;" id="scroll">

					<g:form controller="donate" action="donateInfo" name="cardInfoForm" class="newclass">

						<div style="">
							<div style="width: 100%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label Style="font-weight: bold;">Billing Information</label>
							</div>

							<input type="checkbox" name="vehicle" value="Bike" style="background:; visibility: hidden;">


						</div>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>First Name:</label>
							</div>
							<input type="text" class="" placeholder="first name" name="fname" id="fname" style="width: 200px;">
						</div>
						<span id="firstNameError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Last Name:</label>
							</div>
							<input type="text" class="" placeholder="last name" name="lname" id="lname" style="width: 200px;">
						</div>
						<span id="lastNameError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">

							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Email:</label>
							</div>
							<input type="text" class="" placeholder="email address" name="email" id="email" style="width: 200px;">
						</div>
						<span id="emailError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="background:;">

							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Phone:</label>
							</div>

							<input type="text" class="" placeholder="phone number" name="phone" id="phone" style="width: 200px;">
						</div>
						<span id="phoneError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Address:</label>
							</div>
							<input type="text" class="" placeholder="address" name="address" id="address" style="width: 200px;">
						</div>
						<span id="addressError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>City:</label>
							</div>
							<input type="text" class="" placeholder="city" name="city" id="city" style="width: 200px;">
						</div>
						<span id="cityError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>State:</label>
							</div>
							<input type="text" class="" placeholder="state" name="state" id="state" style="width: 200px;">
						</div>
						<span id="stateError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Country:</label>
							</div>


							<select name="country" id="country" style="width: 200px;">
								<option value="United States">United States</option>
								<option value="Canada">Canada</option>
							</select>
						</div>
						<span id="countryError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Zip:</label>
							</div>
							<input type="text" class="" placeholder="zip" name="zip" id="zip" style="width: 200px;">
						</div>
						<span id="zipError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 100%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label Style="font-weight: bold;">Credit Card Information</label>
							</div>

							<input type="checkbox" name="" style="background:; visibility: hidden;">


						</div>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Card Number:</label>
							</div>

							<input type="text" maxlength="20" placeholder="card number" name="cardnumber" id="cardnumber" style="width: 200px;">
						</div>
						<span id="cardError" style="color: #F70000; margin-left: 150px;"></span>



						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>CCV:</label>
							</div>

							<input type="password" class="" placeholder="ccv" name="cvc" id="cvc" style="width: 200px;">
						</div>
						<span id="cvcError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label>
							</div>
						</div>

						<div style="">
							<div style="width: 30%; background:; float: left; margin-left: -151px;">
								<label style="visibility: hidden;">Na</label> <label>Expiration Date:</label>
							</div>

							<div class="expiry-wrapper">
								<select class="card-expiry-month stripe-sensitive required" id="month" name="month" value="${ params?.month}" style="width: 105px;">
								</select>
								<script type="text/javascript">
									var select = $(".card-expiry-month"), month = new Date()
											.getMonth() + 1;
									for ( var i = 1; i <= 12; i++) {
										select.append($("<option value='"
												+ i
												+ "' "
												+ (month === i ? "selected"
														: "") + ">" + i
												+ "</option>"))
									}
								</script>
								<span> / </span> <select class="card-expiry-year stripe-sensitive required" id="year" name="year" value="${ params?.year}" style="width: 105px;"></select>
								<script type="text/javascript">
									var select = $(".card-expiry-year"), year = new Date()
											.getFullYear();

									for ( var i = 0; i < 12; i++) {
										select.append($("<option value='"
												+ (i + year) + "' "
												+ (i === 0 ? "selected" : "")
												+ ">" + (i + year)
												+ "</option>"))
									}
								</script>
							</div>
						</div>
						<span id="descrirtionError222" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Description:</label>
							</div>

							<input type="text" class="" placeholder="Description" name="description" id="description" style="width: 200px;">
						</div>
						<span id="descrirtionError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 30%; background:; float: left; visibility: hidden;">
								<label style="visibility: hidden;">Na</label> <label>Description:</label>
							</div>

							<input type="button" value="PROCEED" onclick="fullformValidation();" class="saveBtn">

						</div>



						<div style="visibility: hidden;">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Description:</label>
							</div>

							<input type="text" class="" placeholder="Description">
						</div>




					</g:form>

				</div>
			</div>

		</div>





		<div class="blockFooter headerGreen" style="width: 100%; background:;"></div>


	</div>

</div>
<!--row-fluid popup end-->





<!-- start of userfull info popup -->

<div class="" id="myDiv3" style="float: right;">
	<!--span-->
	<div class="span12">
		<!--box-->

		<!--box header class="blockHeader headerGreen" -->
		<div style="margin-top: -1px; width: 98.5%;" class="blockHeader headerGreen">
			<h1>DONATE</h1>

			<a id="myDivPopupBoxClose3" class="close"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
		</div>



		<div class="generalContainer" style="width: 93%; height: 500px;">

			<div class="formContainer" style="width: 93%; height: 488px;" id="scroll">

				<h2 style="color: black; margin-top: -5px;">Add to Giving Cart</h2>

				<g:form controller="donate" action="cartInfo" class="newclass" name="cartInfoForm">

					<div style="width: 100%; background:; height: 140px;">

						<div style="width: 39%; background:; float: left;">
							<div style="">

								<label style="font-weight: bold;">I want to contribute:</label>
								<div style="width: 100%; background:;">
									$ <input type="text" class="" placeholder="" name="donationamount" id="donationamount" style="width: 100px;" required="required"> .00 USD to
								</div>
							</div>
							<label id="error1" style="color: #F70000; font-size: 13px;"></label> <span>($10 USD minimum)</span>

						</div>


						<div style="width: 61%; background:; float: left;">

							<span style="margin-left: 40px; float: left; font-size: 18px;"> McDowell Sonoran Conservancy</span> <span style="margin-left: 35px; float: left; font-size: 18px;">16435 N Scottsdale Rd
								Ste #110 </span> <span style="margin-left: 40px; float: left; font-size: 18px;">Scottsdale, AZ</span> <span style="margin-left: 40px; float: left; font-size: 18px;">85254 </span>
						</div>
					</div>




					<div style="visibility: hidden;">
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>

					<div style="visibility: hidden; width: 100%;">
						<label style="visibility: hidden;">Na</label> <label style="font-weight: bold;">Please share with this charity:</label>
					</div>

					<div>
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>

					<div style="">
						<div style="width: 60%; background:; float: left;">
							<label style="visibility: hidden;">Na</label> <input type="radio" id="radio1" name="RadioGroup1" value="1" checked="true" /> <label>My full contact information</label>
						</div>

					</div>

					<div style="">
						<div style="width: 60%; background:; float: left;">
							<label style="visibility: hidden;">Na</label> <input type="radio" id="radio2" name="RadioGroup1" value="2" /> <label>My name and email address only</label>
						</div>

					</div>

					<div style="">
						<div style="width: 100%; background:; float: left;">
							<label style="visibility: hidden;">Na</label> <input type="radio" id="radio3" name="RadioGroup1" value="3" /> <label>None of my personal information (anonymous)</label>
						</div>

					</div>

					<div style="visibility: hidden; width: 100%;">
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>

					<div style="visibility: hidden; width: 100%;">
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>

					<div style="background:;">
						<div style="width: 40%; background:; float: left;">
							<label style="visibility: hidden;">Na</label>
						</div>
					</div>

					<div style="visibility: hidden; width: 100%;">
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>
					<div style="">
						<div style="width: 40%; background:; float: left;">
							<label style="visibility: hidden;">Na</label> <label style="font-weight: bold;">Dedication or Gift:</label>
						</div>
						<input type="text" class="" placeholder="please enter the person's name" name="dedication" id="dedication" style="width: 200px;">
					</div>


					<div style="visibility: hidden; width: 100%;">
						<label style="visibility: hidden;">Na</label> <label>Please share with this charity:</label>
					</div>

					<div>
						<div style="width: 30%; background:; float: left; visibility: hidden;">
							<label style="">Na</label> <label>Dedication or Gift:</label>
						</div>
						<input type="button" value="ADD TO GIVING CART" onclick="showcredicardInfo();" class="saveBtn">



					</div>




					<div style="visibility: hidden;">
						<div style="width: 30%; background:; float: left;">
							<label style="visibility: hidden;">Na</label> <label>Description:</label>
						</div>

						<input type="text" class="" placeholder="Description">
					</div>




				</g:form>

			</div>

		</div>







		<div class="blockFooter headerGreen" style="width: 100%; background:;"></div>


	</div>

</div>
<!--row-fluid popup end-->












<!-- start of userfull info popup -->

<div class="" id="myDiv4" style="float: right;">

	<div class="span12">


		<div style="margin-top: -1px; width: 98.5%;" class="blockHeader headerGreen">
			<h1>NAME AND EMAIL</h1>
			<a id="myDivPopupBoxClose4" onclick="unloadPopupBox4();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
		</div>

		<div class="bodyGreen" style="background: white;">


			<div class="generalContainer" style="width: 93%; height: 500px;">

				<div class="formContainer" style="width: 93%; height: 488px;">

					<g:form controller="donate" action="userInfo" name="userForm" id="userForm" class="newclass">

						<div style="">
							<div style="width: 100%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label Style="font-weight: bold;">Name And Email Information</label>
							</div>

							<input type="checkbox" name="" style="background:; visibility: hidden;">


						</div>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Name:</label>
							</div>
							<input type="text" class="" placeholder="name" name="name" id="name" style="width: 200px;">
						</div>

						<span id="nameError" style="color: #F70000; margin-left: 150px;"></span>
						<div style="">

							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Email:</label>
							</div>
							<input type="text" class="" placeholder="email address" name="email_id" id="email_id" style="width: 200px;">
						</div>

						<span id="emailIdError" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 100%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label Style="font-weight: bold;">Credit Card Information</label>
							</div>

							<input type="checkbox" name="" style="background:; visibility: hidden;">


						</div>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>Card Number:</label>
							</div>

							<input type="text" class="" placeholder="card number" name="cardnumber_2" id="cardnumber_2" style="width: 200px;">
						</div>

						<span id="cardnumber_2Error" style="color: #F70000; margin-left: 150px;"></span>



						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label>CCV:</label>
							</div>

							<input type="password" maxlength="4" placeholder="ccv" name="cvc_2" id="cvc_2" style="width: 200px;">
						</div>

						<span id="cvc_2Error" style="color: #F70000; margin-left: 150px;"></span>

						<div style="">
							<div style="width: 30%; background:; float: left;">
								<label style="visibility: hidden;">Na</label> <label> Expiration Date:</label>
							</div>

							<div class="expiry-wrapper">
								<select class="card-expiry-month stripe-sensitive required" id="month_1" name="month_1" value="${ params?.month}" style="width: 105px;">
								</select>
								<script type="text/javascript">
                                                                 var select = $(".card-expiry-month"),
                                                                 month = new Date().getMonth() + 1;
                                                                 for (var i = 1; i <= 12; i++) {
                                                                 select.append($("<option value='"+i+"' "+(month === i ? "selected" : "")+">"+i+"</option>"))
                                                                 }
                                                                 </script>
                                                                 <span> / </span>
                                                                 <select class="card-expiry-year stripe-sensitive required" id="year_1" name="year_1" value="${ params?.year}" style ="width:105px;"></select>
                                                                 <script type="text/javascript">
                                                                 var select = $(".card-expiry-year"),
                                                                 year = new Date().getFullYear();
                                                                
                                                                 for (var i = 0; i < 12; i++) {
                                                                 select.append($("<option value='"+(i + year)+"' "+(i === 0 ? "selected" : "")+">"+(i + year)+"</option>"))
                                                                 }
                                                                 </script>
                                                                 </div>
                                              </div>
                                               <span id="monthError" style="color:#F70000;margin-left:150px;"></span>
                                                
                                              
                                              <div style="visibility: hidden;">
                                                 <label>Name:</label>
                                                 <input type="text" class="" placeholder="email address" style="width: 150px;">
                                              </div>
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                  <input type="button" value="PROCEED" onclick="showEmailinfo()" class="saveBtn">
                                              </div>
                                              
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text" class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>
                                                                                        
                                                                                                
                                                                                                
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
                                                
                
                                    </div>
                                   
                            
                              </div> <!-- row-fluid popup end -->
                              
                              
                              
                              
                              
                              
                              
   
    <!-- start of userfull info popup -->
   
               <div class="" id="myDiv5" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header class="blockHeader headerGreen" -->
                                        <div style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen" >
                                           <h1>CREDIT CARD INFORMATION</h1>
                                             <a id="myDivPopupBoxClose5" onclick="unloadPopupBox5();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
                                                                         <div class="generalContainer" style="width:93%;height:500px;">
                                                                        
                                                                                 <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <g:form controller="donate" action="nonInfo" name="nonuserForm" id="nonuserForm" class="newclass">
                                              
                                                   <div style="">
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Card Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name="" style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Card Number:</label>
                                                 </div>
                                                
                                                 <input type="text" class="" placeholder="card number" name="cardnumber_3" id="cardnumber_3" style="width:200px;">
                                              </div>
                                              
                                               <span id="cardnumber_3Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>CCV:</label>
                                                 </div>
                                                
                                                 <input type="password" class="" placeholder="ccv" name="cvc_3" id="cvc_3" style="width:200px;">
                                              </div>
                                              <span id="cvc_3Error" style="color:#F70000;margin-left:150px;"></span>
                                                                                           
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label> Expiration Date:</label>
                                                 </div>
                                                
                                                 <div class="expiry-wrapper">
                                                                 <select class="card-expiry-month stripe-sensitive required" id="month_3" name="month_3" value="${ params?.month}" style ="width:105px;">
                                                                 </select>
                                                                 <script type="text/javascript">
                                                                 var select = $(".card-expiry-month"),
                                                                 month = new Date().getMonth() + 1;
                                                                 for (var i = 1; i <= 12; i++) {
                                                                 select.append($("<option value='"+i+"' "+(month === i ? "selected" : "")+">"+i+"</option>"))
                                                                 }
                                                                 </script>
                                                                 <span> / </span>
                                                                 <select class="card-expiry-year stripe-sensitive required" id="year_3" name="year_3" value="${ params?.year}" style ="width:105px;"></select>
                                                                 <script type="text/javascript">
                                                                 var select = $(".card-expiry-year"),
                                                                 year = new Date().getFullYear();
                                                                
                                                                 for (var i = 0; i < 12; i++) {
                                                                 select.append($("<option value='"+(i + year)+"' "+(i === 0 ? "selected" : "")+">"+(i + year)+"</option>"))
                                                                 }
                                                                 </script>
                                                                 </div>
                                              </div>
                                              
                                                <span id="invoiceid_3Error22" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              <div style="visibility: hidden;">
                                                 <label>Name:</label>
                                                 <input type="text" class="" placeholder="email address" style="width: 150px;">
                                              </div>
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                   <input type="button" value="PROCEED" onclick="showNonifo()" class="saveBtn">
                                              </div>
                                              
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text" class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>
                                                                                        
                                                                                                
                                                                                                
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ">
                                         
                                       </div>
                                                
                
                                    </div>
                            
                              </div> <!--row-fluid popup end-->
<div class="loader1" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Processing</div>
<div id="backgroundPopup"></div>