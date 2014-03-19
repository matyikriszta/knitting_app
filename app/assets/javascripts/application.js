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
//= require_tree .

$(document).ready(function(){

  $('.demo2').colorpicker();

  var isDown = false;   // Tracks status of mouse button

  $(document).mousedown(function() {
    isDown = true;      // When mouse goes down, set isDown to true
  })
  .mouseup(function() {
    isDown = false;    // When mouse goes up, set isDown to false
  });

  $(".stitch").mouseover(function(){
    if(isDown) {        // Only change css if mouse is down
      $bgColor = $('#my_colour_code').css('background-color');
      $(this).css({background: $bgColor});
    }
  });

  $(".stitch").mousedown(function() {
    $bgColor = $('#my_colour_code').css('background-color');
    $(this).css({background: $bgColor});
  });

  $('#new_pattern').replaceWith('<a href=#pattern_form rel="leanModal" class="button">New Pattern</a>');

  $("a[rel=leanModal]").leanModal();

});

