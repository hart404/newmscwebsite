<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Bulk Entry for Steward: ${steward.firstName} ${steward.lastName}</title>
    <resource:dateChooser/>
</head>
<body>
    <h1> Bulk Volunteer Hour Entry for Steward: ${steward.firstName} ${steward.lastName}</h1>
        <g:form action="saveBulkReporting">
        <g:each var="index" in="${1..10}">
        Date <richui:dateChooser format="MM-dd-yyyy" name="date" />&nbsp;&nbsp;&nbsp; Program <g:select id="program" name="program" keys="${newmscwebsite.ProgramReporting.values()}" from="${newmscwebsite.ProgramReporting.values()*.representation()}" noSelection="${[null: 'Select One...']}"></g:select>&nbsp;&nbsp; Hours <input id="hours" name="hours" type="number" min="0" value="0" step="0.5"/>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea" name="northarea" type="button" value="North Area" />&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea7" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
        <br/>
        </g:each>
        <g:hiddenField name="stewardId" value="${steward.id}" />
        <g:submitButton name="submit" value="Submit" />
        </g:form>
</body>
</html>