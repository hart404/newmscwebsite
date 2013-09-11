
<style type="text/css">

	#myDiv2 {
	font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
    background: none repeat scroll 0 0 #FFFFFF;
      /*border: 10px solid #ccc;
    border-radius: 3px 3px 3px 3px; */
    color: #333333;
    display: none;
	font-size: 14px;
    left: 50%;
    margin-left: -402px;
    position: fixed;
    top: 10%;
    width: 600px;
    z-index: 2; 
    
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
		
		
		
	#myDiv3 {
	font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
    background: none repeat scroll 0 0 #FFFFFF;
      /*border: 10px solid #ccc;
    border-radius: 3px 3px 3px 3px; */
    color: #333333;
    display: none;
	font-size: 14px;
    left: 50%;
    margin-left: -402px;
    position: fixed;
    top: 10%;
    width: 600px;
    z-index: 2; 
    
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
		
		
#myDiv4 {
	font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
    background: none repeat scroll 0 0 #FFFFFF;
      /*border: 10px solid #ccc;
    border-radius: 3px 3px 3px 3px; */
    color: #333333;
    display: none;
	font-size: 14px;
    left: 50%;
    margin-left: -402px;
    position: fixed;
    top: 10%;
    width: 600px;
    z-index: 2; 
    
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
		
		
		
 #myDiv5 {
	font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
    background: none repeat scroll 0 0 #FFFFFF;
      /*border: 10px solid #ccc;
    border-radius: 3px 3px 3px 3px; */
    color: #333333;
    display: none;
	font-size: 14px;
    left: 50%;
    margin-left: -402px;
    position: fixed;
    top: 10%;
    width: 600px;
    z-index: 2; 
    
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
    color: rgb(84, 83, 74);}
    
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

		#scroll {
			  
				  
				    height:652px;
				    background: transparent;
				    overflow-y: scroll;
				}
				#scroll::-webkit-scrollbar {
				    width: 12px;
				}
				
				#scroll::-webkit-scrollbar-track {
				    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
				    border-radius: 10px;
				}
				
				#scroll::-webkit-scrollbar-thumb {
				    border-radius: 10px;
				    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
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
 var popupStatus3 = 0;
 var popupStatus4 = 0;
 var popupStatus2 = 0;
 
   function showDonate(){

    loadPopupBox3();
     	
          

  }

   function disablePopup1() {
	   
		if(popupStatus1 == 1) { // if value is 1, close popup
			$("#myDiv3").fadeOut("normal");  
			$("#backgroundPopup").fadeOut("normal");  
			//$(".menuContainer").fadeOut("normal"); 
			$(".menuContainer").css("opacity", "1");
			popupStatus1 = 0;  // and set value to 0
		}
	}
  
var amount
var recuringType ;
function showcredicardInfo(){


	 amount = document.getElementById("donationamount").value
	

	var amount_in = Number(amount)
    
    
    
	
    if(amount == ""){

	      $("#error1").html("You must enter donation amount")
   }else{

	   var letters = /^[0-9]+$/;  
		if(amount.match(letters) )  
		{  
            
		 
		    $("#error1").html("")
		    
		    if(amount_in >= 10){

		    	 var test = $("#radio11").is(":checked")
				  amount_val = amount; 

				  if($("#radio1").is(":checked")){
					  
					    disablePopup1();
		              loadPopupBox2();
		              
				   }


				 if($("#radio2").is(":checked")){
					 
		              disablePopup1();
		              loadPopupBox4();
				   }

		            if($("#radio3").is(":checked")){
					 
		             disablePopup1();
		             loadPopupBox5();
				   }
			 }else{

				 $("#error1").html("You must enter a minimum $10 amount.")

		       }

		 
          

    	 
    		 
		  
		}  
		else  
		{  
		  
		  $("#error1").html("You must enter a valid dollar amount")
		 
		} 



		  if($("#radio11").is(":checked")){

   	    	recuringType = "One-time"
   		 }

   	    if($("#radio22").is(":checked")){

   	    	//recuringType = "recurring donation"
   	    		
   	    		recuringType = document.getElementById("recurring_type").value
   	    		
   		}

	}


	
	
	
}

   function fullformValidation(){

		
		var firstName = document.getElementById("fname").value

		var lastName = document.getElementById("lname").value
		
		if(firstName == ""){
	         
			$("#firstNameError").html("You must enter a First Name.")
			//return false;
	    }
	    
	    //else{

	    	//$("#firstNameError").html("")
	     //}


	    if(lastName == ""){

	    	
	    	$("#lastNameError").html("You must enter a Last Name.")
	    	//return false;

	    }
	    var email = document.getElementById("email").value
	    //var x=document.forms["myForm"]["email"].value;
	    var atpos=email.indexOf("@");
	    var dotpos=email.lastIndexOf(".");
	    
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
	      {
	         if(email == ""){
	             
	         	$("#emailError").html("You must enter an Email.")
	         }else{

	        	 $("#emailError").html("")
	             $("#emailError").html("You must enter a valid Email.")
	         }
	        
	        //return false;
	     }

	    var address = document.getElementById("address").value

	    if(address == ""){

	    	$("#addressError").html("You must enter an Address.")
	    	//return false;
	        
	    }

	    var city = document.getElementById("city").value

	    if(city == ""){

	    	$("#cityError").html("You must enter a City.")
	    	//return false;
	        
	    }

	    var state = document.getElementById("state").value

	    if(state == ""){

	    	$("#stateError").html("You must enter State.")
	    	//return false;
	        
	    }


	    var country = document.getElementById("country").value

	    if(country == ""){

	    	$("#countryError").html("You must select a Country.")
	    	//return false;
	        
	    }


	    var zip = document.getElementById("zip").value
	    
	    if( zip == "" || isNaN( zip ) || zip.length != 5 )
	    {
	      
	      if(zip == ""){

	    	  $("#zipError").html("You must enter a Zip Code.")
	      }else if(isNaN( zip )){

	    	  $("#zipError").html("")
	    	  $("#zipError").html("You must enter Number.")
	       }else{

	    	  $("#zipError").html("")
	     	  $("#zipError").html("You must enter the format #####.")
	        }
	      
	      //return false;
	      
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
	      
	      //return false;
	      
	    }


	 var cardnumber = document.getElementById("cardnumber").value
	 
	 if( cardnumber == "" || isNaN( cardnumber ) || cardnumber.length != 15 )
	 {
	   if(cardnumber == ""){

	 	  $("#cardError").html("You must enter your Credit Card Number.")
	   }else if(isNaN( cardnumber )){

	 	  $("#cardError").html("")
	 	  $("#cardError").html("You must enter Number.")
	    }else{

	 	  $("#cardError").html("")
	  	   $("#cardError").html("You must enter the format ###############.")
	     }
	   
	   //return false;
	   
	 }


	  var cvc = document.getElementById("cvc").value
	 
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
	   
	   //return false;
	   
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
	  
	  //return false;
	}

		var street = document.getElementById("street").value
		if(street == ""){
		
			$("#streetError").html("You must enter Street.")
			//return false;
			
		}
		
		//else{
			//$("#streetError").html("")
	  // }


	var month = document.getElementById("month").value
	var year = document.getElementById("year").value

    
    var description = document.getElementById("description").value
    
    
    //if(description == ""){
    
       //$("#streetError").html("You must enter Street.")
       
    //}
	
	
	if(firstName !="" && lastName != "" && email != "" && address != "" && city != "" && state != "" && country != "" && zip != "" && phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && street != ""){
		


		

		var myJSONText = "{'firstName':'"+firstName+
		"','lastName':'"+lastName+"','email':'"+email+"','address':'"+address+"','city':'"+city+
		"','state':'"+state+"','country':'"+country+"','zip':'"+zip+"','phone':'"+phone+"','cardnumber':'"+cardnumber+"','cvc':'"+cvc+
		"','invoiceid':'"+invoiceid+"','month':'"+month+"' ,'year':'"+year+"','amount':'"+amount+"','street':'"+street+"','recuringType':'"+recuringType+"','description':'"+description+"'}"

	    
	          
		    var url = "./home/saveFullinfoData?data="+myJSONText;  
		    //var url = "./home";    
			$(location).attr('href',url);
	}
	    
		
	}


	   function showEmailinfo(){


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
		    
		    
			if( cardnumber_2 == "" || isNaN( cardnumber_2 ) || cardnumber_2.length != 15 )
			 {
			   if(cardnumber_2 == ""){
			
			 	  $("#cardnumber_2Error").html("You must enter your Credit Card Number.")
			   }else if(isNaN( cardnumber_2 )){
			
			 	  $("#cardnumber_2Error").html("")
			 	  $("#cardnumber_2Error").html("You must enter Number.")
			    }else{
			
			 	  $("#cardnumber_2Error").html("")
			  	   $("#cardnumber_2Error").html("You must enter the format ###############.")
			     }
			   
			   
			 }
		    
		    
		    
		    var recuringType ;

		    if($("#radio2").is(":checked")){

		    	recuringType = "one time donation"
			 }

		    if($("#radio1").is(":checked")){

		    	recuringType = "recurring donation"
			 }


		    if(name != "" && email_id != "" && cvc_2 != "" && invoiceid_2 != "" && cardnumber_2 != ""){




			    var myJSONText = "{'name':'"+name+
				"','email_id':'"+email_id+"','cvc_2':'"+cvc_2+"','invoiceid_2':'"+invoiceid_2+
				 "','month':'"+month_1+"' ,'year':'"+year_1+"','amount':'"+amount+"','cardnumber':'"+cardnumber_2+"','recuringType':'"+recuringType+"'}"

			    
			          
				    var url = "./home/saveNameEmail?data="+myJSONText;  
				      
					$(location).attr('href',url);
			    

			}
		   
		  
		  
	        
	   }


	   function showNonifo(){



	       
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
		    
		    
		    if( cardnumber_3 == "" || isNaN( cardnumber_3 ) || cardnumber_3.length != 15 )
			 {
			   if(cardnumber_3 == ""){
			
			 	  $("#cardnumber_3Error").html("You must enter your Credit Card Number.")
			   }else if(isNaN( cardnumber_3 )){
			
			 	  $("#cardnumber_3Error").html("")
			 	  $("#cardnumber_3Error").html("You must enter Number.")
			    }else{
			
			 	  $("#cardnumber_3Error").html("")
			  	   $("#cardnumber_3Error").html("You must enter the format ###############.")
			     }
			   
			   
			 }
		    

		    if( cvc_3 != "" && invoiceid_3 != "" && cardnumber_3 != ""){


			   


			    var myJSONText = "{'cvc_3':'"+cvc_3+"','invoiceid_3':'"+invoiceid_3+
				 "','month':'"+month_3+"' ,'year':'"+year_3+"','amount':'"+amount+"','cardnumber':'"+cardnumber_3+"','recuringType':'"+recuringType+"'}"

			    
			          
				    var url = "./home/saveNonData?data="+myJSONText;  
				      
					$(location).attr('href',url);
			    

			}

	   }
	  
	  
	  /*  function loadPopupBox3() { 
		 	
		
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
	   
	}*/

  
	    
	    function loadPopupBox2() { 
		 	
	 		
	        
	       
			
			
				if(popupStatus2 == 0) { // if value is 0, show popup
					
					$("#myDiv2").fadeIn(0500); // fadein popup div
					$("#backgroundPopup").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$("#backgroundPopup").fadeIn(0001); 
				   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$(".menuContainer").fadeIn(0001); 

					
					popupStatus2 = 1; // and set value to 1
				}	
			
	       
		} 
    

	function unloadPopupBox2() {  
		  
   		
   		if(popupStatus2 == 1) { // if value is 1, close popup
					$("#myDiv2").fadeOut("normal");  
					$("#backgroundPopup").fadeOut("normal");  
					//$(".menuContainer").fadeOut("normal"); 
					$(".menuContainer").css("opacity", "1");
					popupStatus2 = 0;  // and set value to 0
				}
     	
	}    

  

	function closePopup2(){
	
	   	unloadPopupBox2();
	   
	}

   
    function loadPopupBox4() { 
	 	
	
 	
        
				if(popupStatus3 == 0) { // if value is 0, show popup
					
					$("#myDiv4").fadeIn(0500); // fadein popup div
					$("#backgroundPopup").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$("#backgroundPopup").fadeIn(0001); 
				   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$(".menuContainer").fadeIn(0001); 

					
					popupStatus3 = 1; // and set value to 1
				}	
			
       
	} 

			
			function unloadPopupBox4() {  
				  
					
					if(popupStatus3 == 1) { // if value is 1, close popup
					$("#myDiv4").fadeOut("normal");  
					$("#backgroundPopup").fadeOut("normal");  
					//$(".menuContainer").fadeOut("normal"); 
					$(".menuContainer").css("opacity", "1");
					popupStatus3 = 0;  // and set value to 0
				}
			 	
			}    
			
			
			
			function closePopup4(){
			
			   	unloadPopupBox4();
			   
			}
			
			function loadPopupBox5() { 
			 	
				
				if(popupStatus4 == 0) { // if value is 0, show popup
					
					$("#myDiv5").fadeIn(0500); // fadein popup div
					$("#backgroundPopup").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$("#backgroundPopup").fadeIn(0001); 
				   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
					
					$(".menuContainer").fadeIn(0001); 

					
					popupStatus4 = 1; // and set value to 1
				}	
			   
			} 
			
			
			function unloadPopupBox5() {  
			  
				
				
					if(popupStatus4 == 1) { // if value is 1, close popup
					$("#myDiv5").fadeOut("normal");  
					$("#backgroundPopup").fadeOut("normal");  
					//$(".menuContainer").fadeOut("normal"); 
					$(".menuContainer").css("opacity", "1");
					popupStatus4 = 0;  // and set value to 0
				}
				
			}    
			
			
			
			function closePopup5(){
			
				unloadPopupBox5();
			
			} 


</script>

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
		<a href="<g:createLink controller="person" action='registerUser'/>"><img src="${emailIcon}" alt="Email" onmouseover="this.src='${emailIconOn}}'" onmouseout="this.src='${emailIcon}'"/></a> 
		<a href="http://www.facebook.com/pages/McDowell-Sonoran-Conservancy/163961445687?ref=ts" target="_blank"><img src="${facebookIcon}" alt="Facebook"  onmouseover="this.src='${facebookIconOn}'" onmouseout="this.src='${facebookIcon}'"/></a> 
		<a href="http://twitter.com/McDowellSonoran" target="_blank"><img src="${twitterIcon}" alt="Twitter"  onmouseover="this.src='${twitterIconOn}'" onmouseout="this.src='${twitterIcon}'"/></a> 
		<a href="http://mcdowellsonoranconservancy.wordpress.com/" target="_blank"><img src="${rssIcon}" alt="Blogspot"  onmouseover="this.src='${rssIconOn}'" onmouseout="this.src='${rssIcon}'"/></a>
        <div class="searchBar">
            <g:form name="searchSite" url="[action:'search',controller:'home']" class='searchForm'>
                <input type="text" name="searchInput" class="searchInput" placeholder="SEARCH"/>
                <input type="image" value="Submit" class="searchButton" alt="Submit" src="<g:createLinkTo dir='images/layout' file='img_searchButton-27x24.png'/>"/>
            </g:form>
            <p></p>
        </div>
	</div>
	<div class="topMenu">
		<ul class="topMenuList">
			<li class="topMenuListItem"><a href="#"  class="parent" id="donateNow"><span>DONATE NOW</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='newsItem' action='index' />" class="parent"><span>NEWS</span></a></li>
			<li class="topMenuListItem"><a href="<g:createLink controller='event' action='index' />" class="parent"><span>EVENTS</span></a></li>
		</ul>
	</div>
</div>






  <!-- start of userfull info popup -->
  
   <div class="" id="myDiv2" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>CONTACT IFORMATION</h1>
                                             <a id="myDivPopupBoxClose2"  onclick="unloadPopupBox2();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;" id="scroll">
                                             
                                              <g:form  action="donateInfo" name="cardInfoForm" id="cardInfoForm" class="newclass" >
                                              
                                              <div style="">
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Contact Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name="vehicle" value="Bike" style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>
                                              
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
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Credit Card Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name=""  style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Card Number:</label>
                                                 </div>
                                                
                                                 <input type="text"  maxlength="20"  placeholder="card number" name="cardnumber" id="cardnumber" style="width:200px;">
                                              </div>
                                              <span id="cardError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                     
                                              
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
                                                
                                                  <input type="button" value="PROCEED" onclick="fullformValidation();" class="saveBtn">
                                                  
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
                                           
                                             <a id="myDivPopupBoxClose3" class="close"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>                                            
                                             
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;" id="scroll">
										    
										    <h2 style="color: black;margin-top: -5px;">Add to Giving Cart</h2>
                                             
                                              <g:form  action="cartInfo"  id="cartInfoForm" class="newclass" name="cartInfoForm">
                                              
                                                  <div style="width:100%;background:;height:140px;">
                                                    
                                                    <div style="width:39%;background:;float:left;"> 
                                                       <div style="">
		                                                 
		                                                 <label style="font-weight: bold; ">I want to contribute:</label>
		                                                <div style="width:100%;background:;">
		                                                 $ <input type="text" class="" placeholder="" name="donationamount" id="donationamount" style="width:100px;" required="required" > .00 USD  to
		                                              </div>
		                                              </div>
		                                              <label id="error1" style="color:#F70000;font-size:13px;"></label>
                                                      <span>($10 USD minimum)</span>
                                                    
                                                    </div>
                                                   
                                                  
                                                   <div style="width:61%;background:;float:left;">
                                                        
                                                        <span style="margin-left:40px;float:left;font-size:18px; "> McDowell Sonoran Land Conservancy</span>
														<span style="margin-left:35px;float:left;font-size:18px; ">16435 N Scottsdale Rd Ste #110 </span>
														<span style="margin-left:40px;float:left;font-size:18px; ">Scottsdale, AZ</span>
														<span style="margin-left:40px;float:left;font-size:18px; ">85254 </span>
                                                   </div>
                                                  </div>
                                              
                                              
                                               
                                              
                                               <div style="visibility:hidden;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                                 
                                                 <div>
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label style="font-weight: bold; ">Donation Preferences:</label>
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
                                                   <label style="font-weight: bold; ">Please share with this charity:</label>
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
                                                  <div style="width:40%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label style="font-weight: bold; ">Designation:</label>
                                                </div>
                                                 <g:select name="title" from="${['', 'Mr', 'Mrs', 'Ms', 'Dr', 'Professor']}"  noSelection="['': '']" style="width:200px;float: left;" />
                                              </div>
										   
                                             <div style="visibility:hidden;width:100%;">                                               
                                                   <label style="visibility:hidden;">Na</label>
                                                   <label>Please share with this charity:</label>
                                                 </div>
                                             <div style="">
                                                  <div style="width:40%;background:;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label style="font-weight: bold; ">Dedication or Gift:</label>
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
                                                    <input type="button" value="ADD TO GIVING CART" onclick="showcredicardInfo();" class="saveBtn">
                                                    
                                                    
                                                 
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
                                           <h1>NAME AND EMAIL</h1>
                                             <a id="myDivPopupBoxClose4" onclick="unloadPopupBox4();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <g:form  action="userInfo" name="userForm" id="userForm" class="newclass">
                                              
                                                <div style="">
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Name And Email Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name=""  style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>
                                              
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
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Credit Card Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name=""  style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>
                                              
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
                                                
                                                  <input type="button" value="PROCEED" onclick="showEmailinfo()" class="saveBtn">
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
                                           <h1>CREDIT CARD INFORMATION</h1>
                                             <a id="myDivPopupBoxClose5" onclick="unloadPopupBox5();"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;">
                                             
                                              <g:form  action="nonInfo" name="nonuserForm" id="nonuserForm" class="newclass">
                                              
                                                   <div style="">
                                                 <div style="width:100%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label Style="font-weight: bold;">Card Information</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" name=""  style="background: ;visibility: hidden;">
                                                        
                                                
                                              </div>                                
                                              
                                              
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
                                                
                                                   <input type="button" value="PROCEED" onclick="showNonifo()" class="saveBtn">
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
