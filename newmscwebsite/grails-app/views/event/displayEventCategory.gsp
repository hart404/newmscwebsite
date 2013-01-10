<html>
<head>
<meta name="layout" content="mainLayout" />
<title>Events for Category ${category.formatted()}</title>
</head>
<body>
    <script>
    function findEventsForCategory(offset, max, category) {
        jQuery.ajax({type:'POST',data:{'category': category, 'offset': offset, 'max': max}, url:"<g:createLink
        controller='event' action='getEventsForCategory' />",success:function(data,textStatus){$('#eventList').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});                
    }
    </script>
    <div class="relativeContainer"  id="eventSelection">
        <div class="eventCategoryContainer">
            <div class="blockHeader">
                <h1 class="redEventText">Events for Category ${category.formatted()}</h1>
            </div>  
            <div class="eventOrNews" id="eventList">
                <g:render template="/event/eventsCategoryTemplate"></g:render>
            </div>
        </div>
    </div>
</body>
</html>