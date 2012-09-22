<html>
<head>
    <meta name="layout" content="contentSidebarLayout" />
    <title>Steward List</title>
</head>
<body>
    <div class="contentContainer">
            <div>
                <form name="input" action="<g:createLink controller='person' action='stewardList'/>" method="get">
                    First Name: <input type="text" name="firstName">
                    Last Name: <input type="text" name="lastName">
                    <input type="hidden" name="max" value = "50">
                    <input type="hidden" name="offset" value = "0">
                    <input type="submit" value="Search">
                </form>
            </div>
            <table>
                <thead>
                    <tr>                    
                        <th><g:message code="steward.photo.label" default="Photo" /></th>
                        <g:sortableColumn property="firstName" title="${message(code: 'steward.firstname.label', default: 'First Name')}" />                    
                        <g:sortableColumn property="lastName" title="${message(code: 'steward.lastname.label', default: 'Last Name')}" />                    
                        <g:sortableColumn property="email" title="${message(code: 'steward.email.label', default: 'Email')}" />                   
                        <th>Phone</th>
                        <g:sortableColumn property="classNumber" title="${message(code: 'steward.classnumber.label', default: 'Class<br/>Number')}" />
                        <th>Master<br/>Steward</th>
                        <th>Leadership</th>
                    </tr>
                </thead>
                <tbody>
                <g:each in="${stewards}" status="i" var="steward">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">                    
                        <td></td>                    
                        <td>${fieldValue(bean: steward, field: "firstName")}</td>
                        <td>${fieldValue(bean: steward, field: "lastName")}</td>                    
                        <td>${fieldValue(bean: steward, field: "email")}</td>                    
                        <td>Home: ${steward?.homePhone?.number}<br/>Cell: ${steward?.cellPhone?.number}</td>                    
                        <td><g:if test="${steward.classNumber == 'Unspecified'}"></g:if><g:else>${steward.classNumber}</g:else></td>                    
                        <td><g:if test="${steward.masterSteward}">Yes</g:if></td>                    
                        <td>${fieldValue(bean: steward, field: "position")}</td>                    
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${stewardCount}" max="50" />
            </div>
    </div>
</body>
</html>