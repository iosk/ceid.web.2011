//########################################################
//##       Remove Tag links                   	        ##
//########################################################


/*
  Goes where link specifies it to. Then grabs previous item
  that is a hidden input and sets its value to 1. In our case
  It will just call destroy.
  Finally it hides the field that was destroyed.
*/
function remove_field(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}
         
           
//########################################################
//##       Add Tag links                   	            ##
//########################################################


/*
  This function creates a unique id via new Date
  And then replaces the id created by "link_to_add_field_name with this unique id.
*/
function add_field(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
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
      $(' #my_bookmarks th a,  #bookmarks th a, #bookmarks .pagination a, #my_bookmarks .pagination a, #flagged_bookmarks th a, #flagged_bookmarks .pagination a, #flagged_comments .pagination a, #flagged_tags .pagination a').live('click',   
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
    
    
//#########################################################
//##       Ajax Fuction for Comments                     ##
//#########################################################   
        
    $(function () {  
      $(' #comments ul a, #ajax_links a').live('click',   
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
           
    });  
    
    

//#########################################################
//##       Ajax Remove_tr                                ##
//#########################################################   

        $(function () {  
      $(' #comments ul a, #remove_tr a').live('click',   
        function (event) {  
          $(this).parent().parent().fadeOut('slow', function() {$(this).remove();});;  
          return false;  
        }  
      );  
         
    });  
    
 
    
    
//########################################################
//##       Tabs at home page                            ##
//########################################################

//Set tab to intially be selected when page loads:
//[which tab (1=first tab), ID of tab content to display]:
var initialtab=[1, "sc1"]

////////Stop editting////////////////

function cascadedstyle(el, cssproperty, csspropertyNS){
if (el.currentStyle)
return el.currentStyle[cssproperty]
else if (window.getComputedStyle){
var elstyle=window.getComputedStyle(el, "")
return elstyle.getPropertyValue(csspropertyNS)
}
}

var previoustab=""

function expandcontent(cid, aobject){
if (document.getElementById){
highlighttab(aobject)
detectSourceindex(aobject)
if (previoustab!="")
document.getElementById(previoustab).style.display="none"
document.getElementById(cid).style.display="block"
previoustab=cid
if (aobject.blur)
aobject.blur()
return false
}
else
return true
}

function highlighttab(aobject){
if (typeof tabobjlinks=="undefined")
collecttablinks()
for (i=0; i<tabobjlinks.length; i++)
tabobjlinks[i].style.backgroundColor=initTabcolor
var themecolor=aobject.getAttribute("theme")? aobject.getAttribute("theme") : initTabpostcolor
aobject.style.backgroundColor=document.getElementById("tabcontentcontainer").style.backgroundColor=themecolor
}

function collecttablinks(){
var tabobj=document.getElementById("tablist")
tabobjlinks=tabobj.getElementsByTagName("A")
}

function detectSourceindex(aobject){
for (i=0; i<tabobjlinks.length; i++){
if (aobject==tabobjlinks[i]){
tabsourceindex=i //source index of tab bar relative to other tabs
break
}
}
}

function do_onload(){
var cookiename=(typeof persisttype!="undefined" && persisttype=="sitewide")? "tabcontent" : window.location.pathname
var cookiecheck=window.get_cookie && get_cookie(cookiename).indexOf("|")!=-1
collecttablinks()
initTabcolor=cascadedstyle(tabobjlinks[1], "backgroundColor", "background-color")
initTabpostcolor=cascadedstyle(tabobjlinks[0], "backgroundColor", "background-color")
if (typeof enablepersistence!="undefined" && enablepersistence && cookiecheck){
var cookieparse=get_cookie(cookiename).split("|")
var whichtab=cookieparse[0]
var tabcontentid=cookieparse[1]
expandcontent(tabcontentid, tabobjlinks[whichtab])
}
else
expandcontent(initialtab[1], tabobjlinks[initialtab[0]-1])
}

if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload





//Dynamicdrive.com persistence feature add-on

var enablepersistence=true //true to enable persistence, false to turn off (or simply remove this entire script block).
var persisttype="local" //enter "sitewide" for Tab content order to persist across site, "local" for this page only

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function savetabstate(){
  var cookiename=(persisttype=="sitewide")? "tabcontent" : window.location.pathname
  var cookievalue=(persisttype=="sitewide")? tabsourceindex+"|"+previoustab+";path=/" :     tabsourceindex+"|"+previoustab
  document.cookie=cookiename+"="+cookievalue
}

window.onunload=savetabstate


