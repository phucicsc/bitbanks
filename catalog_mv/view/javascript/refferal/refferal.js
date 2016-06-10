$(function() {

    var link = $('.static-parent').data('link');
    $('.static-parent').removeAttr('data-link');

    var getSatic = function(parent_id, level, callback) {
        $.ajax({
            url: link,
            type: 'GET',
            data: {
                'id': parent_id,
                'level' : level
            },
            async: true,
            success: function(result) {
                result = $.parseJSON(result);
                callback(result);
            }
        });
    };


    $.each($('div.static-tree') , function(index, element){
    	var self = $(this);
    	_.each([0,1,2,3,4,5] , function(value){
    		getSatic(self.data('parent-id'), value + 1, function(result){
    			_.has(result, 'success') && self.find('.z-'+value).html(_.values(result)[0]);
    			if(self.find('.z-0').text() !== "" && self.find('.z-1').text() !== "" && self.find('.z-2').text() !== "" && self.find('.z-3').text() !== "" && self.find('.z-4').text() !== "" && self.find('.z-5').text() !== ""){
	    	 		self.show().parent().css({
			            'background-image': 'none'
			        });
	    	 	}
    		});
    	});  	
    });

    

});