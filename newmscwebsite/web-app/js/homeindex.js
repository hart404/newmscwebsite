/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function showsDonatePopup() {

	loadPopupBox3();

}

function showSubscribeForm() {

	loadPopupBox6();

}

function loadPopupBox6() {

	// To Load the Popupbox

	$('#myDiv6').show();
	// $('#myDiv2').draggable();
	$('#myDiv6').fadeIn("slow");
	$('#myDiv6').animate({
		'top' : '5%'
	}, 0);

}

function unloadPopupBox6() {

	$('#myDiv6').fadeOut("slow");

}

function closePopup6() {

	unloadPopupBox6();

}
