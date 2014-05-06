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

  // horrible dirty global, i'm very sorry
  currentColor = '#fff'

  $('#show_pattern').click(function() {
    $('#pattern_toggle').slideToggle( 'slow' );
    if($("#show_pattern").html() == "Show")
        $("#show_pattern").html("Hide");
      else
        $("#show_pattern").html("Show");
  });
    
  $('#add_row').bind("ajax:success", function(evt, data, status, xhr) {
    $('#pattern_edit').append("<div class='pattern_row'></div>");
    var count = $('.pattern_row').first().children().length;
    for (var i = 0; i < count; i++) {
    $('.pattern_row').last().append("<div class='stitch'></div>");
    }
  });

  $('#add_column').bind("ajax:success", function(evt, data, status, xhr) {
    $('.pattern_row').append("<div class='stitch'></div>");
  });

  $('.button_to').on('submit', function(ev) {
    ev.preventDefault();
    url = $(ev.currentTarget).attr('action');
    data = {};
    data.pattern = { rows_attributes: [], colors_attributes: [] };
    
    $('.color_swatch').each(function(index, color) {
      var colorData = {};
      colorData.id = $(color).data('id');
      colorData.color = $(color).css('background-color');
      data.pattern.colors_attributes.push(colorData);
    });

    $('#pattern_edit .pattern_row').each(function(index, row) {
      var rowData = { stitches_attributes: [] };
      rowData.id = $(row).attr('id');
      $(row).children().each(function(index, stitch) {
        var stitchData = {};
        stitchData.id = $(stitch).data('id');
        stitchData.color = $(stitch).css('color');
        stitchData.stitch_symbol = $(stitch).html().trim();
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
        window.location.href = '/patterns/' + $('#pattern_edit').data('id') + '/edit';
      },
    });
    return false;
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
      $(this).html($stitchType);
      $(this).css({color: currentColor});
    }
  });

  $(".stitch").mousedown(function() {
    $(this).html($stitchType);
    $(this).css({color: currentColor});
  });

  $(".stitch").mousedown(function() {
    $(this).html($stitchType);
    $(this).css({color: currentColor});
  });


  function addEventListeners() {
    $('#purl').click(function() {
      $stitchType = $(this).html();
    });

    $('#knit').click(function() {
      $stitchType = $(this).html();
    });


    $('#add').click(function() { 
      colorValue = $('#my_colour_code').css('background-color')
      $('.color_swatch').each(function(i, el) {
        $el = $(el)
        if ($el.css("background-color") == "rgba(0, 0, 0, 0)") {
          $el.css('background-color', colorValue)
          return false
        }
      })
    })

    $('#remove').click(function() {
      $('.color_swatch').css('background-color', "rgba(0, 0, 0, 0)")
    })

    $('.color_swatch').click(function() {
      $el = $(this)
      currentColor = $el.css('background-color')
    })
  }

  $('#new_pattern').replaceWith('<a href=#pattern_form rel="leanModal"><span class="glyphicon glyphicon-plus"></span></a>');

  $("a[rel=leanModal]").leanModal();

  $("#filter_button").click(function(){
    $("#filter").toggleClass("hidden");
  });

  $("#profile_button").click(function(){
    $("#profile").toggleClass("hidden");
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

  $container.imagesLoaded(function() {

    $container.isotope({
      // update columnWidth to a percentage of container width
      masonry: { columnWidth: $container.width() / 5 }
    });
  
    $container.infinitescroll({

      navSelector  : "#pagination",            
                     // selector for the paged navigation (it will be hidden)
      nextSelector : "#pagination .pagination .next_page",    
                     // selector for the NEXT link (to page 2)
      itemSelector : ".pattern_card"          
                     // selector for all items you'll retrieve
    },
    function(newElements) {
      $container.isotope('appended', $(newElements));
    }
    );
  });

  $(function() {
    $( "#tabs" ).tabs();
  });

  addEventListeners();

});

