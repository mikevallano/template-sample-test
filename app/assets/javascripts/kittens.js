// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


jQuery(document).ready(function(){
  console.log("the first kitty is: " + gon.first)
  gon.kittens.map( function(item) {
     console.log("this kitty's name is: " + item.name);
})
});