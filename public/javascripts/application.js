// Put your application scripts here
$(function(){
  $("div.alert-message a.close").click(function(e){
    e.preventDefault();
    $(this).closest("div.alert-message").fadeOut(function(){
      $(this).remove();
    });
  });

  var activatePrimary = function(el) {
    $el = $(el);
    $.each($('.topbar .primary-nav li'), function(idx, menuItem){
      $(menuItem).closest('li').removeClass('active');
    });

    $el.closest('li').addClass('active');
  };

  $(".topbar h3 a").click(function(e){
    e.preventDefault();
    activatePrimary(this);
    $.scrollTo(0, 500);
  });

  // DRY this up
  $(".topbar .primary-nav li:nth-child(1)").click(function(e){
    e.preventDefault();
    activatePrimary(this);
    $.scrollTo("#when_and_where", 500, { offset : -50});
  });

  $(".topbar .primary-nav li:nth-child(2)").click(function(e){
    e.preventDefault();
    activatePrimary(this);
    $.scrollTo("#people", 500, { offset : -50 });
  });

  $(".topbar .primary-nav li:nth-child(3)").click(function(e){
    e.preventDefault();
    activatePrimary(this);
    $.scrollTo("#projects", 500, { offset : -50 } );
  });

  $("#contact_us").click(function(e){
    e.preventDefault();
    activatePrimary(this);
    if (! $('email-modal').is(':visible')) {
      $('.black_overlay').show();
      $('.email-modal').fadeIn();
    }
  });

  $(".email-modal .close, .email-modal .secondary").click(function(e){
    e.preventDefault();
    $('.email-modal').fadeOut();
    $('.black_overlay').fadeOut();
    $('#contact_us').closest("li").removeClass('active');
  });
});
