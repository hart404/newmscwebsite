<html>
<head>
    <meta name="layout" content="generatedLayout" />
    <title>Steward Reporting</title>
    <resource:dateChooser/>
    <script type="text/javascript">
    	function checkPatrolButtons(index) {
        	var programValue = $("#program" + index).val();
        	if (programValue.substring(0,7) == 'PATROL_') {
            	enablePatrolButtons(index);
            } else {
                disablePatrolButtons(index);
            }
        }
    </script>
</head>
<body>
    <h1>Steward Reporting</h1>
        <g:form>
        <g:each var="index" in="${1..10}">
        Date <richui:dateChooser name='reportingDate${index}' format='MM/dd/yyyy' value='${new Date()}' />&nbsp;&nbsp;&nbsp; Program <g:select name="program" id="program${index}" keys="${programs}" from="${programs*.representation()}" noSelection="${[null: 'Select One...']}" onchange="checkPatrolButtons(${index});"></g:select>&nbsp;&nbsp; Hours <input id="hours" name="hours" type="number" min="0" value="0" step="0.5"/>&nbsp;&nbsp;<input class="southarea" disabled="disabled" id="southarea${index}" name="southarea" type="button" value="South Area" onClick="displaySouthAreaMap(${index});"/>&nbsp;&nbsp;<input class="northarea" disabled="disabled" id="northarea${index}" name="northarea" type="button" value="North Area" onClick="displayNorthAreaMap(${index});"/>&nbsp;&nbsp; 
        <br/>
        </g:each>
        <g:submitButton name="submit" value="Submit" />
        </g:form>
</body>
</html>