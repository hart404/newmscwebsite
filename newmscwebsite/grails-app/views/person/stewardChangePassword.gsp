<!doctype html>
<html>
    <head>
        <meta name="layout" content="contentSidebarLayout">
        <title>Change Password</title>
    </head>
    <body>
        <div class="contentContainer" id="contentContainer">
            <h1>Change Password</h1>
            <g:form method="post" >
                <fieldset class="form">
                    <label for="newPassword">New Password</label>
                    <g:passwordField name="newPassword" value=""/>
                    <label for="repeatNewPassword">Repeat New Password</label>
                    <g:passwordField name="repeatNewPassword" value=""/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="updateStewardPassword" value="${message(code: 'default.button.updatepassword.label', default: 'Update Password')}" />
                </fieldset>
            </g:form>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
        </div>
    </body>
</html>
