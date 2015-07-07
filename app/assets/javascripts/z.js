    // Datetime Picker
$(document).ready(function() {

console.log("i have been spotted")


$("#jaxy").click(function() {
    console.log("i've been clicked");
  });

var testli = "<li>I am text. Hear me roar!</li>";

// $("#jaxyinfo").click(function() {
//     $(this).append(testli);
//   });

  // $('#jaxyinfo').on("click", function() {
  //     $.ajax('http://localhost:5000/kittens', {
  //       success: function(response) {
  //         $('#jaxyinfo').html(response).fadeIn();
  //       }
  //     });
  // });

$('#jaxyinfo').on("click", function() {
  $.ajax({
    type: 'GET',
    url: '/kittens.json',
    success: function(data) {
      $.each(data, function(i, kitteh) {
        $('#jaxyinfo').append('<li>' + kitteh.name + '</li>');
      })
    }
  });
});


// the final closer
});