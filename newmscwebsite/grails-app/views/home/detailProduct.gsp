<%


  def prodId
   if(params.prod_id){
       prodId = params.prod_id
   }
   System.out.println(session)
   
   
   
   
 %>

<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>

 <script type="text/javascript" src="https://js.stripe.com/v1/"></script>
  <script src="../js/jquery.min.js"></script> 
   <script src="../js/jquery.validate.js"></script> 
  <jq:resources/>

<style type="text/css">

	
		#myDiv2{
			display:none; /* Hide the DIV */
		    position:fixed;  
		   _position:absolute; /* hack for internet explorer 6 */  
		    width:380px; 
		    background:#FFFFFF;  
		     border:2px solid rgb(96, 87, 82);      
		     -moz-border-radius: 6px;
		    -webkit-border-radius:6px;
		     border-radius: 6px;    
		    font-size:15px;  
		    -moz-box-shadow: 0 0 5px #000000;
		    -webkit-box-shadow: 0 0 5px #000000;
		    box-shadow: 0 0 5px #000000; 
		    margin-top: 120px;
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
		
				          #content {
    background:black;
    min-height:60px;
    background:#0a0a0a;
    position:relative;
    padding:0;
    overflow:hidden;
} 
#content .entry {
    background:white;
    position:absolute;
    text-wrap:normal;
    top:0;
    left:200px;
    padding:10px;
    width:100%;
    height:100%;
    min-height:50px;
    border-left:1px solid #262626; 
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

          
           loadPopupBox2();
	  }

	    function loadPopupBox2() { 
		 	
			// To Load the Popupbox
			//alert("inside load poup")
		
	 		$('#myDiv2').show();	 		
			//$('#myDiv2').draggable();  
	        $('#myDiv2').fadeIn("slow");
	        $('#myDiv2').animate({'top':'5%'},0);
	       
		} 
    

	function unloadPopupBox2() {  
		  
   		
   		$('#myDiv2').fadeOut("slow");
     	
	}    

  

	function closePopup2(){
	
	   	unloadPopupBox2();
	   
	}

	function minusVal(){

		
		var val = 0

		if(Number($('#quantity_id').val()) > 1){


			val = Number($('#quantity_id').val()) - 1
			  
			$('#quantity_id').val(val)
		}

		

		

	}

	function plusVal(){

		
		
		   var  val = 0

			val = Number($('#quantity_id').val()) + 1
		

		  $('#quantity_id').val(val)

	}

	function addToCart(prod_id){

      
      var prodId = prod_id
      var quantity = $('#quantity_id').val()
      
      var value = {
          
                  "product_id":prodId,
                   "quantity":quantity

          }
      
      var response ;
	      $.ajax({ type: "GET",              
	         url: '${createLink(controller:'home', action:'addToCart')}',
	         data:value,			 	             
          async: false,
            success : function(text)
            {
 	         response = text;
 	        

 	         
 	        
           }

      });
  


	}

	function cartList(){

		window.location.href="../home/cartList"

   }
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
    <script type="text/javascript">
   
        var product_id = ""
    $(document).ready(function() {
        
    	
    	var height = $(".bodyGreen").height()
    	
    	 $("#productContainingDiv").height(height)
    	
    	product_id = '${prodId}'
    	var value= {"product_id":product_id}
       
    	 var response ;
  	      $.ajax({ type: "GET",              
  	         url: '${createLink(controller:'home', action:'productDetail')}',
  	         data:value,			 	             
              async: false,
                success : function(text)
                {
     	         response = text;
     	        

     	         
     	        
               }

          });

          var main_html = $("#productContainingDiv").html()
          for(var i=0;i<response.length;i++){
          
            var html = '<div id="imageContainingDiv" style="background:;width: 40%;float:left;">'+
            					 '<img src="../'+response[i].product_image_url+'" height="40%;" width="80%;">'+
							       '</div>'+
					    
							      ' <div id="descContainingDiv" style="background:;width: 60%;float:left;">'+
							      
							           '<div style="width: 50%;background: ;height:40%;word-wrap: break-word;">'+
							              ' '+response[i].product_description+' '+
							           '</div>'+
							          
							            '<div style="width: 50%; height:1%;visibility:hidden;">.</div>'+
							          
							           '<div style="width: 50%; height:1%;">'+
							          
							           '<hr style="height: 1px; color:#767F40;background:#767F40;font-size: 0; border: 0;">'+
							           '</div>'+
							           '<div style="width: 50%; height:1%;visibility:hidden;">.</div>'+
							          
										 '<div style="width: 100%;background: ;height:40%;">'+
							             		 '<img alt="" src="../images/shoppingCart/minus1.png" style="cursor: pointer;margin-top:;float:left;margin-left: 1%; " onclick="minusVal()">'+
							             		 '<input type="text" value="1" id="quantity_id" style="height:24px;width:10%;text-align: center;float:left;margin-left: 1%; ">'+
							             		 '<img alt="" src="../images/shoppingCart/plus1.png" style="cursor: pointer;margin-top:;float:left;margin-left: 1%; " onclick="plusVal()">'+
							             		 '<button type="button" style="margin-left: 1%;float:left;margin-top: -2px;" class="saveBtn" onclick="addToCart('+response[i].prod_id+')">Add To Cart</button>'+
							             		
							             		 '<img alt="" src="../images/shoppingCart/shoppingcart.png" style="cursor: pointer;margin-left: 1%;" onclick="cartList()">'+
							          	
							          	 '</div>'+
							          	
							          	 '<div style="width: 50%; height:1%;visibility:hidden;">.</div>'+
							          	
							          	  '<div style="width: 50%; height:1%;">'+
							          
							                '<hr style="height: 0.5px; color:#767F40;background:#767F40;font-size: 0; border: 0;">'+
							              '</div>'+ 
							           '<div style="width: 50%; height:1%;visibility:hidden;">.</div>'+
					                   
							       '</div>'
        
     	    main_html = main_html + html

     	   $("#name_of_product").html(response[i].product_title)
     	    $("#price_of_product").html(response[i].prod_price)
           
          }
     	
          $("#productContainingDiv").html(main_html)
         
          
          
       	 
    	
    	  
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
			
			  <div id="productContainingDiv" style="background:red;width:100%"  >
				
			 			
			  </div> <!-- end of productContainingDiv -->
				
			</div>
			<div class="blockFooter headerGreen"  style="background: ;width: 100%;">
            </div>          
			
		</div>
		</div>
    </div>
    <g:render template="/widget/updateHtmlWidgetDialog" plugin="simple-cms" />
    <g:render template="/widget/updatePhotoWidget" plugin="simple-cms" />
    <g:render template="/photo/searchPhotoDialog" plugin="simple-cms" />
    
   
     
                              
  
 </body>
</html>