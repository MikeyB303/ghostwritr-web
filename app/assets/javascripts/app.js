$(document).on('turbolinks:load', function () {
  $(".button-collapse").sideNav();
  $('select').material_select();
  var apiDestination;

  $('#libraries').change(function () {
    $('#predicted_text').empty();
    apiDestination = $(this).find(':selected').data('author');
    $('#user-text').prop('disabled', false);
  });

  $('#post-form').on('keydown', '#user-text', function (event) {
    if(event.which === 32){
      var userText = $(this).serialize();
      var response = $.ajax({
        url: apiDestination,
        data: userText
      });

      response.done(function (predictions) {
        console.log(predictions);
        renderWords(predictions);
      });
    }
  });


  function renderWords(wordsArray) {
    var $predictionField = $('#predicted_text');
    $predictionField.empty();
    for(var i = 0; i < wordsArray.length; i++){
      $predictionField.append('<li>' + wordsArray[i] + '</li>')
    }
  }


});