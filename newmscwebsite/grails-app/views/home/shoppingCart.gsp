
<html>
<head>
<meta name="layout" content="homeLayout" />
<meta name="description" content="The volunteer group that assists the City of Scottsdale in maintaining the McDowell Sonoran Preserve" />
<meta name="keywords" content="mcdowell mountains hiking" />
<title>McDowell Sonoran Conservancy</title>

 <script type="text/javascript" src="https://js.stripe.com/v1/"></script>
  <script src="../js/jquery.min.js"></script> 
   <script src="../js/jquery.validate.js"></script> 
  

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
		    margin-top: 40px;
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

	    function showsShoppingPopup(){

          
           loadPopupBox2();
	  }

	    function loadPopupBox2() { 
		 	
		
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
	</script>
	<script>
       jQuery.ajax({type:'POST', url:"<g:createLink controller='adSpacePhoto' action='adSpacePhotos' />", 
            success:function(json, textStatus){loadAdSpace(json);}, error:function(XMLHttpRequest,textStatus,errorThrown){console.log(errorThrown)}});
    </script>
    
    <script type="text/javascript">

    var count =  1
    var main_count = 0
    var total_record = ""
    var showing_data = ""
        var page_count = 0
        var last_index = 0
    $(document).ready(function() {

        

  
    
    	
         page_count = 0
    	 var response ;
  	      $.ajax({ type: "GET",              
  	         url: '${createLink(controller:'home', action:'productList')}',			 	             
              async: false,
                success : function(text)
                {
     	         response = text;

     	         
     	        
               }

          });

          var main_html = $("#productContainingDiv").html()
          var product_list = response.prod_details

          total_record = response.total_data
          
          showing_data = response.showing_data

          
          last_index = response.last_index

          var count = 1
     	 var _count 
     	 var new_count = 0
     	 
     	 for(var i = 0;i<product_list.length;i++){
     		 _count = count * 4 -1
     		
     		
     		 
     	     if(_count == i){

     	    	  var html = '<div  style="background: ;width:20%;float:left;">'+
							 				'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;" id="'+product_list[i].prod_id+'" onclick="showProductDetail('+product_list[i].prod_id+')">'+
										    '<div>'+product_list[i].product_title+'</div>'+
						                  '<div>'+product_list[i].prod_price+'</div>'+
									   '</div>'+
									 '<div  style="background: pink;width:6.5%;float:left;visibility:hidden;">b</div>'+
     						       ' <div  style="background: pink;width:100%;visibility:hidden;">b</div>'

     						       count = count + 1   
     				       
     	     }else{

     	    	 var html = '<div  style="background: ;width:20%;float:left;">'+
					     	    	'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;" id="'+product_list[i].prod_id+'"  onclick="showProductDetail('+product_list[i].prod_id+')">'+
								    '<div>'+product_list[i].product_title+'</div>'+
					              '<div>'+product_list[i].prod_price+'</div>'+
								'</div>'+
								'<div  style="background: pink;width:6.5%;float:left;visibility:hidden;">b</div>'


     	    }
     	    main_html = main_html + html
           
     	   
     	 }
          $("#productContainingDiv").html(main_html)
          
			$("#showing_data_id").html(showing_data + " of ")
			$("#total_result_id").html(total_record + " Results ")
			
            $('#prevImg').attr('src', '')		 
		    $('#prevImg').attr('src', '../images/grid/backDisabled.png')
		    
		    $('#nextImg').attr('src', '')		 
		    $('#nextImg').attr('src', '../images/grid/forwardEnabledHover.png')
		 
				 $("#nextTextDiv").css("color","black")
				 $("#prevTextDiv").css("color","#555")
       	 
    	
    	  
	 });

	 function showProductDetail(prod_id){

       window.location.href="../home/detailProduct?prod_id="+prod_id+" "

    }

	 function previousData(){

		
      
      if(page_count != 0){
           
    	   page_count = page_count - 1
      
      


       
    	 
    	   
       var value = {"showing_data":showing_data,"total_record":total_record,"page_count":page_count}

	  var response ;
	      $.ajax({ type: "GET",              
	         url: '${createLink(controller:'home', action:'productPrevData')}',	
	         data:value,		 	             
          async: false,
            success : function(text)
            {
 	         response = text;

 	         
 	        
           }

      });



	  	    $("#productContainingDiv").html("")

	  	     var main_html = $("#productContainingDiv").html()
	         var product_list = response.prod_details

	         total_record = response.total_data
	         
	         showing_data = response.showing_data


	         var count = 1
	    	 var _count 
	    	 var new_count = 0
	    	 
	    	 for(var i = 0;i<product_list.length;i++){
	    		 _count = count * 4 -1
	    		
	    		
	    		 
	    	     if(_count == i){

	    	    	  var html = '<div  style="background:;width:20%;float:left;">'+
								 				'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;" id="'+product_list[i].prod_id+'" onclick="showProductDetail('+product_list[i].prod_id+')">'+
											    '<div>'+product_list[i].product_title+'</div>'+
							                  '<div>'+product_list[i].prod_price+'</div>'+
										   '</div>'+
										 '<div  style="background: ;width:6.5%;float:left;visibility:hidden;">b</div>'+
	    						       ' <div  style="background:;width:100%;visibility:hidden;">b</div>'

	    						       count = count + 1   
	    				       
	    	     }else{

	    	    	 var html = '<div  style="background: ;width:20%;float:left;">'+
						     	    	'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;" id="'+product_list[i].prod_id+'" onclick="showProductDetail('+product_list[i].prod_id+')">'+
									    '<div>'+product_list[i].product_title+'</div>'+
						              '<div>'+product_list[i].prod_price+'</div>'+
									'</div>'+
									'<div  style="background: ;width:6.5%;float:left;visibility:hidden;">b</div>'


	    	    }
	    	    main_html = main_html + html
	          
	    	   
	    	 }
	           $("#productContainingDiv").html(main_html)
	         
				$("#showing_data_id").html(showing_data + " of ")
				$("#total_result_id").html(total_record + " Results ")
				
				

	            if(page_count == 0){
		            
	            	 $('#nextImg').attr('src', '')		 
					 $('#nextImg').attr('src', '../images/grid/forwardEnabledHover.png')
					 
					 $('#prevImg').attr('src', '')		 
				     $('#prevImg').attr('src', '../images/grid/backDisabled.png')
					

			    	  $("#nextTextDiv").css("color","black")
			    	  $("#prevTextDiv").css("color","#666")


		        }else{


		        	 $('#nextImg').attr('src', '')		 
					 $('#nextImg').attr('src', '../images/grid/forwardEnabledHover.png')
					 
					 $('#prevImg').attr('src', '')		 
				     $('#prevImg').attr('src', '../images/grid/backEnabledHover.png')
					

			    	  $("#nextTextDiv").css("color","black")
			    	  $("#prevTextDiv").css("color","black")

			    }
       

            last_index = last_index - 1
       }
     }

	 function nextData(){
		 
		  $('#prevImg').attr('src', '')		 
		  $('#prevImg').attr('src', '../images/grid/backDisabled.png')
		
		  $("#prevTextDiv").css("color","#222")
		
	      
	      if(last_index != total_record){

	    	     $('#nextImg').attr('src', '')		 
				 $('#nextImg').attr('src', '../images/grid/forwardEnabledHover.png')
				 
				 $('#prevImg').attr('src', '')		 
			     $('#prevImg').attr('src', '../images/grid/backEnabledHover.png')
				

		    	 $("#nextTextDiv").css("color","black")
		    	  $("#prevTextDiv").css("color","black")
	       page_count = page_count + 1
	      
	      var value = {"showing_data":showing_data,"total_record":total_record,"page_count":page_count}

		  var response ;
  	      $.ajax({ type: "GET",              
  	         url: '${createLink(controller:'home', action:'productNextData')}',	
  	         data:value,		 	             
              async: false,
                success : function(text)
                {
     	         response = text;

     	         
     	        
               }

          });

  	    $("#productContainingDiv").html("")

  	     var main_html = $("#productContainingDiv").html()
         var product_list = response.prod_details

         total_record = response.total_data
         
         showing_data = response.showing_data

         last_index =  response.last_index


         var count = 1
    	 var _count 
    	 var new_count = 0
    	 
    	 for(var i = 0;i<product_list.length;i++){
    		 _count = count * 4 -1
    		
    		
    		 
    	     if(_count == i){

    	    	  var html = '<div  style="background:;width:20%;float:left;">'+
							 				'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;"  id="'+product_list[i].prod_id+'" onclick="showProductDetail('+product_list[i].prod_id+')">'+
										    '<div>'+product_list[i].product_title+'</div>'+
						                  '<div>'+product_list[i].prod_price+'</div>'+
									   '</div>'+
									 '<div  style="background: ;width:6.5%;float:left;visibility:hidden;">b</div>'+
    						       ' <div  style="background:;width:100%;visibility:hidden;">b</div>'

    						       count = count + 1   
    				       
    	     }else{

    	    	 var html = '<div  style="background: ;width:20%;float:left;">'+
					     	    	'<img src="../'+product_list[i].product_image_url+'" height="200px;" width="200px;" id="'+product_list[i].prod_id+'" onclick="showProductDetail('+product_list[i].prod_id+')">'+
								    '<div>'+product_list[i].product_title+'</div>'+
					              '<div>'+product_list[i].prod_price+'</div>'+
								'</div>'+
								'<div  style="background:;width:6.5%;float:left;visibility:hidden;">b</div>'


    	    }
    	    main_html = main_html + html
          
    	   
    	 }
         $("#productContainingDiv").html(main_html)
         
			$("#showing_data_id").html(showing_data + " of ")
			$("#total_result_id").html(total_record + " Results ")

			  if(last_index == total_record){

                     $('#nextImg').attr('src', '')		 
					 $('#nextImg').attr('src', '../images/grid/forwardDisabled.png')
					 
					 $('#prevImg').attr('src', '')		 
				     $('#prevImg').attr('src', '../images/grid/backEnabledHover.png')
					
		
			    	  $("#nextTextDiv").css("color","#666")
			    	  $("#prevTextDiv").css("color","black")

			  }else{


			}
	      

	     }else{


	    	 $('#nextImg').attr('src', '')		 
			 $('#nextImg').attr('src', '../images/grid/forwardDisabled.png')
			 
			 $('#prevImg').attr('src', '')		 
		     $('#prevImg').attr('src', '../images/grid/backEnabledHover.png')
			

	    	 $("#nextTextDiv").css("color","#666")
	    	  $("#prevTextDiv").css("color","black")
		  }

	 }
    
    </script>
    <div class="homePageItems">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
		
		   <div style="float:left;color:#efdfab;margin-top:1%;margin-left: 1%;">Showing</div><div style="float:left;margin-left: 1%;color:#efdfab;margin-top:1%;" id="showing_data_id"></div><div style="float:left;margin-left: 1%;color:#efdfab;margin-top:1%;" id="total_result_id"></div>
		</div>
			
			
		<div class="homePageItem marginRight"  style="background: ;width: 100%;">
			<div class="blockHeader headerGreen"  style="background:;width: 99%;">
				<h1>Shop</h1>
			</div>
			<div class="generalContainer">
			
			  <div id="productContainingDiv" style="background:;" class="formContainer">
			
			 			
			  </div> <!-- end of productContainingDiv -->
			  <div>
			   <img   style="float:left;margin-left: 85%;cursor: pointer;" id="prevImg" onclick="previousData()"/>
                <div style="float:left;text-align: center;margin-left: 0.8%;background:;cursor: pointer;" onclick="previousData()" id="prevTextDiv">Prev</div>
                <div style="float:left;text-align: center;margin-right: 0.8%;background:;margin-left: 2%;cursor: pointer;" onclick="nextData()" id="nextTextDiv">Next</div>
                <img  style="float:left;margin-right: 2%;cursor: pointer;" id="nextImg" onclick="nextData()"/>
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
									        
										       <div class="formContainer" style="width:93%;" >
                                             
                                                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
                                              
                                              </div>
                                              </div>
                                                
                                             </div>    
											   
												                                                  
												  
                                           
                                            
                                         <div class="blockFooter headerGreen" style="width:100%;background: ;">
                                         
                                       </div>
						         
		                               
                                    </div> 
                            
                              </div>   <!--row-fluid popup end-->
                              
  
 </body>
</html>