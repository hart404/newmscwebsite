/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var popupStatus1 = 0; // set value

var amount_val = "";

function validateForm()

{
	var email_addess = document.getElementById("email_addess").value

	var atpos = email_addess.indexOf("@");
	var dotpos = email_addess.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email_addess.length) {
		$("#email_addessError").html("You must enter a valid Email.")
		return false;
	}

	var firstname = document.getElementById("firstname").value
	var lastname = document.getElementById("lastname").value
	var company = document.getElementById("company").value

	var myJSONText = "data={'email_address':'" + email_addess
			+ "','firstname':'" + firstname + "','lastname':'" + lastname
			+ "','companyname':'" + company + "'}"

	// var url = "./person/registerUser?data="+myJSONText;
	//	    
	// $(location).attr('href',url);

	$.ajax({
		type : "POST",
		url : contact_url,
		data : myJSONText,
		cache : false,
		success : function(text) {
			alert("You are successfully subscribed");
			location.reload();
		}

	}).fail(function() {
		closeprocessing();
		alert("Sorry, there was an error. Please try again");
	});

}

jQuery(function($) {

	$("#donateNow").click(function() {

		$("#error1").html("");

		$("#donationamount").val("");
		$("#recurring_type").val("");

		$('input[id="radio1"]').prop('checked', true);
		$('input[id="radio11"]').prop('checked', true);

		// $("#radio1").attr("checked", "checked");
		// $("#radio2").attr('checked', false);
		// $("#radio3").attr('checked', false);

		setTimeout(function() { // then show popup, deley in .5 second
			loadPopup1(); // function show popup
		}, 500); // .5 second
		return false;
	});

	/* start of mydiv3 */

	$(".buttonDropShadow").click(function() {

		$("#donationamount").val("");
		$("#recurring_type").val("");

		$('input[id="radio1"]').prop('checked', true);
		$('input[id="radio11"]').prop('checked', true);

		setTimeout(function() { // then show popup, deley in .5 second
			loadPopup1(); // function show popup
		}, 500); // .5 second
		return false;
	});

	$(".supportUs").click(function() {

		$("#donationamount").val("");
		$("#recurring_type").val("");

		$('input[id="radio1"]').prop('checked', true);
		$('input[id="radio11"]').prop('checked', true);

		setTimeout(function() { // then show popup, deley in .5 second
			loadPopup1(); // function show popup
		}, 500); // .5 second
		return false;
	});

	function loadPopup1() {
		if (popupStatus1 == 0) { // if value is 0, show popup

			$("#myDiv3").fadeIn(0500); // fadein popup div
			$("#backgroundPopup").css("opacity", "0.3"); // css opacity,
															// supports IE7, IE8

			$("#backgroundPopup").fadeIn(0001);
			$(".menuContainer").css("opacity", "0.3"); // css opacity, supports
														// IE7, IE8

			$(".menuContainer").fadeIn(0001);

			popupStatus1 = 1; // and set value to 1
		}
	}

	$("a.close").click(function() {
		disablePopup1(); // function close pop up
	});

	function disablePopup1() {
		if (popupStatus1 == 1) { // if value is 1, close popup
			$("#myDiv3").fadeOut("normal");
			$("#backgroundPopup").fadeOut("normal");
			// $(".menuContainer").fadeOut("normal");
			$(".menuContainer").css("opacity", "1");
			popupStatus1 = 0; // and set value to 0
		}
	}

	/* end of mydiv3 */

	/* start of mydiv6 */
	$(".subscribeButton").click(function() {

		setTimeout(function() { // then show popup, deley in .5 second
			loadPopup(); // function show popup
		}, 500); // .5 second
		return false;
	});

	var popupStatus = 0; // set value

	function loadPopup() {
		if (popupStatus == 0) { // if value is 0, show popup

			$("#myDiv6").fadeIn(0500); // fadein popup div
			$("#backgroundPopup").css("opacity", "0.3"); // css opacity,
															// supports IE7, IE8

			$("#backgroundPopup").fadeIn(0001);
			$(".menuContainer").css("opacity", "0.3"); // css opacity, supports
														// IE7, IE8

			$(".menuContainer").fadeIn(0001);

			popupStatus = 1; // and set value to 1
		}
	}

	$("a.close").click(function() {
		disablePopup(); // function close pop up
	});

	function disablePopup() {
		if (popupStatus == 1) { // if value is 1, close popup
			$("#myDiv6").fadeOut("normal");
			$("#backgroundPopup").fadeOut("normal");
			// $(".menuContainer").fadeOut("normal");
			$(".menuContainer").css("opacity", "1");
			popupStatus = 0; // and set value to 0
		}
	}

	/* end of mydiv6 */

});