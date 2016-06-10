$(function() {
	$('.onBack').on('click', function(){
		history.back();
		return false;
	});
	$('#comfim-pd').on('submit', function(){
		window.funLazyLoad.start();
		window.funLazyLoad.show();
		$(this).ajaxSubmit({
			success : function(result) {
				result = $.parseJSON(result);
				console.log(result);
				_.has(result, 'ok') && result.ok === -1 && alert("Error Server! Please try agian.");
				_.has(result, 'ok') && result.ok === 1 && location.reload(true);
			}
		});
		return false;
	});
});