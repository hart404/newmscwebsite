
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

#productForm label.error {
				
					margin-left: 100px; 
					width: 80% ;
					display: block ;
					color:#F70000 ;
					font-size:14px;
					
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

	   
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
    <script type="text/javascript">

   
    $(document).ready(function() {

     

        var height  = $('#image_containing_div').height()
        var width  = $('#image_containing_div').width()
        
        $('#image_div').width(width)                
        $('#image_div').height(height); 

        $('#productForm').validate({
		    
			 rules: {
				 product_name: {
					required: true,
				},
				product_title: {
					required: true,
				},	
				
			},
		
			messages: {
				
				product_name: {
					required: "<p >&nbsp;Please Enter Username </p>",
				},
				product_title: {
					required: "<p >&nbsp;Please Enter Password </p>",
				},				
				
			}

			
		
	    });
       	 
    	
    	  
	 });

    window.displayFileInput = function(arg) {
        
           
           
           var height  = $('#image_containing_div').height()
            var width  = $('#image_containing_div').width()
            
            
        
         if (arg.files && arg.files[0]) {

	        var reader = new FileReader();
	
	        reader.onload = function (e) {
                
		        
	             $('#image_div')
	             .attr('src', e.target.result)
	             .width(width)                
	                .height(height); 

	           
	           
	                
	        };

	        
	
	        reader.readAsDataURL(arg.files[0]);
	    }
	 
	 
	}
     

	
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		
		</div>
			
			
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
			<div class="blockHeader headerGreen"  style="background:;width: 99%;">
				<h1>Add New Product</h1>
			</div>
			<div class="generalContainer">
			
			  <div id="productContainingDiv" style="background:;" class="formContainer">
			     <g:uploadForm controller='product' action='saveProduct' name="productForm" id="productForm">
			            <g:if test="${flash.message}">
                                  <div class="invalidMessage" id="messageLogin" style="margin-left:22%;color:#F70000 ;">&nbsp;${flash.message}</div>
		                  </g:if>
			         <div id="product_image_div" style="width: 100%;background: ;">
			            <div style="width:20%;background:;height:200px;float:left;"  id="image_containing_div">
			               <img alt="" src="../images/shoppingCart/default.png" id="image_div">
			            </div>
			             <div style="width:80%;background:;height:200px;">
			                  <input type = "file"  id= "file1" name = "file1"  onchange = "javascript:displayFileInput(this)" style="margin-left: 20px;margin-top: 80px;"/>
			             </div>
			         </div>
			         
			          <div style="width: 100%;background: ;visibility:hidden;">a</div>
			         
			           <div style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Product Name</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <input type = "text" style="width: 35%;" id="product_name" name="product_name"/>
			             </div>
			         </div>
			         
			          <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			         
			           <div style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Product Title</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <input type = "text" style="width: 35%;" id="product_title" name="product_title"/>
			             </div>
			         </div>
			         
			          <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			         
			          <div  style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Product Description</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <textarea rows="3" cols="" style="width: 35%;" id="product_description" name="product_description"></textarea>
			             </div>
			         </div>
			         
			           <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			         
			          <div  style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Unit Price</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <input type = "text" style="width: 35%;" id="unit_price" name="unit_price" />
			             </div>
			         </div>
			         
			            <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			         
			          <div  style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Promotional Price</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <input type = "text"  style="width: 35%;" id="promotional_price" name="promotional_price"/>
			             </div>
			         </div>
			         
			          <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			         
			         <div  style="width: 100%;background: ;">
			            <div style="width:20%;background:;float:left;" >
			                <label>Quantity</label>
			            </div>
			             <div style="width:80%;background:;">
			                  <input type = "text"  style="width: 35%;"  id="quantity" name="quantity"/>
			             </div>
			         </div>
			         
			          <div  style="width: 100%;background: ;visibility:hidden;height: 5px;">.</div>
			          
			          <div  style="width: 100%;background: ;">
			            
			            
			             <div style="width:20%;background:;float:left;visibility:hidden;" >
			               aa
			             </div>
			             <div style="width:80%;background:;">
			                     <input type="button" value="Cancel" class="saveBtn" onclick="window.location = 'productList' " style="float:left" />
			                  
			                     <input type="submit" value="Save" class="saveBtn"  style="float:left" />
			                 
			                
			             </div>
			            
			         </div>
			     	
			      	
			     </g:uploadForm>
			          
			 			
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