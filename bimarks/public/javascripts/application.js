// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//Validation for USER Registration
$(document).ready(function () {
$("#new_user").validate({
debug: false,
rules: {
"user[username]": {required: true, rangelength: [4, 16]},
"user[email]": {required: true, email: true},
"user[password]": {required: true, rangelength: [4, 16]},
"user[password_confirmation]": {required: true, equalTo: "#user_password"}
}
});
});



$(document).ready(function () {
$("#edit_user_").validate({
debug: false,
rules: {
"user[username]": {required: true, rangelength: [4, 16]},
"user[email]": {required: true, email: true},
"user[password]": {required: true, rangelength: [4, 16]},
"user[password_confirmation]": {required: true, equalTo: "#user_password"}
}
});
});





//Submit Valid Values
$("#myform").validate({
 submitHandler: function(form) {
   form.submit();
 }
});


jQuery.validator.addMethod("accept", function(value, element, param) {
  return value.match(new RegExp("." + param + "$"));
});

