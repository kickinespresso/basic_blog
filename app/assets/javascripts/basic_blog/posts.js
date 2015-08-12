// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
    $(".datepicker").datepicker({
        dateFormat: "MM d, yy"
    });


});

$(function() {
    $(".timepicker").timepicker({
        showPeriod: true
    });
});
