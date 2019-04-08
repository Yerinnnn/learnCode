// $('.message a').click(function () {
//     $(".email_address").show();

// });

$(document).ready( function() {
    $('.message a').click(function() {
      $('.email_address').toggle(0);
    } );
  } );