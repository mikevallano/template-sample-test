// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

  // $('#main').hide();

  var tacos = "i like submitting tacos";
  console.log(tacos);

// $("#header").hover(function() {
//   $('#header').css("background-color","yellow")
//   });

$( "#header" ).hover(
  function() {
    $( this ).css("background-color","yellow");
  }, function() {
    $( this ).css("background-color","white");
  }
);

$('#loner_taco').hide();
$('#loner_taco').val(tacos);



$('#main').hide();

  $('#kitten_name').hide();
  $('#kittyfield').hide();
  $('#kitfield').hide();
  $('#softnessfield').hide();
  $('#softnessid').hide();
  $('#new_kitty_button').hide();//Initially form wil be hidden.
  $('#kittybutton').click(function() {
    $('#kitten_name').slideDown();
    $('#kitfield').slideDown();
    $('#kittyfield').slideDown();
    $('#softnessfield').slideDown();
    $('#softnessid').slideDown();
    $('#new_kitty_button').slideDown();
  });


  // Handle form submission
    $("#new_kitty_button").click(function(e) {
      e.preventDefault();

      $('#kitten_name').slideUp();
      $('#kittyfield').slideUp();
      $('#kitfield').slideUp();
      $('#softnessfield').slideUp();
      $('#softnessid').slideUp();
      $('#new_kitty_button').slideUp();

        // Valid form, proceed
        $.post("/kittens/", {
          "kitten[name]": $("#kittyfield").val(),
          "kitten[softness]": $("#softnessid").val()
        })
          .done(function(data) {
          var newkitname = "new kitty name: " + $("#kittyfield").val();
          console.log(newkitname);
      });
    });

     });

  // <%= f.collection_select(:category_ids, Category.all, :id, :name, { :label => "Categories", :include_blank => "Information" }, { :multiple => true, :size => 5 } ) %>
  //  <div class="form-group">
  //   <label class="control-label col-md-2 required"></label>
  //     <div class="col-md-8" id="show-add-category-field">
  //      <%= submit_tag '+', :type => 'button', :class => "btn btn-primary" %>
  //     </div>
  //     <div class="form-group">
  //       <label class="control-label col-md-2 required"></label>
  //         <div class="col-md-8 col-md-offset-2" id="add-category-field">
  //           <%= text_field_tag :new_category_name, nil, :placeholder => "Category Name", :class => "form-control" %>
  //         </div>
  //         <div class="col-md-8 col-md-offset-2" id="add-category-description" style="display: none;">
  //           <%= text_area :new_category_description, nil, :placeholder => "Category Description", :class => "form-control" %>
  //         </div>
  //     </div>
  //     <div class="col-md-8 col-md-offset-2" id="submit-new-category">
  //       <%= button_tag 'Add', :id => "new_category_button",  :type => 'button', :class => "btn btn-primary" %>
  //     </div>
  //   </div>