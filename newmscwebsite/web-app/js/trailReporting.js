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
        'Please use this form to report any issues for this trail section. Clicking ' +
        '"Clear" will reset this trail section to an unpatrolled state and clear the form. ' +
        'Please select Trail Problem Type by using the pull down menu arrow. ' +
        '"Emergency Action Needed" constitutes a risk for potential injury by a trail user or prevention of use of the trail. ' +
        'Please <em>DO NOT</em> file a report if the trail is in good condition.' +
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
        '<td><textarea name="problemDescription" maxlength="250" style="width:18em; height:10em;" id="' + descriptionId +'" data-tr-bind-' + index + '="problemDescription"></textarea></td>' +
        '</tr>' +
        '</table>' +
            '<p style="color:#54534a;">' +
            'In the description field, please provide the following information in order: </br></br>' +
            "1) Briefly describe the issue" +
            '</p>' +
            '<p style="color:#54534a;">' +
            "2) Describe the location with GPS coordinates from:" +
            '<ul>' +
            '<li> Your MSC GPS Map' +
            '<li> Coordinates from a photo, if taken' +
            '<li> Coordinates from your GPS' +
            '</ul>' +
            '</p>' +
            '<p style="color:#54534a;">' +
            '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or' +
            '</p>' +
            '<p style="color:#54534a;">' +
            'List the emergency markers located on the trail map, which is the circle with a black dot in the center. (Click on the circle and the marker name will appear).' +
            '</p>' +
            '<p style="color:#54534a;">' +
            '<u><i>Sample Report</i></u>' +
            '</p>' +
            '<p style="color:#54534a;">' +
            '"Saguaro across trail at GPS coordinate 33.761111 -111.863889"' +
            '</p>' +
            '<p style="color:#54534a;">' +
            '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or' +
            '</p>' +
            '<p style="color:#54534a;">' +
            '"Saguaro across trail 1/2 way between DX5 and DX3"' +
            '</p>' +
        '</form>' +
        '</div>');

    trailReportIndex++;
    return trailReport;
}