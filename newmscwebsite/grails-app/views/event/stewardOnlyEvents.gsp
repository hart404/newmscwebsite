<html>
<head>
    <meta name="layout" content="contentSidebarLayout" />
    <title>Steward List</title>
</head>
<body>
    <div class="contentContainer" id="contentContainer">
            <table>
                <thead>
                    <tr>                    
                        <th>Title</th>
                        <th>Short Description</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Steward Information</th>
                    </tr>
                </thead>
                <tbody>
                <g:each in="${stewardOnlyEvents}" status="i" var="event">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}"> 
                        <td><a href="<g:createLink action='displayEvent' id='${event.id}'/>">${fieldValue(bean: event, field: "title")}</a></td>
                        <td>${fieldValue(bean: event, field: "shortDescription")}</td> 
                        <td>${event.shortFormattedStartTime()}</td> 
                        <td><g:if test="${event.location}">${event.location}</g:if><g:else>${event.otherLocation}</g:else></td> 
                        <td>${fieldValue(bean: event, field: "stewardOnlyInformation")}</td> 
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${countStewardOnlyEvents}" max="20" />
            </div>
    </div>
</body>
</html>