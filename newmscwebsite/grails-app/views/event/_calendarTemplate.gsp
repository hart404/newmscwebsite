<g:setProvider library="jquery"/>
<div class="calendarMonthSelection">
	<div class="calendarLeftArrow">
		<g:remoteLink action="calendarPreviousMonth" update="innerCalendar" params="['year': year,'monthNumber': monthNumber]">
			<img src="<g:createLinkTo dir='/images/layout' file='img_leftarrow-16x16.png'/>"/>
		</g:remoteLink>
	</div>
	<div class="calendarRightArrow">
		<g:remoteLink action="calendarNextMonth" update="innerCalendar" params="['year': year,'monthNumber': monthNumber]">
			<img src="<g:createLinkTo dir='/images/layout' file='img_rightarrow-16x16.png'/>"/>
		</g:remoteLink>
	</div>
	<div class="calendarMonthYear">
		${month}&nbsp;${year}
	</div>
</div>
<table id="calendarTable">
	<tr class="calendarHeader"><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>
	<g:each var="row" in="${rows}">
		<tr class="calendarRow">
			<g:each var="dateWrapper" in="${row}">
				<td class="${dateWrapper.getStyle()}" onmousedown="calendarDragStart(event, ${year}, ${monthNumber}, ${dateWrapper.day}, this)" onmouseover="calendarDragOver(${year}, ${monthNumber}, ${dateWrapper.day}, this)" onmouseup="calendarDragEnd(${year}, ${monthNumber}, ${dateWrapper.day}, this)" id="calendarDate${dateWrapper.getTagID()}">${dateWrapper.day}</td>
			</g:each>
		</tr>
	</g:each>
</table>
