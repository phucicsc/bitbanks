$(function() {
	$('input#amount').keydown(function(event) {

		if (event.keyCode === 13 || event.keyCode === 190 || event.keyCode === 110) {
			return true;
		}
		if (!(event.keyCode == 8 || event.keyCode == 46 || (event.keyCode >= 35 && event.keyCode <= 40) || (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105))) {
			event.preventDefault();
		}
	});

	var resetForm = function() {
		$('#wallet-error').hide();
		$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
		$('#Password2-error').hide().parent().removeClass('has-error').removeClass('has-success');
	};
	var c_wallet_current = $('#c-wallet').data('value');
	var r_wallet_current = $('#r-wallet').data('value');


	var parseQueryString = function() {

        var str = window.location.search;
        var objURL = {};

        str.replace(
            new RegExp("([^?=&]+)(=([^&]*))?", "g"),
            function($0, $1, $2, $3) {
                objURL[$1] = $3;
            }
        );
        return objURL;
    };

    var paramt = parseQueryString();

    switch (paramt['create']) {
        case 'success':
            $('.alert-edit-account').show();
            break;
    }

	$('#createGD').on('submit', function() {
		$(this).ajaxSubmit({
			type : 'POST',
			beforeSubmit : function(arr, $form, options) {
				$('.alert-edit-account').hide();
				$('.alert-dismissable').hide();
				resetForm();
				if (arr[0].value === '0' || arr[0].value === '') {
					$('#amount-error').show().find('span').html('Please enter your receivable amount').parent().parent().addClass('has-error');
					return false;
				}

				if (!$.isNumeric(arr[0].value)) {
					$('#amount-error').show().find('span').html('The field receivable amount must be a number').parent().parent().addClass('has-error');
					return false;
				}

				if ( typeof $('input[name=FromWallet]:checked').val() === 'undefined') {
					$('#wallet-error').show();
					return false;
				}

				if ($('input[name=FromWallet]:checked').val() === '1') {
					if (parseFloat(arr[0].value) < 0.5 || parseFloat(arr[0].value) > parseFloat(c_wallet_current) || parseFloat(arr[0].value) > 3.0) {
						$('#amount-error').show().find('span').html('0.500000 BTC >= (C-Wallet) <= ' + c_wallet_current + ' BTC').parent().parent().addClass('has-error');
						return false;
					}
				} else {
					if (parseFloat(arr[0].value) < 0.42 || parseFloat(arr[0].value) > parseFloat(r_wallet_current)) {
						$('#amount-error').show().find('span').html('0.420000 BTC >= (R-Wallet) <= ' + r_wallet_current + ' BTC').parent().parent().addClass('has-error');
						return false;
					}
				}

				arr[0].value !== '0' && arr[0].value !== '' && $.isNumeric(arr[0].value) && $('#amount-error').hide().parent().addClass('has-success');

				arr[2].value === '' && $('#Password2-error').show().parent().addClass('has-error') || $('#Password2-error').hide().parent().addClass('has-success').removeClass('has-error');
				if (arr[2].value === '') {
					$('#Password2-error').show().parent().addClass('has-error').find('#Password2-error span').html('Please enter your password');
					return false;
				}

				$('.loading').show();
				$('#createGD button').hide();

			},
			success : function(result) {
				result = $.parseJSON(result);
				if (_.has(result, 'login') && result.login === -1) {
					location.reload(true);
				} else {
					if (_.has(result, 'password') && result.password === -1) {
						$('#Password2-error').show().parent().addClass('has-error').find('#Password2-error span').html('Wrong transaction password, please try again');
					} else {
						$('#Password2-error').hide().parent().removeClass('has-error').addClass('has-success');
					}
				}
				if(_.has(result, 'login') && result.ok === 1){
					if(_.has(result, 'link') ){
						location.href = result.link + '&create=success';
					}
				}
				if(_.has(result, 'login') && result.ok === -1){
					$('.alert-dismissable').show();
					$('.alert-edit-account').hide();
					$('#amount').val('').parent().removeClass('has-success').removeClass('has-error');
					$('#Password2').val('').parent().removeClass('has-success').removeClass('has-error');
				}
				$('.loading').hide();
				$('#createGD button').show();
			}
		});
		return false;
	});

});
