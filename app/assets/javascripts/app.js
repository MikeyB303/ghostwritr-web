$(document).on('turbolinks:load', function () {
  var apiDestination;
   var $postForm =  $('#post-form');

  $('#libraries').change(function () {
    $('#predictions').empty();
    apiDestination = $(this).find(':selected').data('author');
    $('#user-text').prop('disabled', false);
  });

  $postForm.on('keydown', '#user-text', function (event) {
    if(event.which === 32){
      var userText = $(this).serialize();
      var response = $.ajax({
        url: apiDestination,
        data: userText
      });

      response.done(function (predictions) {
        renderWords(predictions);
      });
    }
  });

  $postForm.on('keydown', '#user-text', function (event) {
    var $predictions = $('#predictions');
    var $active;
    if(event.which === 40){
      if($predictions.find('a').hasClass('active')){
        $active = $('#predictions .active');
      }
    }
  });


  function renderWords(wordsArray) {
    var $predictionField = $('#predictions');
    $predictionField.empty();
    $predictionField.removeClass('hide');
    for(var i = 0; i < wordsArray.length; i++){
      $predictionField.append("<a href='' class='collection-item'>" + wordsArray[i] + "</a>")
    }
  }


});