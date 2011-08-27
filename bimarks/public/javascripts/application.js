//########################################################
//##       Remove Tag links                   	        ##
//########################################################

function remove_field(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}



//########################################################
//##       Validation for USER Registration	        ##
//########################################################


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



//########################################################
//##       Validation for EDIT_USER 		        ##
//########################################################

$(document).ready(function () {
$('.edit_user').validate({
debug: false,
rules: {
"user[username]": {required: true, rangelength: [4, 16]},
"user[email]": {required: true, email: true},
"user[password]": {required: true, rangelength: [4, 16]},
"user[password_confirmation]": {required: true, equalTo: "#user_password"}
}
});
});



//########################################################
//##       Validation for NEW Bookmark		        ##
//########################################################


$(document).ready(function () {
$("#new_bookmark" ).validate({
debug: false,
rules: {
"bookmark[title]": {required: true, rangelength: [3, 50]},
"bookmark[url]": {required: true, complete_url: true},
"bookmark[q_review]": {maxlength: 140},
},
messages: {
        "bookmark[url]": {
            complete_url: "Enter a valid URL"}

}
});
});


//########################################################
//##       Validation for EDIT Bookmark		        ##
//########################################################


$(document).ready(function () {
$('.edit_bookmark').validate({
debug: false,
rules: {
"bookmark[title]": {required: true, rangelength: [3, 50]},
"bookmark[url]": {required: true, complete_url: true},
"bookmark[q_review]": {maxlength: 140},
},
messages: {
        "bookmark[url]": {
            complete_url: "Enter a valid URL"}

}
});
});

//########################################################
//##       Submit Valid Values			        ##
//########################################################


$("#myform").validate({
 submitHandler: function(form) {
   form.submit();
 }
});

//########################################################
//##       Method How to handdle URL at Bookmarks       ##
//########################################################

jQuery.validator.addMethod("complete_url", function(val, elem) {
    // if no url, don't do anything
    if (val.length == 0) { return true; }
 
    // if user has not entered http:// https:// or ftp:// assume they mean http://
if(!/^(https?|ftp):\/\//i.test(val)) {

val = 'http://'+val; // set both the value
$(elem).val(val); // also update the form element
}
else
{
val = val.replace(/(http\:\/\/)+/,'http://');
$(elem).val(val); // also update the form element
}
    // now check if valid url
    // http://docs.jquery.com/Plugins/Validation/Methods/url
    // contributed by Scott Gonzalez: http://projects.scottsplayground.com/iri/
    return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&amp;'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&amp;'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&amp;'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&amp;'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&amp;'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(val);
});



//########################################################
//##       Ajax Fuction for bookmarks                   ##
//########################################################
    
    $(function () {  
      // Sorting and pagination links.  
      $('#bookmarks th a, #bookmarks .pagination a').live('click',   
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
        
      // Search form.  
      $('#bookmarks_search input').keyup(function () {  
      $.get($('#bookmarks_search').attr('action'), 
      $('#bookmarks_search').serialize(), null, 'script');  
      return false;  
    });   
    });   

