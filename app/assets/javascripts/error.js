$( document ).ajaxError(function() {
  $("#comment_form").prepend("<p>ERROR</p>");
});
