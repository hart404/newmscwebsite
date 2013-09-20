<%

  System.out.println("message::::::::::::"+message)
 %>

<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>

<script type="text/javascript" src="https://js.stripe.com/v1/"></script>

             
<link rel="stylesheet" href="${resource(dir:'css',file:'grid/style.css')}" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"> </script>
<script src="../js/script.js"></script> 


<style type="text/css">

    /*  #myDiv6{
			display:none; 
		    position:fixed;  
		   _position:absolute; 
		    width:600px; 
		    background:#FFFFFF;  
		     border:2px solid rgb(96, 87, 82);      
		     -moz-border-radius: 6px;
		    -webkit-border-radius:6px;
		     border-radius: 6px;    
		    font-size:15px;  
		    -moz-box-shadow: 0 0 5px #000000;
		    -webkit-box-shadow: 0 0 5px #000000;
		    box-shadow: 0 0 5px #000000; 
		    margin-top: 100px;
		    margin-left: 120px;
		    
		} */
    
		#myDivPopupBoxClose6{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
		}
		
		
	.saveBtn {
    -moz-border-radius: 2px;
    -webkit-border-radius: 4px;
    -khtml-border-radius: 4px;
    border-radius: 4px;
    color:#664809; 
   
     background:#f49d2f; 
    padding: 8px 25px;
    border:solid 1px #e7af37;
    font:Arial;
    
    cursor: pointer;
    
}

.saveBtn:hover{

   -moz-border-radius: 2px;
    -webkit-border-radius: 4px;
    -khtml-border-radius: 4px;
    border-radius: 4px;
    color:#704109; 
    background:#fcbe28; 
     padding: 8px 25px;
    border:solid 1px #e39d3d;
    font:Arial;
    
    
   
   
	
}
	


</style>

<script type="text/javascript">
var popupStatus1 = 0; // set value

var amount_val = "";

	 function validateForm()
		
		{
		var email_addess = document.getElementById("email_addess").value
		
		var atpos=email_addess.indexOf("@");
		var dotpos=email_addess.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email_addess.length)
		  {
		   $("#email_addessError").html("You must enter a valid Email.")
		     return false;
		  }

		var firstname = document.getElementById("firstname").value
		var lastname = document.getElementById("lastname").value
		var company = document.getElementById("company").value
		
		  var myJSONText = "{'email_address':'"+email_addess+
			"','firstname':'"+firstname+"','lastname':'"+lastname+"','companyname':'"+company+"'}"
	  

		var url = "./person/registerUser?data="+myJSONText;  
	    
		$(location).attr('href',url);
		
		}



	 jQuery(function($) {
			
		$("#donateNow").click(function() {
			
				
				$("#donationamount").val("");
				$("#recurring_type").val("");

				
					
				 $('input[id="radio1"]').prop('checked', true);
				 $('input[id="radio11"]').prop('checked', true);
				
				//$("#radio1").attr("checked", "checked");
				//$("#radio2").attr('checked', false);
				//$("#radio3").attr('checked', false);
				
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup1(); // function show popup 
				}, 500); // .5 second
		return false;
		});
			
			/* start of mydiv3 */
			
			$(".buttonDropShadow").click(function() {
				
				$("#donationamount").val("");	
				$("#recurring_type").val("");
				
				$('input[id="radio1"]').prop('checked', true);
				 $('input[id="radio11"]').prop('checked', true);
				    
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup1(); // function show popup 
				}, 500); // .5 second
		return false;
		}); 



	     
			
			function loadPopup1() { 
				if(popupStatus1 == 0) { // if value is 0, show popup
					
					$("#myDiv3").fadeIn(0500); // fadein popup div
					$("#backgroundPopup").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$("#backgroundPopup").fadeIn(0001); 
				   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$(".menuContainer").fadeIn(0001); 

					
					popupStatus1 = 1; // and set value to 1
				}	
			}

			$("a.close").click(function() {
				disablePopup1();  // function close pop up
			});
			
			function disablePopup1() {
				if(popupStatus1 == 1) { // if value is 1, close popup
					$("#myDiv3").fadeOut("normal");  
					$("#backgroundPopup").fadeOut("normal");  
					//$(".menuContainer").fadeOut("normal"); 
					$(".menuContainer").css("opacity", "1");
					popupStatus1 = 0;  // and set value to 0
				}
			}

			/* end of mydiv3 */
			
			/* start of mydiv6 */
			$(".subscribeButton").click(function() {
				
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup(); // function show popup 
				}, 500); // .5 second
		return false;
		});		

			var popupStatus = 0; // set value
			
			function loadPopup() { 
				if(popupStatus == 0) { // if value is 0, show popup
					
					$("#myDiv6").fadeIn(0500); // fadein popup div
					$("#backgroundPopup").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$("#backgroundPopup").fadeIn(0001); 
				   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$(".menuContainer").fadeIn(0001); 

					
					popupStatus = 1; // and set value to 1
				}	
			}

			$("a.close").click(function() {
				disablePopup();  // function close pop up
			});
			
			function disablePopup() {
				if(popupStatus == 1) { // if value is 1, close popup
					$("#myDiv6").fadeOut("normal");  
					$("#backgroundPopup").fadeOut("normal");  
					//$(".menuContainer").fadeOut("normal"); 
					$(".menuContainer").css("opacity", "1");
					popupStatus = 0;  // and set value to 0
				}
			}

			/* end of mydiv6 */

	 });     
</script>

	

</head>
<body >
	<div id="gallery" class="mscGallery">
	</div>
	<script>
	    function loadAdSpace(json) {
	    	if (typeof console == "undefined" || typeof console.log == "undefined") 
	    	{
	    	   var console = { log: function() {} }; 
	    	}
	        var data = eval(json);
	        Galleria.loadTheme("<g:createLinkTo dir='/js/galleria/themes/classic/' file='galleria.classic.min.js'/>");
	        $("#gallery").galleria({
	            dataSource: data,
	            showInfo: false,
	            transition: 'fade',
	            transitionSpeed: 1000,
	            showImagenav: false,
	            autoplay: 5000,
	            width: 1194,
	            height: 400,
	            imageCrop: true
	        });
	    };

	    function showsDonatePopup(){

          

	    	loadPopupBox3();

	          
	  }

	 function  showSubscribeForm(){

          loadPopupBox6();

     }


	 function loadPopupBox6() { 
		 	
			// To Load the Popupbox
		
	 		$('#myDiv6').show();	 		
			//$('#myDiv2').draggable();  
	        $('#myDiv6').fadeIn("slow");
	        $('#myDiv6').animate({'top':'5%'},0);
	       
		} 
 

	function unloadPopupBox6() {  
		  
		
		$('#myDiv6').fadeOut("slow");
  	
	}    



	function closePopup6(){
	
	   	unloadPopupBox6();
	   
	}

   /* function loadPopupBox3() { 
		 	
			// To Load the Popupbox
			alert("inside load poup")
		
	 		$('#myDiv3').show();	 		
			//$('#myDiv2').draggable();  
	        $('#myDiv3').fadeIn("slow");
	        $('#myDiv3').animate({'top':'5%'},0);
	       
		} 
    

	function unloadPopupBox3() {  
		  
   		
   		$('#myDiv3').fadeOut("slow");
     	
	}    

  

	function closePopup3(){
	
	   	unloadPopupBox3();
	   
	}


	    
	    function loadPopupBox2() { 
		 	
			// To Load the Popupbox
			alert("inside load poup")
		
	 		$('#myDiv2').show();	 		
			//$('#myDiv2').draggable();  
	        $('#myDiv2').fadeIn("slow");
	        $('#myDiv2').animate({'top':'.5%'},0);
	       
		} 
    

	function unloadPopupBox2() {  
		  
   		
   		$('#myDiv2').fadeOut("slow");
     	
	}    

  

	function closePopup2(){
	
	   	unloadPopupBox2();
	   
	}


    function loadPopupBox4() { 
	 	
		// To Load the Popupbox
		alert("inside load poup")
	
 		$('#myDiv4').show();	 		
		//$('#myDiv2').draggable();  
        $('#myDiv4').fadeIn("slow");
        $('#myDiv4').animate({'top':'5%'},0);
       
	} 


function unloadPopupBox4() {  
	  
		
		$('#myDiv4').fadeOut("slow");
 	
}    



function closePopup4(){

   	unloadPopupBox4();
   
}

function loadPopupBox5() { 
 	
	// To Load the Popupbox
	alert("inside load poup")

	$('#myDiv5').show();	 		
	//$('#myDiv2').draggable();  
    $('#myDiv5').fadeIn("slow");
    $('#myDiv5').animate({'top':'5%'},0);
   
} 


function unloadPopupBox5() {  
  
	
	$('#myDiv5').fadeOut("slow");
	
}    



function closePopup5(){

	unloadPopupBox5();

} */
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
   
   
    <div class="homePageItems" >
		<div class="homePageItem marginRight">
			<div class="blockHeader headerBlue">
				<h1>Support Us</h1>
			</div>
			<div class="homePageSubItem bodyBlue" >
				<div class="imageContainer">
				    <scms:photoWidget widget='${donatePhoto}' photoCssClass="innerGlow imageDonate"/>
					<div class="imageText">
						<p><scms:htmlWidget widget="${donateText}" /></p>
					</div>
					<div class="imageButton">
						
						
						<input type="image" value="Submit" class = "buttonDropShadow" alt="Submit" id="donateNow"
							src="<g:createLinkTo dir='images/layout' file='img_donate-89x28.png'/>"  onclick="showsDonatePopup();"/>
					</div>
					   <g:if test="${flash.message}">
    
					     <h3 style="color:#F70000;">&nbsp;${flash.message}</h3>
					    </g:if>
				</div>
				<div class="imageText bodyBlue">
					<h2>Stay in Touch</h2>
					<p>Signup for the biweekly eNewsletter to stay informed about the Conservancy.</p>
				</div>
				<div class="imageButton bodyBlue">
				   
				    <span style="visibility: hidden;">ffffffuuuuuuuuuddd</span>
				   <input type="image" value="Submit" class="subscribeButton" alt="Submit"
							src="<g:createLinkTo dir='images/layout' file='img_subscribe-112x28.png'/>"  />
					<p></p>
					<span style="color:#F70000;">${message}</span>
				</div>
				
				
			</div>
			<div class="blockFooter headerBlue">
                <a href="https://www.networkforgood.org/donation/MakeDonation.aspx?ORGID2=860674350" target="_blank">Support us &raquo</a>
            </div>          
		</div>
		<div class="homePageItem marginRight">
			<div class="blockHeader headerGreen">
				<h1>Latest News</h1>
			</div>
			<div class="homePageSubItem bodyGreen">
				<g:each var="newsItem" in="${newsItems}">
					<h2>
						${newsItem.title}
					</h2>
					<p>
						${newsItem.summary}
						<g:link controller="newsItem" action="displayNewsItem" id="${newsItem.id}">Read more &raquo</g:link>
					</p>
				</g:each>
			</div>
			<div class="blockFooter headerGreen">
                <a href="<g:createLink controller='newsItem'/>">See all news &raquo</a>
            </div>          
			
		</div>
		<div class="homePageItem">
			<div class="blockHeader headerYellow">
				<h1>Highlighted Events &amp; Hikes</h1>
			</div>
			<div class="homePageSubItem bodyYellow">
				<g:each var="event" in="${events}">
				    <div class='outerEvent'>
					    <div class='calendarIcon'>
	                        <img src="<g:createLinkTo dir='images/layout' file='calendar-${event.startTime.dayOfMonth}.png'/>">
	                    </div>
	                    <div class='eventShort'>
							<h2>
								${event.title}
							</h2>
							<p>
								<span class="date"> ${event.formattedStartTime()}
								</span>&nbsp;
							</p>
							<p>
								<g:link controller="event" action="displayEvent" id="${event.id}">Learn More &raquo</g:link>
							</p>
						</div>
					</div>
				</g:each>
			</div>
			<div class="blockFooter headerYellow">
                <a href="<g:createLink controller='event'/>">See all events &raquo</a>
            </div>			
		</div>
    </div>
    
    
    <g:render template="/widget/updateHtmlWidgetDialog" plugin="simple-cms" />
    <g:render template="/widget/updatePhotoWidget" plugin="simple-cms" />
    <g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
   
   <div id="backgroundPopup"></div>
    
    <!-- start of userfull info popup -->
   
               <div class="" id="myDiv6" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header  class="blockHeader headerGreen" -->
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>SUBSCRIPTION</h1>
                                             <a id="myDivPopupBoxClose6" class="close" ><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <form  action="subscribeInfo" name="subscForm" id="subscForm" class="newclass"  method="post">
                                              
                                                   <div style="">
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Subscription Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name=""  style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>   
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Email Address:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="email address" name="email_addess" id="email_addess" style="width:200px;">
                                              </div>
                                              
                                               <span id="email_addessError" style="color:#F70000;margin-left:150px;"></span>                             
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>First Name:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="first name" name="firstname" id="firstname" style="width:200px;">
                                              </div>
                                              
                                               <span id="firstnameError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Last Nmae:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="last name" name="lastname" id="lastname" style="width:200px;">
                                              </div>
                                              <span id="lastnameError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Company:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="company name" name="company" id="company" style="width:200px;">
                                              </div> 
                                               <span id="companyError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                              
                                              <div style="visibility: hidden;">
                                                 <label>Name:</label>
                                                 <input type="text"  class="" placeholder="email address" style="width: 150px;">
                                              </div>
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                   <input type="button" value="SUBSCRIBE" class="saveBtn" onclick="return validateForm();">
                                              </div>
                                              
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>    
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                            
                              </div>   <!--row-fluid popup end-->
   
  
 </body>
</html>