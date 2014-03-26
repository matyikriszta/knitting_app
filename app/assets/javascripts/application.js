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
//= require jquery-ui-1.10.4.custom
//= require bootstrap-colorpicker
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

  $('.button_to').on('submit', function(ev) {
    ev.preventDefault();
    url = $(ev.currentTarget).attr('action');
    data = {};
    data.pattern = { rows_attributes: [] };
    $('#pattern .pattern_row').each(function(index, row) {
      var rowData = { stitches_attributes: [] };
      rowData.id = $(row).attr('id');
      $(row).children().each(function(index, stitch) {
        var stitchData = {};
        stitchData.id = $(stitch).data('id');
        stitchData.color = $(stitch).css('background-color');
        rowData.stitches_attributes.push(stitchData);
      });
      data.pattern.rows_attributes.push(rowData);
    });
    $.ajax({
      url: url, // url for the request
      type: "PUT", // whether this is a POST or GET request
      dataType: "json",
      data: data,
      success: function(data) { // code to run if the request succeeds
        console.log(data);
      },
    });
  });

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
      $(this).html($stitchType);
    }
  });

  $(".stitch").mousedown(function() {
    $bgColor = $('#my_colour_code').css('background-color');
    $(this).css({background: $bgColor});
    $(this).html(stitchType);
  });

  $(".stitch").mousedown(function() {
    $bgColor = $('#my_colour_code').css('background-color');
    $(this).css({background: $bgColor});
    $(this).html(stitchType);
  });

  $(".color_swatch").mousedown(function() {
    $bgColor = $('#my_colour_code').css('background-color');
    $(this).css({background: $bgColor});
  });

  function stitchType(el, type) {
    $(el).click(
      function() {
        $stitchType = type
      }
  )};

  function addEventListeners() {
    $('#purl').each(function(i, el) { stitchType(el, 'P');});
    $('#knit').each(function(i, el) { stitchType(el, 'K');});
  };

  $('#new_pattern').replaceWith('<a href=#pattern_form rel="leanModal"><i class="fa fa-plus fa-2x"></i></a>');

  $("a[rel=leanModal]").leanModal();

  $("#filter_dropdown").click(function(){
    $("#filter").toggleClass("hidden");
  });

  $(".profile_img").hover(function(){
    $("#edit_img").toggleClass("hidden");
  });

  var $container = $('#container')
  // initialize Isotope
  $container.isotope({
    // options...
    resizable: false, // disable normal resizing
    // set columnWidth to a percentage of container width
    masonry: { columnWidth: $container.width() / 5 }
  });

  // update columnWidth on window resize
  $(window).smartresize(function(){
    $container.isotope({
      // update columnWidth to a percentage of container width
      masonry: { columnWidth: $container.width() / 5 }
    });
  });

  $(function() {
    $( "#tabs" ).tabs();
  });

  addEventListeners();

});

