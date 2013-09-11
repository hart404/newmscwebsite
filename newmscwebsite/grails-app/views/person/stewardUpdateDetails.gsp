<%@ page import="newmscwebsite.Person" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="contentSidebarLayout">
        <title>Update Details</title>
    </head>
    <body>
        <div class="contentContainer" id="contentContainer">
            <h1>Update Details</h1>
            <g:form method="post" >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updateStewardDetails" value="${message(code: 'default.button.updatedetails.label', default: 'Update Details')}" />
                    <input type='hidden' name='id' value='${personInstance.id}'>
                </fieldset>
            </g:form>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
        </div>
    </body>
</html>
