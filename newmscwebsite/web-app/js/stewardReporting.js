var southMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/01c2e512-ec83-4d8b-ba65-b3d426baadf73877998034998336911.kmz";
var northMapURL = "https://s3.amazonaws.com/McDowellSonoranConservancyImages/a5b76768-a7c4-4b54-8317-5fb1e90d0eab6572252542622326063.kmz";

// Since the reporting table is dynamic, we need
// this counter so we can append a number to each
// element in the row to keep them unique from each other.
var reportingTableRowIndex = 0;

// Instead of keeping track of one-to-many dynamic form data,
// all data entered for each volunteer session and their corresponding
// trail reports will be 2-way-binded to VolunteerSession and TrailReport
// objects that will be pushed to this array. This array will be what gets
// submitted when the user submits the steward report.
var volunteerSessions = [];

/**
 * Adds a table row dynamically to the stewardReportingTable.
 */
function addReportingTableRow(programs) {
    var index = reportingTableRowIndex;
    var validationTableRow = index + 1;
    var dateFieldId = "sessionDateId-" + index;
    var programFieldId = "sessionProgramId-" + index;
    var hoursFieldId = "sessionHoursId-" + index;
    var southMapFieldId = "sessionSouthMapId-" + index;
    var northMapFieldId = "sessionNorthMapId-" + index;
    var northMapCanvasId = "northMapCanvasId-" + index;
    var southMapCanvasId = "southMapCanvasId-" + index;

    var volunteerSession = new VolunteerSession(index);
    volunteerSession.attributes.validationRow = validationTableRow;
    volunteerSessions.push(volunteerSession);

    // Add a new row onto the reporting table
    $('#stewardReportingTable').find('tbody:last')
        .append('<tr>')
        .append('<td>Date <input class="dateField" id="' + dateFieldId + '" name="date" type="text" data-vs-bind-' + index + '="date"></td>')
        .append('<td>Program <select id="' + programFieldId + '" onchange="checkPatrolButtons(jQuery(this));" data-vs-bind-' + index + '="program"></select></td>')
        .append('<td>Hours <input id="' + hoursFieldId + '" name="hours" type="number" min="0" value="0" step="0.5" data-vs-bind-' + index + '="hours"/></td>')
        .append('<td><input class="southarea" disabled="disabled" id="' + southMapFieldId + '" name="southarea" type="button" value="South Area"/></td>')
        .append('<td><input class="northarea" disabled="disabled" id="' + northMapFieldId + '" name="northarea" type="button" value="North/Central Area"/></td>')
        .append('</tr>');

    var mapCanvasContainer = $('#mapCanvasContainer');
    mapCanvasContainer
        .append('<div id="' + northMapCanvasId + '" style="width: 1px; height: 1px;"></div>');
    mapCanvasContainer
        .append('<div id="' + southMapCanvasId + '" style="width: 1px; height: 1px;"></div>');

    var northMapOptions = {
        zoom: 8,
        center: new google.maps.LatLng(33.647900, -111.862236),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    var southMapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(33.647900, -111.862236),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    var northMap = new google.maps.Map(document.getElementById(northMapCanvasId), northMapOptions);
    loadPins(northMap, "north", volunteerSession);

    var southMap = new google.maps.Map(document.getElementById(southMapCanvasId), southMapOptions);
    loadPins(southMap, "south", volunteerSession);

    var northMapDialog = $("#" + northMapCanvasId).dialog({
        autoOpen: false,
        closeOnEscape: true,
        width: 800,
        height: 600,
        title: "North Area Reporting",
        resizeStop: function(event, ui) {
        	google.maps.event.trigger(northMap, 'resize');
        	$("#" + northMapCanvasId).dialog("option", "buttons", {
                "Save": function () {
                	$("#" + northMapCanvasId).dialog('close');
                }
            });
        },
        open: function(event, ui) {
            google.maps.event.trigger(northMap, 'resize');
            $(".ui-dialog-titlebar-close").hide();
        },
        show: "blind",
        hide: "blind",
        buttons: {
            "Save": function () {
                northMapDialog.dialog('close');
            }
        }
    });

    var southMapDialog = $("#" + southMapCanvasId).dialog({
        autoOpen:false,
        closeOnEscape: true,
        width: 800,
        height: 600,
        title: "South Area Reporting",
        resizeStop: function(event, ui) {
        	google.maps.event.trigger(southMap, 'resize');
        	$("#" + southMapCanvasId).dialog("option", "buttons", {
                "Save": function () {
                	$("#" + southMapCanvasId).dialog('close');
                }
            });
        },
        open: function(event, ui) {
            google.maps.event.trigger(southMap, 'resize');
            $(".ui-dialog-titlebar-close").hide();
        },
        show: "blind",
        hide: "blind",
        buttons: {
            "Save": function () {
                southMapDialog.dialog('close');
            }
        },
        closeOnEscape: false
    });

    $('#' + northMapFieldId).click(function(){
        var georssLayerNorth = new google.maps.KmlLayer(northMapURL);
        georssLayerNorth.setMap(northMap);
        $("#" + northMapCanvasId).dialog("open")
    });
    $('#' + southMapFieldId).click(function(){
        var georssLayerSouth = new google.maps.KmlLayer(southMapURL);
        georssLayerSouth.setMap(southMap);
        $("#" + southMapCanvasId).dialog("open")
    });

    // Initialize a date picker for the date field
    $('#' + dateFieldId).datepicker({defaultDate: new Date(), dateFormat: 'mm-dd-yy'});

    setProgramOptions(programs, index);

    reportingTableRowIndex++;
}

/**
 * Sets the options for the program
 * dropdown at the provided index.
 * @param data The program data
 * @param index Index of the dynamically incremented program element.
 */
function setProgramOptions(data, index) {
    $("#sessionProgramId-" + index).append(new Option("Select one...", null));
    $(data).each(function(i, d) {
        $("#sessionProgramId-" + index).append(new Option(d.programValue, d.programKey));
    });
}

/**
 * Sets pins on the passed in Google map.
 * @param pinJSON
 * @param map
 * @param volunteerSession
 */
function setPins(pinJSON, map, volunteerSession) {
    var pins = eval(pinJSON);

    $.each(pins, function(index, pin) {
        var color = pin.color;
        if (color == null) color = '888888';
        var originalColor = color;
        var latLong = new google.maps.LatLng(pin.latitude, pin.longitude);
        var anchorPoint = new google.maps.Point(pin.anchorX, pin.anchorY);

        var marker = new MarkerWithLabel({
            map: map,
            position: latLong,
            icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|" + color,
            labelContent: pin.pinName
        });
        marker.set("id", pin.id);
        marker.set("color", color);
        marker.set("originalColor", originalColor);
        marker.set("patrolled", false);

        google.maps.event.addListener(marker, 'click', function() {
            var reportFormObject;

            if (marker.reportingForm == null) {
                reportFormObject = initializeTrailReportingForm(volunteerSession);
                reportFormObject.attributes.pinId = marker.id;
                marker.set("reportingForm", "trailReportingDiv-" + reportFormObject.attributes.uid.toString());
                marker.set("trailReportingObject", reportFormObject);
            }

            if (marker.patrolled == true) {

                var trailReportingDivId = marker.reportingForm;
                var trailReportingDiv = $('#' + trailReportingDivId);
                var trailReportingForm = trailReportingDiv.find("[id^='trailReportingForm-']");

                trailReportingDiv.find("[id^='problemDateId-']").datepicker({defaultDate: new Date(), dateFormat: 'yy-mm-dd'});

                populateNotificationTypes(trailReportingDivId);
                var errorsList = trailReportingDiv.find("[id^='errorsListId-']");

                // Turn marker to red
                marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=•|FF0000" );
                marker.color = "FF0000";

                var dialog = trailReportingDiv.dialog({
                    title: "Report Trail Issue",
                    width: 500,
                    height: 780,
                    resizable: false,
                    draggable: false,
                    buttons: {
                        "Save": function () {
                            $.ajax({
                                type: "POST",
                                url: appContext + "/trailReportNotification/validateTrailReport",
                                data: trailReportingForm.serialize()
                            }).done(function(data, textStatus, jqXHR) {
                                    marker.trailReportingObject.attributes.issue = true;
                                    dialog.dialog('close');
                                    errorsList.empty();
                            }).fail(function(jqXHR, textStatus, errorThrown) {
                                errorsList.empty();
                                var validationErrors = jQuery.parseJSON(jqXHR.responseText).valErrors;
                                for (var i = 0; i < validationErrors.length; i++) {
                                    errorsList.append('<li style="color:red;">' + validationErrors[i] + '</li>');
                                }
                            });
                        },
                        "Clear": function () {
                            errorsList.empty();
                            volunteerSession.attributes.trailReports.splice(volunteerSession.attributes.trailReports.indexOf(marker.trailReportingObject), 1);
                            marker.set("reportingForm", null);
                            marker.set("trailReportingObject", null);
                            marker.color = marker.originalColor;
                            marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|" + marker.color );
                            marker.set("patrolled", false);
                            dialog.dialog('close');
                        }
                    },
                    closeOnEscape: false,
                    open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }
                });
            } else {
                marker.setIcon("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=.|00FF00" );
                marker.color = "00FF00";
                marker.set("patrolled", true);
            }
        });

    });
}

/**
 * Loads the pin data for each site in an area
 * and sets them on the passed-in map when successful.
 * @param map The Google map to set the pins on
 * @param area Which area to load pins for ("north" or "south")
 * @param volunteerSession The current volunteerSession object to associate trail reports from the map to
 */
function loadPins(map, area, volunteerSession) {
    $.ajax({type:'GET',
        url: window.appContext + '/trailSection/pinsForArea',
        data: {'area': area},
        success:function(data,textStatus){setPins(data, map, volunteerSession);},
        error:function(XMLHttpRequest,textStatus,errorThrown){}});
}

/**
 * Enables the south area and north area patrol buttons that pop up
 * the map. Since this is a dynamic table, this function takes an element
 * of a table row and enables the patrol buttons closest to it.
 * @param siblingElement Element within the same table row as the target patrol buttons.
 */
function enablePatrolButtons(siblingElement) {
    siblingElement.closest('td').nextUntil('tr').find("[id*='sessionNorthMapId']").attr('disabled', false);
    siblingElement.closest('td').nextUntil('tr').find("[id*='sessionSouthMapId']").attr('disabled', false);
}

/**
 * Disables the south area and north area patrol buttons that pop up
 * the map. Since this is a dynamic table, this function takes an element
 * of a table row and disables the patrol buttons closest to it.
 * @param siblingElement Element within the same table row as the target patrol buttons.
 */
function disablePatrolButtons(siblingElement) {
    siblingElement.closest('td').nextUntil('tr').find("[id*='sessionNorthMapId']").attr('disabled', true);
    siblingElement.closest('td').nextUntil('tr').find("[id*='sessionSouthMapId']").attr('disabled', true);
}

/**
 * Checks to see if the selected option in the
 * select element is a "patrol" option. If it is,
 * the patrol buttons should be enabled. If not,
 * the patrol buttons should be disabled.
 * @param selectElement Select element to check
 */
function checkPatrolButtons(selectElement) {
    var programValue = selectElement.find(":selected").val();
    if (programValue.substring(0,7) == 'PATROL_' && programValue.substring(0,8) != 'PATROL_A') {
        enablePatrolButtons(selectElement);
    } else {
        disablePatrolButtons(selectElement);
    }
}

/**
 * Submits all the volunteer session data currently
 * entered on the page. If the data in the input fields
 * isn't valid, a 400 will be returned with error messages.
 */
function submitStewardReport() {
    var errorsList = $('#volunteerSessionErrors');

    $.ajax({
        type: "POST",
        url: appContext + "/volunteerSessionReporting/saveVolunteerSessions",
        data:  JSON.stringify(formatVolunteerSessionsForSubmit()),
        contentType: "application/json",
        dataType: "json"
    }).done(function(data, textStatus, jqXHR) {
            errorsList.empty();
            alert(data.message);
            window.location.replace(data.successLink);

    }).fail(function(jqXHR, textStatus, errorThrown) {
            errorsList.empty();
            var validationErrors = jQuery.parseJSON(jqXHR.responseText).valErrors;
            for (var i = 0; i < validationErrors.length; i++) {
                errorsList.append('<li style="color:red;">' + validationErrors[i] + '</li>');
            }
    });
}

/**
 * Formats the current volunteerSessions object
 * into a more flattened json version so parsing and
 * binding is easier on the backend.
 * @returns {{volunteerSessions: Array}}
 */
function formatVolunteerSessionsForSubmit() {
    var stewardReport = {
        volunteerSessions: []
    };

    for (var i=0; i < volunteerSessions.length; i++) {
        var tempVolSession = volunteerSessions[i].attributes;
        if(tempVolSession.hasOwnProperty("date") ||
           tempVolSession.hasOwnProperty("program") ||
           tempVolSession.hasOwnProperty("hours")) {

            var trailReportArray = [];


            for (var j=0; j < volunteerSessions[i].attributes.trailReports.length; j++) {
                trailReportArray.push(volunteerSessions[i].attributes.trailReports[j].attributes)
            }
            tempVolSession.trailReports = trailReportArray;
            stewardReport.volunteerSessions.push(tempVolSession);
        }
    }
    return stewardReport;
}