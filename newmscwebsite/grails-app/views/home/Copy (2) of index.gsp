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
<jq:resources/>
             
    <script src="../js/jquery.min.js"></script> 


<style type="text/css">

	
		#myDiv2{
			display:none; /* Hide the DIV */
		    position:fixed;  
		   _position:absolute; /* hack for internet explorer 6 */  
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
		    margin-top: 1px;
		    margin-left: 120px;
		    
		}
    
		#myDivPopupBoxClose2{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
		}
		
		
		
		#myDiv3{
			display:none; /* Hide the DIV */
		    position:fixed;  
		   _position:absolute; /* hack for internet explorer 6 */  
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
		    
		}
    
		#myDivPopupBoxClose3{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
		}
		
		
		#myDiv4{
			display:none; /* Hide the DIV */
		    position:fixed;  
		   _position:absolute; /* hack for internet explorer 6 */  
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
		    
		}
    
		#myDivPopupBoxClose4{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
		}
		
		
		
		#myDiv5{
			display:none; /* Hide the DIV */
		    position:fixed;  
		   _position:absolute; /* hack for internet explorer 6 */  
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
		    
		}
    
		#myDivPopupBoxClose5{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
		}
 .newclass {
	border: none;
	font-family: arial, helvetica, sans-serif;
    font-size: 15px;
    color: rgb(84, 83, 74);
    
/* form { width: 500px; }
form label { width: 250px; }
form label.error,
form input.submit { margin-left: 253px; }
} */


 #userForm label.error {
			
			width: 90% ;
			display: block ;
			color:#F70000 ;
			font-size:14px;
}

</style>

<script type="text/javascript">
var amount
var recuringType ;
function showcredicardInfo(){

	alert("inside credit carddddd")

	 amount = document.getElementById("donationamount").value
	
	//alert("inside credit carddddd:::::::::::::::::::"+amount)
	
 if(amount == ""){

	     // alert("inside aaaaaaaaaaa")
	      $("#error1").html("You must enter donation amount")
   }else{

	   var letters = /^[0-9]+$/;  
		if(amount.match(letters))  
		{  
		alert('Your registration number have accepted : you can try another');  
		 $("#error1").html("")

		   var test = $("#radio11").is(":checked")
		   //alert("test :::::::::::"+test)
		  

		   if($("#radio1").is(":checked")){
              //alert("fullllllllllllllllll")
              unloadPopupBox3();
              loadPopupBox2();
		   }


		 if($("#radio2").is(":checked")){
			 
             //alert("emailllllland addresssssssss")
             unloadPopupBox3();
             loadPopupBox4();
		   }

            if($("#radio3").is(":checked")){
			 
             //alert("nnnnnnnnnnnnnn addresssssssss")
             unloadPopupBox3();
             loadPopupBox5();
		   }
          

    	 
    		 
		  
		}  
		else  
		{  
		  
		  $("#error1").html("You must enter a valid dollar amount")
		 
		} 



		   if($("#radio11").is(":checked")){

   	    	recuringType = "one time donation"
   		 }

   	    if($("#radio22").is(":checked")){

   	    	//recuringType = "recurring donation"
   	    		
   	    		recuringType = document.getElementById("recurring_type").value
   	    		
   	    		alert("recuringType :::::::::::::::"+recuringType)
   		}

	}


	
	
	
}

function fullformValidation(){

	//alert("inside fullform validation ")
	
	var firstName = document.getElementById("fname").value

	var lastName = document.getElementById("lname").value
	
	if(firstName == ""){
         
		$("#firstNameError").html("You must enter a First Name.")
    }else{

    	$("#firstNameError").html("")
     }


    if(lastName == ""){

    	
    	$("#lastNameError").html("You must enter a Last Name.")

    }
    var email = document.getElementById("email").value
    //var x=document.forms["myForm"]["email"].value;
    var atpos=email.indexOf("@");
    var dotpos=email.lastIndexOf(".");
    
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
      {
         //alert("Not a valid e-mail address");
         if(email == ""){
             
         	$("#emailError").html("You must enter an Email.")
         }else{

        	 $("#emailError").html("")
             $("#emailError").html("You must enter a valid Email.")
         }
        
     }

    var address = document.getElementById("address").value

    if(address == ""){

    	$("#addressError").html("You must enter an Address.")
        
    }

    var city = document.getElementById("city").value

    if(city == ""){

    	$("#cityError").html("You must enter a City.")
        
    }

    var state = document.getElementById("state").value

    if(state == ""){

    	$("#stateError").html("You must enter State.")
        
    }


    var country = document.getElementById("country").value

    if(country == ""){

    	$("#countryError").html("You must select a Country.")
        
    }


    var zip = document.getElementById("zip").value
    
    if( zip == "" || isNaN( zip ) || zip.length != 5 )
    {
      //alert( "Please provide a zip in the format #####." );
      
      if(zip == ""){

    	  $("#zipError").html("You must enter a Zip Code.")
      }else if(isNaN( zip )){

    	  $("#zipError").html("")
    	  $("#zipError").html("You must enter Number.")
       }else{

    	  $("#zipError").html("")
     	  $("#zipError").html("You must enter the format #####.")
        }
      
      
    }

 var phone = document.getElementById("phone").value
    
    if( phone == "" || isNaN( phone ) || phone.length != 10 )
    {
      if(phone == ""){

    	  $("#phoneError").html("You must enter a Phone Number.")
      }else if(isNaN( phone )){

    	  $("#phoneError").html("")
    	  $("#phoneError").html("You must enter Number.")
       }else{

    	  $("#phoneError").html("")
     	  $("#phoneError").html("You must enter the format ##########.")
        }
      
      
    }


 var cardnumber = document.getElementById("cardnumber").value
 
 if( cardnumber == "" || isNaN( cardnumber ) || cardnumber.length != 20 )
 {
   if(cardnumber == ""){

 	  $("#cardError").html("You must enter your Credit Card Number.")
   }else if(isNaN( cardnumber )){

 	  $("#cardError").html("")
 	  $("#cardError").html("You must enter Number.")
    }else{

 	  $("#cardError").html("")
  	   //$("#cardError").html("You must enter the format ####################.")
     }
   
   
 }


  var cvc = document.getElementById("cvc").value
  alert("cvc ::::::::::::"+cvc)
 
 if( cvc == "" || isNaN( cvc ) || cvc.length != 3 )
 {
   if(cvc == ""){

 	  $("#cvcError").html("Please enter the credit card's security code.")
 	  
   }else if(isNaN( cvc )){

 	  $("#cvcError").html("")
 	  $("#cvcError").html("You must enter Number.")
    }else{

 	  $("#cvcError").html("")
  	  $("#cvcError").html("You must enter the format ###.")
     }
   
   
 }

 
var invoiceid = document.getElementById("invoiceid").value

if( invoiceid == "" || isNaN( invoiceid ) || invoiceid.length != 3 )
{
  if(invoiceid == ""){

	  $("#invoiceError").html("Please enter the InvoiceId.")
	  
  }else if(isNaN( invoiceid )){

	  $("#invoiceError").html("")
	  $("#invoiceError").html("You must enter Number.")
   }else{

	  $("#invoiceError").html("")
 	  $("#invoiceError").html("You must enter the format ###.")
    }
  
  
}

	var street = document.getElementById("street").value
	if(street == ""){
	
		$("#streetError").html("You must enter Street.")
		
	}else{
		$("#streetError").html("")
   }


var month = document.getElementById("month").value
var year = document.getElementById("year").value

alert("month :::::::::::"+month)
alert("year :::::::::::"+year)
alert("amount ::::::::::::"+amount)
alert("street ::::::::::::::::"+street)


//if(firstName !="" && lastName != "" && email != "" && address != "" && 
		//city != "" && state != "" && country != "" && zip != "" && phone != "" && cardnumber != "" && cvc ! = "" && invoiceid != ""){
if(firstName !="" && lastName != "" && email != "" && address != "" && city != "" && state != "" && country != "" && zip != "" && phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && street != ""){
	

	alert("ffffffffffffffffffff")

	

	var myJSONText = "{'firstName':'"+firstName+
	"','lastName':'"+lastName+"','email':'"+email+"','address':'"+address+"','city':'"+city+
	"','state':'"+state+"','country':'"+country+"','zip':'"+zip+"','phone':'"+phone+"','cardnumber':'"+cardnumber+"','cvc':'"+cvc+
	"','invoiceid':'"+invoiceid+"','month':'"+month+"' ,'year':'"+year+"','amount':'"+amount+"','street':'"+street+"','recuringType':'"+recuringType+"'}"

       alert("myJSONText:::::::::::::::::"+myJSONText)
    
          
	    var url = "./home/saveFullinfoData?data="+myJSONText;  
	    //var url = "./home";    
		$(location).attr('href',url);
}
    
	
}


   function showEmailinfo(){

	   alert("inside sssshoeeeeeeeeeeee")

	   var name = document.getElementById("name").value

	   if(name == ""){

		   $("#nameError").html("You must enter Name")
 
	   }else{

		   $("#nameError").html("")
           
	   }

	   var email_id = document.getElementById("email_id").value

	   var atpos=email_id.indexOf("@");
	    var dotpos=email_id.lastIndexOf(".");
	    
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email_id.length)
	      {
	         //alert("Not a valid e-mail address");
	         if(email == ""){
	             
	         	$("#emailIdError").html("You must enter an Email.")
	         }else{

	        	 $("#emailIdError").html("")
	             $("#emailIdError").html("You must enter a valid Email.")
	         }
	        
	     }
	     
	    var cvc_2 = document.getElementById("cvc_2").value

	    if( cvc_2 == "" || isNaN( cvc_2 ) || cvc_2.length != 3 )
	    {
	      if(cvc_2 == ""){

	    	  $("#cvc_2Error").html("Please enter the credit card's security code.")
	    	  
	      }else if(isNaN( cvc_2 )){

	    	  $("#cvc_2Error").html("")
	    	  $("#cvc_2Error").html("You must enter Number.")
	       }else{

	    	  $("#cvc_2Error").html("")
	     	  $("#cvc_2Error").html("You must enter the format ###.")
	        }
	      
	      
	    }

	    var invoiceid_2 = document.getElementById("invoiceid_2").value

	    if( invoiceid_2 == "" || isNaN( invoiceid_2 ) || invoiceid_2.length != 3 )
	    {
	      if(invoiceid_2 == ""){

	    	  $("#invoiceid_2Error").html("Please enter the InvoiceId.")
	    	  
	      }else if(isNaN( invoiceid_2 )){

	    	  $("#invoiceid_2Error").html("")
	    	  $("#invoiceid_2Error").html("You must enter Number.")
	       }else{

	    	  $("#invoiceid_2Error").html("")
	     	  $("#invoiceid_2Error").html("You must enter the format ###.")
	        }
	      
	      
	    }
	    var month_1 = document.getElementById("month_1").value
	    var year_1 = document.getElementById("year_1").value

	    var cardnumber_2 = document.getElementById("cardnumber_2").value
	    var recuringType ;

	    if($("#radio2").is(":checked")){

	    	recuringType = "one time donation"
		 }

	    if($("#radio1").is(":checked")){

	    	recuringType = "recurring donation"
		 }


	    if(name != "" && email_id != "" && cvc_2 != "" && invoiceid_2 != "" && cardnumber_2 != ""){


		    alert("ffffffffffffffffffff")


		    var myJSONText = "{'name':'"+name+
			"','email_id':'"+email_id+"','cvc_2':'"+cvc_2+"','invoiceid_2':'"+invoiceid_2+
			 "','month':'"+month_1+"' ,'year':'"+year_1+"','amount':'"+amount+"','cardnumber':'"+cardnumber_2+"','recuringType':'"+recuringType+"'}"

		       alert("myJSONText:::::::::::::::::"+myJSONText)
		    
		          
			    var url = "./home/saveNameEmail?data="+myJSONText;  
			      
				$(location).attr('href',url);
		    

		}
	   
	  
	  
        
   }


   function showNonifo(){

       alert("non infoooooooooooooooo")


       
	    var cvc_3 = document.getElementById("cvc_3").value

	    if( cvc_3 == "" || isNaN( cvc_3 ) || cvc_3.length != 3 )
	    {
	      if(cvc_3 == ""){

	    	  $("#cvc_3Error").html("Please enter the credit card's security code.")
	    	  
	      }else if(isNaN( cvc_3 )){

	    	  $("#cvc_3Error").html("")
	    	  $("#cvc_3Error").html("You must enter Number.")
	       }else{

	    	  $("#cvc_3Error").html("")
	     	  $("#cvc_3Error").html("You must enter the format ###.")
	        }
	      
	      
	    }

	    var invoiceid_3 = document.getElementById("invoiceid_3").value

	    if( invoiceid_3 == "" || isNaN( invoiceid_3 ) || invoiceid_3.length != 3 )
	    {
	      if(invoiceid_3 == ""){

	    	  $("#invoiceid_3Error").html("Please enter the InvoiceId.")
	    	  
	      }else if(isNaN( invoiceid_3 )){

	    	  $("#invoiceid_3Error").html("")
	    	  $("#invoiceid_3Error").html("You must enter Number.")
	       }else{

	    	  $("#invoiceid_3Error").html("")
	     	  $("#invoiceid_3Error").html("You must enter the format ###.")
	        }
	      
	      
	    }
	    var month_3 = document.getElementById("month_3").value
	    var year_3 = document.getElementById("year_3").value

	    var cardnumber_3 = document.getElementById("cardnumber_3").value
	    
	    alert("recuringType :::::::::::::::"+recuringType)

	    if( cvc_3 != "" && invoiceid_3 != "" && cardnumber_3 != ""){


		   


		    var myJSONText = "{'cvc_3':'"+cvc_3+"','invoiceid_3':'"+invoiceid_3+
			 "','month':'"+month_3+"' ,'year':'"+year_3+"','amount':'"+amount+"','cardnumber':'"+cardnumber_3+"','recuringType':'"+recuringType+"'}"

		       alert("myJSONText:::::::::::::::::"+myJSONText)
		    
		          
			    var url = "./home/saveNonData?data="+myJSONText;  
			      
				$(location).attr('href',url);
		    

		}

   }




$(document).ready(function() {
	
	alert("ggggggggggggggggggggg")
	
	

 jQuery.validator.addMethod("cardnumber", Stripe.validateCardNumber, "Please Enter A Valid Card Number");
	             jQuery.validator.addMethod("cvc", Stripe.validateCVC, "Please Enter A Valid Security Code");
	             jQuery.validator.addMethod("cardExpiry", function() {
	                    return Stripe.validateExpiry($(".card-expiry-month").val(), 
	                                                 $(".card-expiry-year").val())
	                }, "Please Enter A Valid Expiration");	

    $("#userForm").validate({
			    	
					 rules: {
						 name: {
							required: true,
						},
						
					},
		 		
					messages: {
						
						name: {
							required: "<p >&nbsp;Please Enter Account Name </p>",
						},
						
					}
				
			    });

	
});
</script>
</head>
<body>
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

          
          // loadPopupBox2();

	    	loadPopupBox3();

	          
	  }

    function loadPopupBox3() { 
		 	
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

}
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
   
    <div class="homePageItems">
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
						<a href="#" onclick="showsDonatePopup();">
						<img src="<g:createLinkTo dir='images/layout' file='img_donate-89x28.png'/>" class = "buttonDropShadow"/></a>
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
				    <g:form name="registerUser1" controller="person" action="registerUser"  >
                        <g:textField  name="emailId" id="emailId" class="email" placeholder="email address"/>
						<input type="image" value="Submit" class="subscribeButton" alt="Submit"
							src="<g:createLinkTo dir='images/layout' file='img_subscribe-112x28.png'/>" />
					</g:form>
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
    
    <!-- start of userfull info popup -->
   
               <div class="" id="myDiv2" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header  class="blockHeader headerGreen" -->
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>Card Information</h1>
                                             <a id="myDivPopupBoxClose2" onclick="closePopup2()"><img src="./images/cancel_dialog.png" height="25" width="25"/></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:665px;">
									        
										    <div class="formContainer" style="width:93%;height:662px;overflow: auto;">
                                             
                                              <g:form  action="donateInfo" name="cardInfoForm" id="cardInfoForm" class="newclass">
                                              
                                              
                                              
                                               <div style="">
                                                  <div style="width:30%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >First Name:</label>
                                                </div>
                                                 <input type="text" class="" placeholder="first name" name="fname" id="fname" style="width:200px;">
                                              </div>
                                              <span id="firstNameError" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="">
                                               <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Last Name:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="last name" name="lname" id="lname" style="width:200px;">
                                              </div>
                                              <span id="lastNameError" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="">
                                              
                                               <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Email:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="email address" name="email" id="email" style="width:200px;">
                                              </div>
                                              <span id="emailError" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="background: ;">                                               
                                               
                                               <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label >Phone:</label>                                               
                                               </div>                                                 
                                                 
                                                 <input type="text"  class="" placeholder="phone number" name="phone" id="phone" style="width:200px;">
                                              </div>
                                              <span id="phoneError" style="color:#F70000;margin-left:150px;"></span>
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label>Address:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="address" name="address" id="address" style="width:200px;">
                                              </div>
                                              <span id="addressError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>City:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="city" name="city" id="city" style="width:200px;">
                                              </div>
                                              <span id="cityError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Street:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="street" name="street" id="street" style="width:200px;">
                                              </div>
                                              <span id="streetError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>State:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="state" name="state" id="state" style="width:200px;">
                                              </div>
                                              <span id="stateError" style="color:#F70000;margin-left:150px;"></span>
                                              <div style="">
                                                 <div style="width:30%;background:;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Country:</label>
                                                 </div>
                                           
                                                 
                                                 <g:countrySelect type="text"  name="country" id="country"  value="${ params?.country}" 
												                                                noSelection="['':'-Choose your country-']" multiple="false"  style ="width:202px;"/>
                                              </div>
                                              <span id="countryError" style="color:#F70000;margin-left:150px;"></span>
                                             <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Zip:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="zip" name="zip" id="zip" style="width:200px;">
                                              </div>
                                              <span id="zipError" style="color:#F70000;margin-left:150px;"></span>
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Card Number:</label>
                                                 </div>
                                                
                                                 <input type="text"  maxlength="20"  placeholder="card number" name="cardnumber" id="cardnumber" style="width:200px;">
                                              </div>
                                              <span id="cardError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              <!--  <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Amount:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="amount" name="amount" id="amount" style="width:200px;">
                                              </div> -->
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>CVC:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="cvc" name="cvc" id="cvc" style="width:200px;">
                                              </div>
                                              <span id="cvcError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Invoice Id:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="invoice id" name="invoiceid" id="invoiceid" style="width:200px;">
                                              </div> 
                                              
                                              <span id="invoiceError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Expiration Date:</label>
                                                 </div>
                                                
                                                 <div class="expiry-wrapper">
								                    <select class="card-expiry-month stripe-sensitive required" id="month" name="month" value="${ params?.month}" style ="width:105px;">
								                    </select>
								                    <script type="text/javascript">
								                        var select = $(".card-expiry-month"),
								                            month = new Date().getMonth() + 1;
								                        for (var i = 1; i <= 12; i++) {
								                            select.append($("<option value='"+i+"' "+(month === i ? "selected" : "")+">"+i+"</option>"))
								                        }
								                    </script>
								                    <span> / </span>
								                    <select class="card-expiry-year stripe-sensitive required" id="year" name="year" value="${ params?.year}" style ="width:105px;"></select>
								                    <script type="text/javascript">
								                        var select = $(".card-expiry-year"),
								                            year = new Date().getFullYear();
								 
								                        for (var i = 0; i < 12; i++) {
								                            select.append($("<option value='"+(i + year)+"' "+(i === 0 ? "selected" : "")+">"+(i + year)+"</option>"))
								                        }
								                    </script>
								                </div>
                                              </div>
                                              <span id="descrirtionError222" style="color:#F70000;margin-left:150px;"></span>
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" name="description" id="description" style="width:200px;">
                                              </div> 
                                               <span id="descrirtionError" style="color:#F70000;margin-left:150px;"></span>
                                               
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                  <input type="button" value="PROCEED" onclick="fullformValidation();">
                                                  
                                              </div>
                                              
                                              
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>    
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                            
                              </div>   <!--row-fluid popup end-->
                              
                              
                              
                    
                    
                        <!-- start of userfull info popup -->
   
                   <div class="" id="myDiv3" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header  class="blockHeader headerGreen" -->
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>DONATE</h1>
                                           
                                             <a id="myDivPopupBoxClose3" onclick="closePopup3()"><img src="./images/cancel_dialog.png" height="25" width="25"/></a>
                                               </div>                                            
                                             
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
										    
										    <h2 style="color: black;margin-top: -5px;">Add to Giving Cart</h2>
                                             
                                              <g:form  action="cartInfo"  id="cartInfoForm" class="newclass" name="cartInfoForm">
                                              
                                                  <div style="width:100%;background:;height:300px;">
                                                    
                                                    <div style="width:30%;background:;float:left;"> 
                                                       <div style="">
		                                                 
		                                                 <label >I want to contribute:</label>
		                                                
		                                                 <input type="text" class="" placeholder="amount ($10 USD minimum)" name="donationamount" id="donationamount" style="width:150px;" required="required" > .00 USD  to
		                                              </div>
		                                              <span id="error1" style="color:#F70000;"></span>
                                                       
                                                    
                                                    </div>
                                                   
                                                  
                                                   <div style="width:70%;background:;float:left;">
                                                        
                                                        <span style="margin-left:40px;float:left;font-size:20px; "> McDowell Sonoran Land Conservancy</span>
														<span style="margin-left:40px;float:left;font-size:20px; ">16435 N Scottsdale Rd Ste #110 </span>
														<span style="margin-left:50px;float:left;font-size:20px; ">Scottsdale, AZ</span>
														<span style="margin-left:40px;float:left;font-size:20px; ">85254 </span>
                                                   </div>
                                                  </div>
                                              
                                              
                                                <div style="">
                                                  <div style="width:30%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >I want to contribute:</label>
                                                </div>
                                                 <input type="text" class="" placeholder="amount ($10 USD minimum)" name="donationamount" id="donationamount" style="width:200px;" required="required" >
                                              </div>
                                              <span id="error1" style="color:#F70000;"></span>
                                              
                                               <div style="visibility:hidden;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                                 
                                                 <div>
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Donation Preferences:</label>
                                                 </div>
                                                 
                                                 <div style="">
                                                  <div style="width:60%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 
                                                    <input type="radio" id="radio11" name="RadioGroup2" value="one time donation" checked="true" />
                                                   <label >This is a one time donation</label>
                                                </div>
                                                 
                                              </div>
                                              
                                               <div style="">
                                                  <div style="width:100%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 
                                                    <input type="radio" id="radio22" name="RadioGroup2" value="recurring "  />
                                                   <label >I would like to make this a recurring donation deducted</label>
                                                   <g:select name="recurring_type"  id="recurring_type" from="${['Monthly', 'Quarterly', 'Annually']}"  noSelection="['': '']" style="width:100px;" />
                                                </div>
                                                 
                                              </div>
                                                 
                                               <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                          
                                                 <div>
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                             
                                                  <div style="">
                                                  <div style="width:60%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 
                                                   <input type="radio" id="radio1" name="RadioGroup1" value="1" checked="true"/>
                                                   <label >My full contact information</label>
                                                </div>
                                                 
                                              </div>
                                              
                                               <div style="">
                                                  <div style="width:60%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 
                                                    <input type="radio" id="radio2" name="RadioGroup1" value="2" />
                                                   <label >My name and email address only</label>
                                                </div>
                                                 
                                              </div>
                                              
                                               <div style="">
                                                  <div style="width:100%;background:;float: left;">
                                                    <label style="visibility:hidden;">Na</label>
                                                 
                                                   <input type="radio" id="radio3" name="RadioGroup1" value="3" />
                                                   <label >None of my personal information (anonymous)</label>
                                                </div>
                                                 
                                              </div>
                                            
                                             <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                                 
                                                  <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
										   
                                                <div style="background: ;">
                                                  <div style="width:30%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Designation:</label>
                                                </div>
                                                 <g:select name="title" from="${['', 'Mr', 'Mrs', 'Ms', 'Dr', 'Professor']}"  noSelection="['': '']" style="width:200px;float: left;" />
                                              </div>
										   
                                             <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                             <div style="">
                                                  <div style="width:30%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Dedication or Gift:</label>
                                                </div>
                                                 <input type="text" class="" placeholder="please enter the person's name" name="dedication" id="dedication" style="width:200px;">
                                              </div>
                                              
                                              
                                               <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                                 
                                                 <div>
                                                  <div style="width:30%;background:;float: left;visibility:hidden;">
                                                <label style="">Na</label>
                                                 <label >Dedication or Gift:</label>
                                                </div>
                                                    <input type="button" value="ADD TO GIVING CART" onclick="showcredicardInfo();">
                                                    
                                                    
                                                 
                                                 </div>
                                                 
                                                 
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div> 
                                              
                                              </div>
                                                
                                             
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                            
                              </div>   <!--row-fluid popup end-->          
                              
                              
   
   
   
   
   
   
   
   
   
   
    <!--  start of userfull info popup  -->
   
               <div class="" id="myDiv4" style="float: right;" >
                                                       
                                     <div class="span12">                 
                                      
                                        
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>Card Information</h1>
                                             <a id="myDivPopupBoxClose4" onclick="closePopup4()"><img src="./images/cancel_dialog.png" height="25" width="25"/></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <g:form  action="userInfo" name="userForm" id="userForm" class="newclass">
                                              
                                              
                                              
                                               <div style="">
                                                  <div style="width:30%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Name:</label>
                                                </div>
                                                 <input type="text" class="" placeholder="name" name="name" id="name" style="width:200px;">
                                              </div>
                                              
                                               <span id="nameError" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="">
                                              
                                               <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Email:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="email address" name="email_id" id="email_id" style="width:200px;">
                                              </div>  
                                                                                          
                                              <span id="emailIdError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Card Number:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="card number" name="cardnumber_2" id="cardnumber_2" style="width:200px;">
                                              </div>
                                              
                                              <span id="cardnumber_2Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>CVC:</label>
                                                 </div>
                                                
                                                 <input type="text"  maxlength="4" placeholder="cvc" name="cvc_2" id="cvc_2" style="width:200px;">
                                              </div>
                                              
                                             <span id="cvc_2Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Invoice Id:</label>
                                                 </div>
                                                
                                                 <input type="text"  maxlength="4" placeholder="invoice id" name="invoiceid_2" id="invoiceid_2" style="width:200px;">
                                              </div> 
                                              
                                              <span id="invoiceid_2Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Expary Date:</label>
                                                 </div>
                                                
                                                 <div class="expiry-wrapper">
								                    <select class="card-expiry-month stripe-sensitive required" id="month_1" name="month_1" value="${ params?.month}" style ="width:105px;">
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
                                                 <input type="text"  class="" placeholder="email address" style="width: 150px;">
                                              </div>
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                  <input type="button" value="PROCEED" onclick="showEmailinfo()">
                                              </div>
                                              
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>    
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                                   
                            
                              </div>   <!-- row-fluid popup end -->
                              
                              
                              
                              
                              
                              
                              
   
    <!-- start of userfull info popup -->
   
               <div class="" id="myDiv5" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header  class="blockHeader headerGreen" -->
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>Card Information</h1>
                                             <a id="myDivPopupBoxClose5" onclick="closePopup5()"><img src="./images/cancel_dialog.png" height="25" width="25"/></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <g:form  action="nonInfo" name="nonuserForm" id="nonuserForm" class="newclass">
                                              
                                                                                 
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Card Number:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="card number" name="cardnumber_3" id="cardnumber_3" style="width:200px;">
                                              </div>
                                              
                                               <span id="cardnumber_3Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>CVC:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="cvc" name="cvc_3" id="cvc_3" style="width:200px;">
                                              </div>
                                              <span id="cvc_3Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Invoice Id:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="invoice id" name="invoiceid_3" id="invoiceid_3" style="width:200px;">
                                              </div> 
                                               <span id="invoiceid_3Error" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Expary Date:</label>
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
                                                 <input type="text"  class="" placeholder="email address" style="width: 150px;">
                                              </div>
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                   <input type="button" value="PROCEED" onclick="showNonifo()">
                                              </div>
                                              
                                             
                                               
                                             <div style="visibility:hidden;">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="Description" >
                                              </div>
                                               
                                               
                                              
                                              
                                              </g:form>
                                              
                                              </div>
                                              </div>
                                                
                                             </div>    
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                            
                              </div>   <!--row-fluid popup end-->
                              
                              
   <script src="../js/jquery.validate.js"></script>             
     
  
 </body>
</html>