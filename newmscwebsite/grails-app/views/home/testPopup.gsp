
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Creating Popup Div | istockphp.com</title>

<link rel="stylesheet" href="${resource(dir:'css',file:'grid/style.css')}" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"> </script>
<script src="../js/script.js"></script> 
</head>

<body >
	<a href="#" class="topopup">Click Here Trigger</a>
    
    <div id="toPopup" style="background: red;"> 
    	
        <div class="close"></div>
       	<span class="ecs_tooltip">Press Esc to close <span class="arrow"></span></span>
		<div id="popup_content"> <!--your content start-->
            <p>
            Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, 
            feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi 
            vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, 
            commodo Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique 
            senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, 
            feugiat vitae, ultricies eget, tempor sit amet, ante. </p>
            <br />
            <p>
            Donec eu libero sit amet quam egestas semper. Aenean ultricies mi 
            vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, 
            commodo Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
            <p align="center"><a href="#" class="livebox">Click Here Trigger</a></p>
        </div> <!--your content end-->
    
    </div> <!--toPopup end-->
    
	<div class="loader"></div>
	
   	<div id="backgroundPopup"></div>
   	
</body>
</html>