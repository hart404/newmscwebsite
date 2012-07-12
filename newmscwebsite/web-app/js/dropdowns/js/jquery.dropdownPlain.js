$(function(){

    $("ul.dropdown li").hover(function(){

    	$(this).addClass("hover");
        var element = $('ul:first',this);
        element.css('visibility', 'visible');
    
    }, function(){

        $(this).removeClass("hover");
        $('ul:first',this).css('visibility', 'hidden');
    
    });
    
    $("ul.dropdown li ul li:has(ul)").find("a:first").append(" &raquo; ");

});