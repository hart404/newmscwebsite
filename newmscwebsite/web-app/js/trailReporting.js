var trailReportIndex = 0;

function initializeTrailReportingForm(volunteerSession) {
    var index = trailReportIndex;
    var notificationTypeId = "problemNotificationTypeId-" + index;
    var descriptionId = "problemDescriptionId-" + index;
    var dateId = "problemDateId-" + index;

    var trailReport = new TrailReport(index);
    volunteerSession.attributes.trailReports.push(trailReport);

    $('#trailReportingContainer')
        .append('<div style="display:none" id="trailReportingDiv-' + index + '">' +
        '<p style="color:#54534a;">' +
        'Please use this form to report any issues for this trail segment. Note that all issues ' +
                'will not be logged and communicated until the report is saved as a whole. ' +
                'These fields can be updated as needed until the report is saved. Clicking ' +
                '"Cancel" will reset this trail section to an unpatrolled state and clear the form.' +
        '</p>' +
        '<div id="errorsDiv-' + index +'">' +
        '<ul class="errors" role="alert" id=errorsListId-"' + index + '"></ul>' +
        '</div>' +
        '<form id="trailReportingForm-' + index + '">' +
        '<table style="border:none;">' +
        '<tr>' +
        '<td>Trail Problem Type</td>' +
        '<td><select name="notificationType" style="width:18em;" id="' + notificationTypeId +'" data-tr-bind-' + index + '="notificationType"></select></td>' +
        '</tr>' +
        '<tr>' +
        '<td>Description</td>' +
        '<td><textarea name="problemDescription" style="width:18em; height:10em;" id="' + descriptionId +'" data-tr-bind-' + index + '="problemDescription"></textarea></td>' +
        '</tr>' +
        '<tr>' +
        '<td>Date</td>' +
        '<td><input type="text" name="problemDate" style="width:18em;" id="' + dateId +'" data-tr-bind-' + index + '="problemDate"></td>' +
        '</tr>' +
        '</table>' +
        '</form>' +
        '</div>');

    trailReportIndex++;
//    return "trailReportingDiv-" + index;
    return trailReport;
}