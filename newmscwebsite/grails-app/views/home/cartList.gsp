
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>
 <link rel="stylesheet" href="${resource(dir:'css',file:'ace.min.css')}" />
 

<script type="text/javascript" src="https://js.stripe.com/v1/"></script>

             
<link rel="stylesheet" href="${resource(dir:'css',file:'grid/style.css')}" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"> </script>
<script src="../js/script.js"></script> 
		
  

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
                  var productid = id;
                  var dataString = 'product_id='+ productid;
          $.ajax({ 
                    type: "GET",                 
                    url: '${createLink(controller:'home', action:'deleteCartItem')}',
                          //async: false,
                    data : dataString,
                    cache : false,
                    success : function(text)
                    {
                             //alert("Removed Successfully");
                      location.reload();
     //                        response = text;
     //                        if(response){
     //                       window.location.href="cartList"
     //               
     //                    }
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


    	
    	var firstName = document.getElementById("fname_data").value

    	var lastName = document.getElementById("lname_data").value
    	
   	 
    	if(firstName == ""){

             
    		$("#firstNameError1").html("You must enter a First Name.")
        }else{


        	$("#firstNameError1").html("")
         }


        if(lastName == ""){

        	
        	$("#lastNameError1").html("You must enter a Last Name.")

        }
        var email = document.getElementById("email_data").value
        //var x=document.forms["myForm"]["email"].value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
          {
             if(email == ""){
                 
             	$("#emailError1").html("You must enter an Email.")
             }else{

            	 $("#emailError1").html("")
                 $("#emailError1").html("You must enter a valid Email.")
             }
            
         }

        var address = document.getElementById("address_data").value


        if(address == ""){

        	$("#addressError1").html("You must enter an Address.")
            
        }

        var city = document.getElementById("city_data").value

        if(city == ""){

        	$("#cityError1").html("You must enter a City.")
            
        }

        var state = document.getElementById("state_data").value

        if(state == ""){

        	$("#stateError1").html("You must enter State.")
            
        }


        var country = document.getElementById("country_data").value

        if(country == ""){

        	$("#countryError1").html("You must select a Country.")
            
        }


        var zip = document.getElementById("zip_data").value
        
        if( zip == "" || isNaN( zip ) || zip.length != 5 )
        {
          
          if(zip == ""){

        	  $("#zipError1").html("You must enter a Zip Code.")
          }else if(isNaN( zip )){

        	  $("#zipError1").html("")
        	  $("#zipError1").html("You must enter Number.")
           }else{

        	  $("#zipError1").html("")
         	  $("#zipError1").html("You must enter the format #####.")
            }
          
          
        }


   /* validation for billing address */
   
   if(billing_address_status == "false"){
   
        var billing_address = document.getElementById("billing_address").value

        if(billing_address == ""){

        	$("#billing_addressError1").html("You must enter an Address.")
            
        }

        var billing_city = document.getElementById("billing_city").value

        if(billing_city == ""){

        	$("#billing_cityError1").html("You must enter a City.")
            
        }

        var billing_state = document.getElementById("billing_state").value

        if(billing_state == ""){

        	$("#billing_stateError1").html("You must enter State.")
            
        }


        var billing_country = document.getElementById("billing_country").value

        if(billing_country == ""){

        	$("#billing_countryError1").html("You must select a Country.")
            
        }


        var billing_zip = document.getElementById("billing_zip").value
        
        if( billing_zip == "" || isNaN( billing_zip ) || billing_zip.length != 5 )
        {
          
          if(billing_zip == ""){

        	  $("#billing_zipError1").html("You must enter a Zip Code.")
          }else if(isNaN( billing_zip )){

        	  $("#billing_zipError1").html("")
        	  $("#billing_zipError1").html("You must enter Number.")
           }else{

        	  $("#billing_zipError1").html("")
         	  $("#billing_zipError1").html("You must enter the format #####.")
            }
          
          
        }
   }
   
   /* end of billing address */

        

     var phone = document.getElementById("phone_data").value
        
        if( phone == "" || isNaN( phone ) || phone.length != 10 )
        {
          if(phone == ""){

        	  $("#phoneError1").html("You must enter a Phone Number.")
          }else if(isNaN( phone )){

        	  $("#phoneError1").html("")
        	  $("#phoneError1").html("You must enter Number.")
           }else{

        	  $("#phoneError1").html("")
         	  $("#phoneError1").html("You must enter the format ##########.")
            }
          
          
        }


     var cardnumber = document.getElementById("cardnumber_data").value
     
     if( cardnumber == "" || isNaN( cardnumber ) || cardnumber.length != 20 )
     {
       if(cardnumber == ""){

     	  $("#cardError1").html("You must enter your Credit Card Number.")
       }else if(isNaN( cardnumber )){

     	  $("#cardError1").html("")
     	  $("#cardError1").html("You must enter Number.")
        }else{

     	  $("#cardError1").html("")
      	   //$("#cardError").html("You must enter the format ####################.")
         }
       
       
     }


      var cvc = document.getElementById("cvc_data").value
     
     if( cvc == "" || isNaN( cvc ) || cvc.length != 3 )
     {
       if(cvc == ""){

     	  $("#cvcError1").html("Please enter the credit card's security code.")
     	  
       }else if(isNaN( cvc )){

     	  $("#cvcError1").html("")
     	  $("#cvcError1").html("You must enter Number.")
        }else{

     	  $("#cvcError1").html("")
      	  $("#cvcError1").html("You must enter the format ###.")
         }
       
       
     }

     
    var invoiceid = document.getElementById("invoiceid_data").value

    if( invoiceid == "" || isNaN( invoiceid ) || invoiceid.length != 3 )
    {
      if(invoiceid == ""){

    	  $("#invoiceError1").html("Please enter the InvoiceId.")
    	  
      }else if(isNaN( invoiceid )){

    	  $("#invoiceError1").html("")
    	  $("#invoiceError1").html("You must enter Number.")
       }else{

    	  $("#invoiceError1").html("")
     	  $("#invoiceError1").html("You must enter the format ###.")
        }
      
      
    }

    	var street = document.getElementById("street_data").value
    	if(street == ""){
    	
    		$("#streetError1").html("You must enter Street.")
    		
    	}else{
    		$("#streetError1").html("")
       }


    var month = document.getElementById("month_name").value
    var year = document.getElementById("year_name").value

   
				if(billing_address_status == "false"){
				
				   if(firstName !="" && lastName != "" && email != "" && address != "" && 
				    	     city != "" && state != "" && country != "" && zip != "" &&
				    	     phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && 
				    	     street != "" && billing_address != "" && 
				    	     billing_city != "" && billing_state != "" && billing_country != "" && billing_zip != "" && 
				        	billing_street != "" ){ 
				    	
				
				
				    	
				
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

					 if(firstName !="" && lastName != "" && email != "" && address != "" && 
				    	     city != "" && state != "" && country != "" && zip != "" &&
				    	     phone != "" && cardnumber != "" && cvc != "" && invoiceid != "" && 
				    	     street != "" ){
				    	
				
				    	
				    	
				
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
			 			<a href ="/newmscwebsite/home/shoppingCart">Continue Shopping</a>
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
                                                 <input type="text" class="" placeholder="first name" name="fname_data" id="fname_data" style="width:200px;">
                                              </div>
                                              <span id="firstNameError1"  name="firstNameError1" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="">
                                               <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Last Name:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="last name" name="lname_data" id="lname_data" style="width:200px;">
                                              </div>
                                              <span id="lastNameError1" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="">
                                              
                                               <div style="width:30%;background: ;float: left;">
                                                <label style="visibility:hidden;">Na</label>
                                                 <label >Email:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="email address" name="email_data" id="email_data" style="width:200px;">
                                              </div>
                                              <span id="emailError1" style="color:#F70000;margin-left:150px;"></span>
                                               <div style="background: ;">                                               
                                               
                                               <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label >Phone:</label>                                               
                                               </div>                                                 
                                                 
                                                 <input type="text"  class="" placeholder="phone number" name="phone_data" id="phone_data" style="width:200px;">
                                              </div>
                                              <span id="phoneError1" style="color:#F70000;margin-left:150px;"></span>
                                              
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
                                                 <input type="text"  class="" placeholder="address" name="address_data" id="address_data" style="width:200px;">
                                              </div>
                                              <span id="addressError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>City:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="city" name="city_data" id="city_data" style="width:200px;">
                                              </div>
                                              <span id="cityError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Street:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="street" name="street_data" id="street_data" style="width:200px;">
                                              </div>
                                              <span id="streetError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>State:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="state" name="state_data" id="state_data" style="width:200px;">
                                              </div>
                                              <span id="stateError1" style="color:#F70000;margin-left:150px;"></span>
                                              <div style="">
                                                 <div style="width:30%;background:;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Country:</label>
                                                 </div>
                                           
                                                 
                                                 <g:countrySelect type="text"  name="country_data" id="country_data"  value="${ params?.country}" 
												                                                noSelection="['':'-Choose your country-']" multiple="false"  style ="width:202px;"/>
                                              </div>
                                              <span id="countryError1" style="color:#F70000;margin-left:150px;"></span>
                                             <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Zip:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="zip" name="zip_data" id="zip_data" style="width:200px;">
                                              </div>
                                              <span id="zipError1" style="color:#F70000;margin-left:150px;"></span>
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
                                              <span id="billing_addressError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>City:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="city" name="billing_city" id="billing_city" style="width:200px;">
                                              </div>
                                              <span id="billing_cityError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                                <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Street:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="street" name="billing_street" id="billing_street" style="width:200px;">
                                              </div>
                                              <span id="billing_streetError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>State:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="state" name="billing_state" id="billing_state" style="width:200px;">
                                              </div>
                                              <span id="billing_stateError1" style="color:#F70000;margin-left:150px;"></span>
                                              <div style="">
                                                 <div style="width:30%;background:;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Country:</label>
                                                 </div>
                                           
                                                 
                                                 <g:countrySelect type="text"  name="billing_country" id="billing_country"  value="${ params?.country}" 
												                                                noSelection="['':'-Choose your country-']" multiple="false"  style ="width:202px;"/>
                                              </div>
                                              <span id="billing_countryError1" style="color:#F70000;margin-left:150px;"></span>
                                             <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Zip:</label>
                                                 </div>
                                                 <input type="text"  class="" placeholder="zip" name="billing_zip" id="billing_zip" style="width:200px;">
                                              </div>
                                              <span id="billing_zipError1" style="color:#F70000;margin-left:150px;"></span>
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
                                                
                                                 <input type="text"  maxlength="20"  placeholder="card number" name="cardnumber_data" id="cardnumber_data" style="width:200px;">
                                              </div>
                                              <span id="cardError1" style="color:#F70000;margin-left:150px;"></span>
                                           
                                              
                                              <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>CVC:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="cvc" name="cvc_data" id="cvc_data" style="width:200px;">
                                              </div>
                                              <span id="cvcError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Invoice Id:</label>
                                                 </div>
                                                
                                                 <input type="text"  class="" placeholder="invoice id" name="invoiceid_data" id="invoiceid_data" style="width:200px;">
                                              </div> 
                                              
                                              <span id="invoiceError1" style="color:#F70000;margin-left:150px;"></span>
                                              
                                              
                                               <div style="">
                                                 <div style="width:30%;background: ;float: left;">
                                               <label style="visibility:hidden;">Na</label>
                                                 <label>Expiration Date:</label>
                                                 </div>
                                                
                                                 <div class="expiry-wrapper">
								                    <select class="card-expiry-month stripe-sensitive required" id="month_name" name="month_name" value="${ params?.month}" style ="width:105px;">
								                    </select>
								                    <script type="text/javascript">
								                        var select = $(".card-expiry-month"),
								                            month = new Date().getMonth() + 1;
								                        for (var i = 1; i <= 12; i++) {
								                            select.append($("<option value='"+i+"' "+(month === i ? "selected" : "")+">"+i+"</option>"))
								                        }
								                    </script>
								                    <span> / </span>
								                    <select class="card-expiry-year stripe-sensitive required" id="year_name" name="year_name" value="${ params?.year}" style ="width:105px;"></select>
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