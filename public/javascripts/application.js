// Put your application scripts here
$(function(){
  $("div.alert-message a.close").click(function(e){
    e.preventDefault();
    $(this).closest("div.alert-message").fadeOut(function(){
      $(this).remove();
    });
  });

  var activatePrimary = function(el) {
    var $el = $(el);
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

  var menuClick = function(selector, scrollTarget) {
    $(selector).click(function(e){
      e.preventDefault();
      activatePrimary(this);
      $.scrollTo(scrollTarget, 500, { offset : -50});
    });
  };

  menuClick(".topbar #when-and-where", "#when-and-where-section");
  menuClick(".topbar #people", "#people-section");
  menuClick(".topbar #projects", "#projects-section");

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
