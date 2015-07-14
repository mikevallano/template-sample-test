    // Datetime Picker
$(document).ready(function() {

console.log("i have been spotted")


$("#jaxy").click(function() {
    console.log("i've been clicked");
  });

var testli = "<li>I am text. Hear me roar!</li>";


// functioning ajax call:
// $('#jaxyinfo').on("click", function() {
//   $.ajax({
//     type: 'GET',
//     url: '/kittens.json',
//     success: function(data) {
//       $.each(data, function(i, kitteh) {
//         $('#jaxyinfo').append('<li>' + kitteh.name + '</li>');
//       })
//     }
//   });
// });

$('#jaxyinfo').on("click", function() {
  $.ajax({
    type: 'GET',
    url: '/kittens.json',
    success: function(data) {
      $.each(data, function(i, kitteh) {
        $('#jaxyinfo').append('<li>' + kitteh.name + '</li>');
        console.log('success is firing');
      })
    },
    error: function(request, errorType, errorMessage) {
      alert('OOPSIE. You got an error of type: ' + errorType + ' with message: ' + errorMessage);
    },
    // timeout defines milliseconds until a timeout happens
    timeout: 3000,
    // beforeSend fires before success in the time it takes to send the call and receive back an error or success.
    beforeSend: function() {
      $('#jaxyinfo').addClass('is-loading');
      console.log('before send message is firing');
    },
    // complete gets called after both success and error
    complete: function () {
      $('#jaxyinfo').removeClass('is-loading');
      console.log('complete message is firing')
    }
  });
});


// the final closer
});