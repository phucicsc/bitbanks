  /**
  * @description: Call functions of website
  * @version: 1.0
  **/

(function($)
{
  // console.log('innit js');
  /****************************
  ***** Global variables *****
  ****************************/
  var diva    = {};
  var DESKTOP = 992;

  /*************************************
  ***** Main functions start here *****
  *************************************/
  $(document).ready(function(){
    diva.initElements.largeScreen();
    diva.initElements.touchScreen();
    diva.initElements.menuMobile();
    diva.initElements.menuAccordion();
  });



  /******************************
  ***** Functions built in *****
  ******************************/
  diva.initElements = {
    wowEffect: function() {
      var IE = (!! window.ActiveXObject && +(/msie\s(\d+)/i.exec(navigator.userAgent)[1])) || NaN;
      if (IE < 9) {
        return false;
      }
      else {
        new WOW().init();
      }
    },
    touchScreen: function() {
      try {
        if (Modernizr.touch) {
          $('body').bind('touchstart', function() {});
          var menuItems = $('.navbar-collapse .nav > li');
          menuItems.on('click', function(e){
            if($(window).width() >= DESKTOP) {
              e.preventDefault();
              if(!$(this).hasClass('active')) {
                menuItems.removeClass('active');
                $(this).addClass('active');
                $('.mega-menu').removeClass('active');
                $('.mega-menu', this).addClass('active');
              }
              else {
                $(this).removeClass('active');
                $('.mega-menu').removeClass('active');
              }
            }
          });
        }
      }
      catch(err) {
        return false;
      }
    },
    largeScreen: function() {
      $(window).resize(function(event) {
        if($(window).width() >= DESKTOP) {
          $('.navbar-toggle').addClass('collapsed');
          $('.navbar-collapse').removeClass('active').removeAttr('style');
           $('.navbar-collapse .nav > li').removeClass('active');
           $('.mega-menu').removeAttr('style').removeClass('active');
           $('.main-menu .accordion-ctrl').removeClass('active');
           $('.accordion-content').removeAttr('style');
        };
      });
    },
    menuMobile: function() {
      $('.main-menu li.active').parents().show();
      var heightcreen = $(window).height();
      $('.navbar-toggle').on('click', function(e){
        e.preventDefault();
        $(this).toggleClass('collapsed');
        if($('.navbar-collapse').hasClass('active')){
          $('.navbar-collapse').removeClass('active').animate({left: -100 + '%'}, 400);
          $('.navbar-default').animate({left: '10px'}, 400);
        }
        else {
          $('.navbar-collapse').addClass('active').animate({left: 0}, 400);
          $('.navbar-default').animate({left: '280px'}, 400);
        }
      });
    },
    menuAccordion: function(){
      var el    = $('.main-menu .accordion-ctrl');
      var elSub = $('.mega-menu .accordion-ctrl-1');
      el.click(function(e) {
        e.preventDefault();
        $(this)
          .toggleClass('active')
          .closest('li').children('.mega-menu').slideToggle(400);
        $(this).parent().find('.mega-menu .accordion-content').hide(400);
        $(this).parent().find('.accordion-ctrl-1').removeClass('active');
      });
      elSub.click(function(e) {
        e.preventDefault();
        $(this)
          .toggleClass('active')
          .parents('.group-link').children('.accordion-content').slideToggle(400);
      });
    }
  };

})(jQuery);
