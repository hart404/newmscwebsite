<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>

 <link rel="stylesheet" href="${resource(dir:'css',file:'ace.min.css')}" />
 <link rel="stylesheet" href="${resource(dir:'css',file:'grid/demo_table.css')}" />  
 
 <script type="text/javascript" src="https://js.stripe.com/v1/"></script>
<jq:resources/>
             
    <script src="../js/jquery.min.js"></script> 
<style type="text/css">

	.table thead:first-child tr th{

   background: #BFA87C;
   
   height: 50px;
   font-size: 20px;
   font-weight: bold;

}

.dataTables_paginate {
	float: right;
	text-align: right;
}

.saveBtn {
    -moz-border-radius: 2px;
    -webkit-border-radius: 4px;
    -khtml-border-radius: 4px;
    border-radius: 4px;
    color:#664809; 
     background:#f49d2f; 
    padding: 8px 35px;
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
      padding: 8px 35px;
    border:solid 1px #e39d3d;
    font:Arial;
	
}


/* Pagination nested */
.paginate_disabled_previous, .paginate_enabled_previous,
.paginate_disabled_next, .paginate_enabled_next {
	height: 19px;
	float: left;
	cursor: pointer;
	*cursor: hand;
	color: #111 !important;
}
.paginate_disabled_previous:hover, .paginate_enabled_previous:hover,
.paginate_disabled_next:hover, .paginate_enabled_next:hover {
	text-decoration: none !important;
}
.paginate_disabled_previous:active, .paginate_enabled_previous:active,
.paginate_disabled_next:active, .paginate_enabled_next:active {
	outline: none;
}

.paginate_disabled_previous,
.paginate_disabled_next {
	color: #666 !important;
}
.paginate_disabled_previous, .paginate_enabled_previous {
	padding-left: 23px;
}
.paginate_disabled_next, .paginate_enabled_next {
	padding-right: 23px;
	margin-left: 10px;
}

.paginate_disabled_previous {
	background: url('../images/grid/backDisabled.png') no-repeat top left;
}

.paginate_enabled_previous {
	background: url('../images/grid/backEnabledHover.png') no-repeat top left;
}
.paginate_enabled_previous:hover {
	background: url('../images/grid/backEnabled.png') no-repeat top left;
}

.paginate_disabled_next {
	background: url('../images/grid/forwardDisabled.png') no-repeat top right;
}

.paginate_enabled_next {
	background: url('../images/grid/forwardEnabledHover.png') no-repeat top right;
}
.paginate_enabled_next:hover {
	background: url('../images/grid/forwardEnabled.png') no-repeat top right;
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

     
    	var response;
		 $.ajax({ type: "GET",                 
	 	         url: '${createLink(controller:'product', action:'productListJSON')}',	 	        
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
			"sPaginationType": "two_button",
			
         "aoColumns": [						
				{ "sTitle": "Product","sClass": "center","bSortable": false}, 			
				{ "sTitle": "Name" , "sClass": "center","bSortable": false},
				{ "sTitle": "Title" , "sClass": "center","bSortable": false},
				{ "sTitle": "Unit Price", "sClass": "center" ,"bSortable": false},
				{ "sTitle": "Promotional Price", "sClass": "center" ,"bSortable": false},
				{ "sTitle": "Quantity" , "sClass": "center","bSortable": false},
				{ "sTitle": "Edit", "sClass": "center","bSortable": false},
				{ "sTitle": "Delete", "sClass": "center","bSortable": false}
				
				
				
				
			]
		});	
       	 
    	
    	  
	 });

     
      function deleteData(id){

    	    
              
    	    	 var response;
	  		   $.ajax({ type: "GET",                 
	  	 	         url: '${createLink(controller:'product', action:'deleteProduct')}',	 	        
	                 async: false,
	                 data:{"product_id":id},		                
	                 success : function(text)
	                   {
	        	         response = text;
	        	            if(response){
	
	            	            window.location.href="../product/productList"
	            	         
	                        }
	                   }
	
	           });

       }

      function updateData(id){

    	  window.location.href="../product/editProduct?id="+id+" "
      }

      function addNewProduct(){

    	  window.location.href="../product/addProduct"

      }
	
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		
		</div>
			
			
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
			<div class="blockHeader headerGreen"  style="background:;width: 99%;">
				<h1 style="float:left">Product List</h1>
				<button class="saveBtn" style="float:right;margin-right: 2%;margin-top: 1%;" onclick="addNewProduct()">Add New Product</button>
			</div>
			<div class="generalContainer">
			
			  <div id="productContainingDiv" style="background:;" class="formContainer">
			     
			     	 <div id="demo" name="demo" style="background: ;width:100%;">
									                           
						 </div>
			      	
			    
			          
			 			
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
    
    <script src="../js/jquery.validate.js"></script> 
   <script src="../js/jquery.dataTables.min.js"></script>
		<script src="../js/jquery.dataTables.bootstrap.js"></script> 
     
  
 </body>
