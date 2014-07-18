function populateNotificationTypes(parentDivId) {
    $.ajax({
        type: "GET",
        url: appContext + "/notificationType/getAllNotificationTypes"
    }).done(function(data, textStatus, jqXHR) {
            var selectElement = $('#' + parentDivId).find("[id^='problemNotificationTypeId-']")
            $(data).each(function(i, d) {
                selectElement.append(new Option(d.display, d.code));
            });
        }).fail(function(jqXHR, textStatus, errorThrown) {
            console.error("Error")
            console.error("Error Thrown: " + errorThrown)
            console.error("textStatus: " + textStatus)
    });
}