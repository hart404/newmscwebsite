<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>
 <link rel="stylesheet" href="${resource(dir:'css',file:'ace.min.css')}" />
 
 <script type="text/javascript" src="https://js.stripe.com/v1/"></script>
<jq:resources/>
             
    <script src="../js/jquery.min.js"></script> 
   
		
  

<style type="text/css">

	
	#backgroundPopup1 { 
	z-index:1;
	position: fixed;
	display:none;
	height:100%;
	width:100%;
	background:#fcbe28;	
	top:0px;  
	left:0px;
}
 #myDiv {
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
    
		#myDivPopupBoxClose{
		    font-size:20px;  
		    line-height:15px;  
		    right:-15px;  
		    top:-15px;  
		    position:absolute;  
		    color:#6fa5e2;  
		    font-weight:500;      
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
		
 .table thead:first-child tr th{

   background: #BFA87C;
   
   height: 50px;
    font-size: 20px;
   font-weight: bold;

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
</head>
<body>
	<div id="gallery" class="mscGallery">
	</div>
	<script>
	 var billing_address_status = "true"
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

	   var popupStatus = 0;

	  /*  function disablePopup1() {
		   
			alert("inside popupStatus1 :::::::::")
			if(popupStatus1 == 1) { // if value is 1, close popup
				$("#myDiv").fadeOut("normal");  
				$("#backgroundPopup").fadeOut("normal");  
				//$(".menuContainer").fadeOut("normal"); 
				$(".menuContainer").css("opacity", "1");
				popupStatus1 = 0;  // and set value to 0
			}
		}*/

     function loadPopupBox2() { 
		 	
    	

			alert("inside load poupppp")
			if(popupStatus == 0) { // if value is 0, show popup
				
				$("#myDiv").fadeIn(0500); // fadein popup div
				$("#backgroundPopup1").css("opacity", "0.3"); // css opacity, supports IE7, IE8
				
				$("#backgroundPopup1").fadeIn(0001); 
			   $(".menuContainer").css("opacity", "0.3"); // css opacity, supports IE7, IE8
				
				$(".menuContainer").fadeIn(0001); 

				
				popupStatus = 1; // and set value to 1
			}	
	       
		} 
    

	function closePopup2() {  
		  
   		

   		if(popupStatus == 1) { // if value is 1, close popup
			$("#myDiv").fadeOut("normal");  
			$("#backgroundPopup1").fadeOut("normal");  
			//$(".menuContainer").fadeOut("normal"); 
			$(".menuContainer").css("opacity", "1");
			popupStatus = 0;  // and set value to 0
		}
     	
	}    
    

	
	function deleteData(id){

		  var response;
		   $.ajax({ type: "GET",                 
	 	         url: '${createLink(controller:'home', action:'deleteCartItem')}',	 	        
               async: false,
               data:{"product_id":id},		                
               success : function(text)
                 {
      	         response = text;
      	            if(response){

          	            window.location.href="../home/cartList"
          	         
                    }
                 }

         });
           
    }

    function checkoutTransation(){

                
                loadPopupBox2()

    }

    function addressCheck(blnchecked){
    	

    	
  		  if(blnchecked)
  	       {
  		       
  		         $('#billingAddressContainingDiv').hide()
  		          billing_address_status = "true"

  			    
  	       } 
  	       else
  	       {
  			     $('#billingAddressContainingDiv').show();
  			      billing_address_status = "false"

  	         
  	       }

  	 

    }

    function fullformValidation(){

    	alert("fffffffffffffffffffffffffffffffffffffff")
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


   /* validation for billing address */
   
   if(billing_address_status == "false"){
   
        var billing_address = document.getElementById("billing_address").value

        if(billing_address == ""){

        	$("#billing_addressError").html("You must enter an Address.")
            
        }

        var billing_city = document.getElementById("billing_city").value

        if(billing_city == ""){

        	$("#billing_cityError").html("You must enter a City.")
            
        }

        var billing_state = document.getElementById("billing_state").value

        if(billing_state == ""){

        	$("#billing_stateError").html("You must enter State.")
            
        }


        var billing_country = document.getElementById("billing_country").value

        if(billing_country == ""){

        	$("#billing_countryError").html("You must select a Country.")
            
        }


        var billing_zip = document.getElementById("billing_zip").value
        
        if( billing_zip == "" || isNaN( billing_zip ) || billing_zip.length != 5 )
        {
          
          if(billing_zip == ""){

        	  $("#billing_zipError").html("You must enter a Zip Code.")
          }else if(isNaN( billing_zip )){

        	  $("#billing_zipError").html("")
        	  $("#billing_zipError").html("You must enter Number.")
           }else{

        	  $("#billing_zipError").html("")
         	  $("#billing_zipError").html("You must enter the format #####.")
            }
          
          
        }
   }
   
   /* end of billing address */

        

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

   
				if(billing_address_status == "false"){
					alert("inside iffffffffffffff")
				
				   if(firstName !="" && lastName != "" && email != "" && address != "" && 
				    	     city != "" && state != "" && country != "" && zip != "" &&
				    	     phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && 
				    	     street != "" && billing_address != "" && 
				    	     billing_city != "" && billing_state != "" && billing_country != "" && billing_zip != "" && 
				        	billing_street != "" ){ 
				    	
				
				
					   alert("inside iffffffffffffff2222222222222222222")
				
				    	var myJSONText = "{'firstName':'"+firstName+
				    	"','lastName':'"+lastName+"','email':'"+email+"','address':'"+address+"','city':'"+city+
				    	"','state':'"+state+"','country':'"+country+"','zip':'"+zip+"','phone':'"+phone+"','cardnumber':'"+cardnumber+"','cvc':'"+cvc+
				    	"','invoiceid':'"+invoiceid+"','month':'"+month+"' ,'year':'"+year+
				    	"','street':'"+street+
				    	"','billing_state':'"+billing_state+"','billing_country':'"+billing_country+"','billing_zip':'"+billing_zip+
				    	"','billing_street':'"+billing_street+"','billing_address':'"+billing_address+"'}"
				
				           
				        
				              
				    	  var url = "../home/saveTransationForShoppingCart?data="+myJSONText;  
				    		$(location).attr('href',url);
				    } 
				}else{
					alert("inside iffffffffffffff4444444444444444444444444")
					 if(firstName !="" && lastName != "" && email != "" && address != "" && 
				    	     city != "" && state != "" && country != "" && zip != "" &&
				    	     phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && 
				    	     street != "" ){
				    	
				
				    	
						 alert("inside iffffffff66666666666666666666666666ffffff")
				
				    	 var myJSONText = "{'firstName':'"+firstName+
										"','lastName':'"+lastName+"','email':'"+email+"','address':'"+address+"','city':'"+city+
										"','state':'"+state+"','country':'"+country+"','zip':'"+zip+"','phone':'"+phone+"','cardnumber':'"+cardnumber+"','cvc':'"+cvc+
										"','invoiceid':'"+invoiceid+"','month':'"+month+"' ,'year':'"+year+"','street':'"+street+"'}"
				        
				              
				    	   var url = "../home/saveTransationForShoppingCart?data="+myJSONText;  
				    	     
							window.location.href=url
				     }           

				}    
    	
    }

	
	</script>
	
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
    <script type="text/javascript">
   
        var product_id = ""
    $(document).ready(function() {
    	 $('#billingAddressContainingDiv').hide()
    	
    	var response;
		 $.ajax({ type: "GET",                 
	 	         url: '${createLink(controller:'home', action:'cartListDetailsJSON')}',	 	        
                async: false,		                
                success : function(text)
                  {
       	         response = text;
       	         if(response){
                    }
                  }

       });
		 
		$('#demo').html( '<table  class="table table-striped table-bordered " id="example"></table>' );
		$('#example').dataTable({
			"aaData":response,
			"bFilter": false,
			"bLengthChange": false,	   
			"bPaginate": false,
			"bInfo":false,
          "aoColumns": [						
				{ "sTitle": " ","bSortable": false}, 			
				{ "sTitle": "Product" , "sClass": "center","bSortable": false},
				{ "sTitle": "Price" , "sClass": "center","bSortable": false},
				{ "sTitle": "Quantity", "sClass": "center" ,"bSortable": false},
				{ "sTitle": "Total" , "sClass": "center","bSortable": false},
				{ "sTitle": "Delete", "sClass": "center","bSortable": false}
				
				
				
				
			]
		});	
	
		
          });

        
        
	

	 
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		
		   <div style="float:left;color:#efdfab;margin-top:1%;margin-left: 1%;" >Showing</div><div style="float:left;margin-left: 1%;color:#efdfab;margin-top:1%;" id="showing_data_id"></div><div style="float:left;margin-left: 1%;color:#efdfab;margin-top:1%;" id="total_result_id"></div>
		</div>
			
			
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
			<div class="blockHeader headerGreen"  style="background:;width: 99%;">
				<h1 id="name_of_product" style="float:left" ></h1>
				<h1 id="price_of_product" style="float:right;margin-right: 1%;"></h1>
			</div>
			<div class="generalContainer">
			
			  <div id="productContainingDiv" style="background:;" class="formContainer">
				
			 			 <div id="demo" name="demo" style="background: ;width:100%;">
									                           
						 </div>
			  </div> <!-- end of productContainingDiv -->
			  
			   <div style="background:;">
				   <button onclick="checkoutTransation()"  class="saveBtn">Proceed To Checkout</button>
			 			
			  </div> 
				
			</div>
			<div class="blockFooter headerGreen"  style="background: ;width: 100%;">
            </div>          
			
		</div>
		</div>
    </div>
    <g:render template="/widget/updateHtmlWidgetDialog" plugin="simple-cms" />
    <g:render template="/widget/updatePhotoWidget" plugin="simple-cms" />
    <g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
    
    <div id="backgroundPopup1"></div>
   
     <!-- start of userfull info popup -->
   
               <div class="" id="myDiv" style="float: right;" >
                                <!--span-->
                                <div class="span12">
                                    <!--box-->
                                    
                                        <!--box header  class="blockHeader headerGreen" -->
                                        <div  style="margin-top: -1px;width:98.5%;" class="blockHeader headerGreen"  >
                                           <h1>Card Information</h1>
                                             <a id="myDivPopupBoxClose" onclick="closePopup2()"><img src="<g:createLinkTo dir='images/layout' file='cancel_dialog.png'/>" height="25" width="25" /></a>
                                               </div>
                                             
                                             <div class="bodyGreen" style="background: white;">
                                             
                                                                  
									        <div class="generalContainer" style="width:93%;height:500px;">
									        
										    <div class="formContainer" style="width:93%;height:488px;" id="scroll">
                                             
                                              <g:form  action="donateInfo" name="cardInfoForm" id="cardInfoForm" class="newclass">
                                              
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
                                                    <label style="font-weight: bold;">Billing Address</label>
                                                    </div>
                                                       <input type="text"  class="" style="width:200px;visibility:hidden;">
                                                </div>
                                               
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
                                                 <label Style="font-weight: bold;">Shipping Address</label>
                                                 </div>
                                                 
                                                      <input type="checkbox" onclick="addressCheck(this.checked);" style="float: left;background: red;" checked="checked">
                                                        <label style="margin-left: 10px;">Same As Billing Address</label>
                                                
                                              </div>
                                              
                                              
                                              <!-- start of billing address -->
                                              <div id="billingAddressContainingDiv">
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                                     <label style="visibility:hidden;">Na</label>
                                                    <label>Address:</label>
                                                    </div>
                                                 <input type="text"  class="" placeholder="address" name="billing_address" id="billing_address" style="width:200px;">
                                              </div>
                                              <span id="billing_addressError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>City:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="city" name="billing_city" id="billing_city" style="width:200px;">
                                              </div>
                                              <span id="billing_cityError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Street:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="street" name="billing_street" id="billing_street" style="width:200px;">
                                              </div>
                                              <span id="billing_streetError" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>State:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="state" name="billing_state" id="billing_state" style="width:200px;">
                                              </div>
                                              <span id="billing_stateError" style="color:#F70000;margin-left:150px;"></span>
                                              <div style="">
                                                 <div style="width:30%;background:;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Country:</label>
                                                 </div>
                                           
                                                 
                                                 <g:countrySelect type="text"  name="billing_country" id="billing_country"  value="${ params?.country}" 
												                                                noSelection="['':'-Choose your country-']" multiple="false"  style ="width:202px;"/>
                                              </div>
                                              <span id="billing_countryError" style="color:#F70000;margin-left:150px;"></span>
                                             <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Zip:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="zip" name="billing_zip" id="billing_zip" style="width:200px;">
                                              </div>
                                              <span id="billing_zipError" style="color:#F70000;margin-left:150px;"></span>
                                              </div>
                                              <!-- end of billing address -->
                                              
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
                                            
                                            
                                               <div style="">
                                                <div style="width:30%;background: ;float: left;visibility:hidden;">
                                                     <label style="visibility:hidden;">Na</label>
                                                 <label>Description:</label>
                                                 </div>
                                                
                                                  <input type="button"  class="saveBtn" value="Proceed" onclick="fullformValidation();">
                                                  
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
   <script src="../js/jquery.dataTables.min.js"></script>
		<script src="../js/jquery.dataTables.bootstrap.js"></script> 
 </body>
</html>