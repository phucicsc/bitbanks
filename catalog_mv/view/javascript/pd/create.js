$(function() {
	$('#submitPD').on('submit', function() {
		$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
		$('#Password2-error').hide().parent().removeClass('has-error').removeClass('has-success');
		$(this).ajaxSubmit({
			type : 'GET',
			beforeSubmit : function(arr, $form, options) {
				$('.alert-edit-account').hide();
				$('.alert-dismissable').hide();
				if (arr[0].value === "") {
					$('#amount-error').show().parent().addClass('has-error');
					return false;
				} else {
					$('#amount-error').parent().addClass('has-success');
				}
				if (arr[1].value === "") {
					$('#Password2-error').show().parent().addClass('has-error');
					$('#Password2-error span').show().html('The transaction password field is required.');
					return false;
				} else {
					$('#Password2-error').parent().addClass('has-success');
				}
				arr[0].value !== "" && arr[1].value !== "" && $('.loading').show() && $('#submitPD button').hide();
			},
			success : function(result) {
				result = $.parseJSON(result);
				if (_.has(result, 'login') && result.login === -1) {
					location.reload(true);
				} else {
					$('.loading').hide() && $('#submitPD button').show();
					if (_.has(result, 'password') && result.password === -1) {
						$('#Password2').parent().addClass('has-error');
						$('#Password2-error').show();
						$('#Password2-error span').show().html('Wrong transaction password, please try again');
						return true;
					} else {
						$('#Password2').parent().addClass('has-success');
					}

					if (_.has(result, 'pin')  && result.pin === -1 && _.has(result, 'password') && result.password === 1) {
						$('.alert-dismissable').show();
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html('Wrong transaction password, please try again');
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
		
					}
					if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'password') && result.password === 1 && _.has(result, 'pin')  && result.pin === 1 ) {
				
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html('Wrong transaction password, please try again');
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
						$('.alert-edit-account').show();
						$('.alert-dismissable').hide();
				
					}

					if(_.has(result, 'ok') && result.ok === -1 && _.has(result, 'password') && result.password === 1 && _.has(result, 'pin')  && result.pin === 1){
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html('Wrong transaction password, please try again');
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
						$('.alert-edit-account').hide();
						$('.alert-dismissable').show();
					
						
					}
				}
			}
		});
		return false;
	});
}); 