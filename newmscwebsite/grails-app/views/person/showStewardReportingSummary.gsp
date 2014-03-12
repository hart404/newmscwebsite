<%@ page import="newmscwebsite.ProgramReporting" %>
<%@ page import="newmscwebsite.VolunteerSession" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="mainLayout" />
    <title>Steward Hours Summary for ${steward}</title>
</head>
<body>
    <div class="generalContainer">
	    <h2>Steward Hours Summary for ${steward}</h2>
	    Total: ${total[0]}<br/>
	    Total YTD: ${totalYTD[0]}<br/>
		<h4>Hours By Program:</h4>
		<table border="1" class="programHours">
		<tr>
		  <th>Program</th>
		  <th>Hours</th>
		</tr>
		<g:each in="${byProgram}" var="hoursProgram">
			<tr>
			  <td>${((ProgramReporting)(hoursProgram[1])).value() }</td>
			  <td>${hoursProgram[0] }</td>
			</tr>
		</g:each>
		</table>    
		<h4>Hours By Program YTD:</h4>
		<table border="1" class="programHours">
		<tr>
		  <th>Program</th>
		  <th>Hours</th>
		</tr>
		<g:each in="${byProgramYTD}" var="hoursProgram">
			<tr>
			  <td>${((ProgramReporting)(hoursProgram[1])).value() }</td>
			  <td>${hoursProgram[0] }</td>
			</tr>
		</g:each>
		</table> 
		<div id="list-volunteerSession" class="content scaffold-list" role="main">
			<h4>Volunteer Sessions</h1>
			<table>
				<thead>
					<tr>					
						<g:sortableColumn property="program" title="${message(code: 'volunteerSession.program.label', default: 'Program')}" />
						<g:sortableColumn property="date" title="${message(code: 'volunteerSession.date.label', default: 'Date')}" />
						<g:sortableColumn property="hours" title="${message(code: 'volunteerSession.hours.label', default: 'Hours')}" />
						<th></th>					
					</tr>
				</thead>
				<tbody>
				<g:each in="${volunteerSessions}" status="i" var="volunteerSessionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${((ProgramReporting)(volunteerSessionInstance.program)).value()}</td>
						<td>${fieldValue(bean: volunteerSessionInstance, field: "date")}</td>
						<td>${fieldValue(bean: volunteerSessionInstance, field: "hours")}</td>
						<td><g:link controller="volunteerSession" action="userEdit" id="${volunteerSessionInstance.id}">Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${volunteerSessionsCount}" />
			</div>
			<g:form controller="volunteerSession" action="downloadVolunteerSessionsAsCSV" id="${steward.id}">
            <g:submitButton class="edit" name="submit" value="${message(code: 'default.button.download.label', default: 'Download as CSV')}" />
            </g:form>
		</div>
		   
    </div>
</body>
</html>