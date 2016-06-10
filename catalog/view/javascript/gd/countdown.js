 $(function() {
     $('.countdown').countdown('2016/6/10 16:59:59')
         .on('update.countdown', function(event) {
             var format = '%H:%M:%S';
             if (event.offset.days > 0) {
                 format = '%-d day%!d ' + format;
             }
             if (event.offset.weeks > 0) {
                 format = '%-w week%!w ' + format;
             }
             $(this).html(event.strftime(format));
         })
         .on('finish.countdown', function(event) {
             $(this).html('00:00:00')
                 .parent().addClass('disabled');

         });
 });