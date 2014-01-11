<html>
<head>
    <meta name="layout" content="contentSidebarLayout" />
    <title>Bulk Entry for Steward: ${steward.firstName} ${steward.lastName}</title>
</head>
<body>
    <div class="contentContainer" id="contentContainer">
        <g:form action="bulkSave">
        Date <input name="date" type="text" />&nbsp;&nbsp;&nbsp; Program <g:select class="program" id="program" name="program" onchange="selectedValue(7);" /><option selected="selected" value=""></option></select>&nbsp;&nbsp; Hours <input id="hours7" name="hours" type="number" min="0" value="0" />&nbsp;&nbsp;Starting Time <select class="cdiui-input cdiui-select" id="starttime7" value="" ></select>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea7" name="northarea" type="button" value="North Area" />&nbsp;&nbsp;&nbsp; <input class="southarea" disabled="disabled" id="southarea7" name="southarea" type="button" value="South Area" />&nbsp;&nbsp;
        </g:form>
    </div>
</body>
</html>