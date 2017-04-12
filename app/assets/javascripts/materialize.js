$(document).on('turbolinks:load', function () {
  $('#libraries').material_select();
  $(".button-collapse").sideNav();
  $('.tooltipped').tooltip({delay: 10});
});