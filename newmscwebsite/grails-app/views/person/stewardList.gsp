<html>
<head>
    <meta name="layout" content="contentSidebarLayout" />
    <title>Steward List</title>
</head>
<body>
    <div class="contentContainer" id="contentContainer">
            <div>
                <form name="input" action="<g:createLink controller='person' action='stewardList'/>" method="get">
                    <span class="bigp">First Name: </span><input type="text" name="firstName">
                    <span class="bigp">Last Name: </span><input type="text" name="lastName">
                    <span class="bigp">Class Number: </span><input type="text" name="classNumber">
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
                        <th>Master/Lead<br/>Steward</th>
                        <th>Leadership</th>
                    </tr>
                </thead>
                <tbody>
                <g:each in="${stewards}" status="i" var="steward">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}"> 
                        <g:if test="${steward.photo}">                   
                            <td style="vertical-align: center; "><img src="${steward.photo.fullPath()}" height="100" width="${(100 / steward.photo.height) * steward.photo.width}" class="innerGlow"/></td>                    
                        </g:if>
                        <g:else>
                            <td></td>
                        </g:else>
                        <td>${fieldValue(bean: steward, field: "firstName")}</td>
                        <td>${fieldValue(bean: steward, field: "lastName")}</td> 
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_WEB,ROLE_STAFF">
                            <td><g:link action="edit" id="${steward.id}">${fieldValue(bean: steward, field: "email")}</g:link></td> 
                        </sec:ifAnyGranted>                   
                        <sec:ifNotGranted roles="ROLE_ADMIN,ROLE_WEB,ROLE_STAFF">
                            <td>${fieldValue(bean: steward, field: "email")}</td> 
                        </sec:ifNotGranted>                   
                        <td><g:if test="${steward?.homePhone?.number}"><p style="font-size: 10px">${steward?.homePhone?.number} (H)</p></g:if><g:if test="${steward?.cellPhone?.number}"><p style="font-size: 10px">${steward?.cellPhone?.number} (M)</p></g:if></td>                    
                        <td><g:if test="${steward.classNumber == 'Unspecified'}"></g:if><g:else>${steward.classNumber}</g:else></td>                    
                        <td><g:if test="${steward.masterSteward}">Master</g:if><g:if test="${steward.leadSteward}">Lead</g:if></td>                    
                        <td>${steward.leadershipPosition()}</td>                    
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