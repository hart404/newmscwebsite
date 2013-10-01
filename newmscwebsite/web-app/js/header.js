/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var bas_cal,dp_cal,ms_cal;    

  window.onload = function () {
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date1'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date2'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date3'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date4'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date5'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date6'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date7'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date8'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date9'));
    dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('date10'));    
  };
  
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

   	    		
   	    		recuringType = document.getElementById("recurring_type").value
   	    		
   		}

	}


	
	
	
}

   function fullformValidation(){

		
		var firstName = document.getElementById("fname").value

		var lastName = document.getElementById("lname").value
		
		if(firstName == ""){
	         
			$("#firstNameError").html("You must enter a First Name.")

	    }



	    if(lastName == ""){

	    	
	    	$("#lastNameError").html("You must enter a Last Name.")

	    }
	    var email = document.getElementById("email").value
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
			//return false;
			
		}



	var month = document.getElementById("month").value
	var year = document.getElementById("year").value

    
    var description = document.getElementById("description").value

	
	
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



