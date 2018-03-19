;(function($){
   $('.manger').hover(function() {
       $(this).find('.n-pop').slideDown(100);
   }, function() {
       $(this).find('.n-pop').hide();
   });

   $('.custom-menu ul li').hover(function() {
        $(this).addClass('cur');
        $(this).find('.m-pop').slideDown(100);
   }, function() {
        $(this).removeClass('cur');
        $(this).find('.m-pop').hide();
   });
})(jQuery)