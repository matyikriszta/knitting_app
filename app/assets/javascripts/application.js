// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require bootstrap-colorpicker
//= require jquery_ujs
//= require jquery_nested_form
//= require_tree .

$(document).ready(function(){

  $('.form-group').minicolors(settings);

  var isDown = false;   // Tracks status of mouse button

  $(document).mousedown(function() {
    isDown = true;      // When mouse goes down, set isDown to true
  })
  .mouseup(function() {
    isDown = false;    // When mouse goes up, set isDown to false
  });

  $(".stitch").mouseover(function(){
    if(isDown) {        // Only change css if mouse is down
       $(this).css({background:"rgb(133,58,82)"});
    }
  });

  $(".stitch").mousedown(function() {
    $(this).css({background:"rgb(133,58,82)"});
  });
});

