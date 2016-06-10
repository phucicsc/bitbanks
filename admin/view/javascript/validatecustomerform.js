 $(document).ready(function() {
    // validate signup form on keyup and submit
    var validator = $("#form-customer").validate({
      rules: {
        password: {
          required: false,
          minlength: 2
        },
        password_again: {
          required: false,
          minlength: 2,
          equalTo: "#password"
        },
        transactionpassword: {
          required: false,
          minlength: 2
        },
        transactionpassword_again: {
          required: false,
          minlength: 2,
          equalTo: "#transactionpassword"
        },
      },
      messages: {
        password: {
          required: "Provide a password",
          minlength: jQuery.validator.format("Enter at least {0} characters")
        },
        password_again: {
          required: "Repeat your password",
          minlength: jQuery.validator.format("Enter at least {0} characters"),
          equalTo: "Enter the same password as above"
        },
        transactionpassword: {
          required: "Provide a password",
          minlength: jQuery.validator.format("Enter at least {0} characters")
        },
        transactionpassword_again: {
          required: "Repeat your password",
          minlength: jQuery.validator.format("Enter at least {0} characters"),
          equalTo: "Enter the same password as above"
        },
      },
      submitHandler: function(form) {
                    form.submit();
              },
      highlight: function(element) {
            $(element).closest('.validate').addClass('has-error');
      },
      unhighlight: function(element) {
            $(element).closest('.validate').removeClass('has-error');
            form.submit();
        },
         errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        }
    });
});
