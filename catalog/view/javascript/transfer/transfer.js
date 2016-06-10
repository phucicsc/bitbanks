$( document ).ready(function() {
    $.fn.existsWithValue = function() {
        return this.length && this.val().length;
    };
    $('input#Quantity').keydown(function(event) {
        if (event.keyCode === 13) {
            return true;
        }
        if (!(event.keyCode == 8 || event.keyCode == 46 || (event.keyCode >= 35 && event.keyCode <= 40) || (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105))) {
            event.preventDefault();
        }
    });
    var options = {
        url: function(customer_name) {
            return $("#MemberUserName").data('link');
        },

        getValue: function(element) {
            return element.name;
        },
        ajaxSettings: {
            dataType: "json",
            method: "GET",
            data: {
            }
        },

        preparePostData: function(data) {
            data.customer_name = $("#MemberUserName").val();
            return data;
        },
        list: {
	        maxNumberOfElements: 8,
	    },

        requestDelay: 400
    };
    $("#MemberUserName").easyAutocomplete(options);

    var transfer = {
        errorReset : function(){
            $('#MemberUserName').parent().removeClass('has-error');
            $('#MemberUserName-error span').hide().html('');
            $('#Quantity').parent().removeClass('has-error');
            $('#Quantity-error span').hide().html('');
            $('#TransferPassword').parent().removeClass('has-error');
            $('#TransferPassword-error span').hide().html('');
        },
    }


    $('#frmCreatePin').on('submit', function(){
        transfer.errorReset();
        if (!$('#MemberUserName').existsWithValue()) {
            $('#MemberUserName').parent().addClass('has-error');
            $('#MemberUserName-error span').show().html('Please enter received account');
            return false;
        }else{
            $('#MemberUserName').parent().addClass('has-success');
        }

        if (!$('#Quantity').existsWithValue()) {
            $('#Quantity').parent().addClass('has-error');
            $('#Quantity-error span').show().html('Please enter amount');
            return false;
        }else{
            $('#Quantity').parent().addClass('has-success');
        }
        if (!$('#TransferPassword').existsWithValue()) {
            $('#TransferPassword').parent().addClass('has-error');
            $('#TransferPassword-error span').show().html('Please enter transaction password');
            return false;
        }else{
            $('#TransferPassword').parent().addClass('has-success');
        }

        $('#frmCreatePin').ajaxSubmit({
            type : 'GET',
            beforeSubmit : function(arr, $form, options) { 
                window.funLazyLoad.start();
                window.funLazyLoad.show();
            },
            success : function(result){
                result = $.parseJSON(result);
                if(result.login === 0){
                    location.reload(true);
                }else{
                    if(result.customer === -1){
                        $('#MemberUserName').parent().addClass('has-error');
                        $('#MemberUserName-error span').show().html('Received account not exit');
                        
                    }else{
                        $('#MemberUserName').parent().addClass('has-success');
                    }

                    if(result.password === -1){
                        $('#TransferPassword').parent().addClass('has-error');
                        $('#TransferPassword-error span').show().html('Wrong transaction password, please try again');
                    }else{
                        $('#TransferPassword').parent().addClass('has-success');
                    }
                    if(result.pin === -1){
                        $('#Quantity').parent().addClass('has-error');
                        $('#Quantity-error span').show().html('Wrong amount, please try again');
                    }else{
                        $('#Quantity').parent().addClass('has-success');
                    }
                    if(result.ok === -1){
                        $('.alert-edit-account').hide();
                    }else{
                        $('.alert-edit-account').show();
                        $('#MemberUserName').val('').parent().removeClass('has-success');
                        $('#Quantity').val('').parent().removeClass('has-success');
                        $('#TransferPassword').val('').parent().removeClass('has-success');
                        $('#Description').val('').parent().removeClass('has-success');
                    }

                    window.funLazyLoad.reset();
                }
            }
        })

        return false;
    });
});