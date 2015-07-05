    // Datetime Picker
$(document).ready(function() {

  console.log("i have been spotted")

    $('.datetime').datetimepicker({
    // dateFormat: 'yy-mm-dd ',
    // timeFormat: 'hh:mm:00',
    format:'m/d/Y h:i A',
    formatDate:'m/d/Y g:i A',
    formatTime: 'g:i A',
    minDate: '-1970/01/02', // yesterday is minimum date
  });

  function form_submitted() {
    alert( 'date sent to server: ' + $('.datetime').val() );
  }


//   $(document).ready( function() {
//     $('#starts_at').datetimepicker(
//       { altField : '#datetime_to_server',
//       altFormat : 'yy-m-d',
//       altFieldTimeOnly : false,
//       altTimeFormat : 'hh:mm:00' });
//   });

// function form_submitted() {
//     alert( 'date sent to server: ' + $('#datetime_to_server').val() );
// }

  // $('#starts_at').datetimepicker({
  //   dateFormat: 'yy-mm-dd ',
  //   timeFormat: 'hh:mm:ss',
  //   ampm: true
  // });

  // $('#ends_at').datetimepicker({
  //   dateFormat: 'yy-mm-dd ',
  //   timeFormat: 'hh:mm:ss',
  //   ampm: true
  // });
  //   lang: 'en',
  //   timepicker: true,
  //   format:'m/d/Y h:i A',
  //   // dateFormat: 'yy-mm-dd',
  //   // timeFormat: 'h:i',
  //   formatDate:'m/d/Y g:i A',
  //   formatTime: 'g:i A',
  //   minDate: '-1970/01/02', // yesterday is minimum date
  // });
function form_submitted() {
 alert( 'date sent to server: ' + $('datetime').val() );
}


});