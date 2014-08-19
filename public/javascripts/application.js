// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery-ujs
//= require jquery-ui
//= require autocomplete-rails
//= require jquery-ui-timepicker-addon.js
function goBack()
  {
  window.history.back()
  }

$('.submit_me').click(function() {
  $('form').submit();
  return false;
});

