// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

  $('#main').hide();

  var tacos = "i like submitting tacos";
  console.log(tacos);

// $("#header").hover(function() {
//   $('#header').css("background-color","yellow")
//   });

$("#header").hover(function() {
    $(this).css("color",'#666666');
  }, function() {
    $(this).css("color","black");
  }
);

 $(function(){
    var ogtext = $('#header').text();
     $('#header').click(function () {
        $(this).text(function(i, text){
            return text === ogtext ? "i done changed" : ogtext;
        })
     });
  })

$('#loner_taco').hide();
$('#loner_taco').val(tacos);


$('#main').hide();
$('#kittyform').hide();
$('#kittybutton').on('click', function() {
    $('#kittyform').slideToggle();
  });


  // Handle form submission
$("#new_kitty_button").on('click', function(event) {
  $('#kittyform').slideUp();
  event.preventDefault();

    // Valid form, proceed
    $.post("/kittens/", {
      "kitten[name]": $("#kittyfield").val(),
      "kitten[softness]": $("#softnessid").val()
    })
      .done(function(data) {
      var newkitname = "new kitty name: " + $("#kittyfield").val();
      var newkitsoft = "new kitty softness: " + $("#softnessid").val();
      console.log(newkitname);
      console.log(newkitsoft);
  });
});

 });