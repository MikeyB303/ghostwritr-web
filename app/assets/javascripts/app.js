$(document).on('turbolinks:load', function () {
  var apiDestination;
   var $postForm =  $('#post-form');

  $('#libraries').change(function () {
    $('#predictions').empty().addClass('hide');
    apiDestination = $(this).find(':selected').data('author');
    $('#user-text').prop('disabled', false);
  });

  $postForm.on('keydown', '#user-text', function (event) {
    var $predictions = $('#predictions');
    var $active;

    if(event.which === 32){
      var userText = $(this).serialize();
      var response = $.ajax({
        url: apiDestination,
        data: userText
      });

      response.done(function (predictions) {
        renderWords(predictions);
        $predictions.find('a').first().addClass('active')
      });
    }

    else if(event.which === 40){
      event.preventDefault();
      $active = $predictions.find('.active');
      if($active.next().is('.collection-item')){
        $active.removeClass('active');
        $active = $active.next();
        $active.addClass('active')
      }else{
       $active.removeClass('active');
       $predictions.find('a').first().addClass('active')
      }
    }

    else if(event.which === 38){
      event.preventDefault();
      $active = $predictions.find('.active');
      if($active.prev().is('.collection-item')){
        $active.removeClass('active');
        $active = $active.prev();
        $active.addClass('active')
      }
      else{
        $active.removeClass('active');
        $predictions.find('a').last().addClass('active')
      }
    }

    else if(event.which === 13){
      event.preventDefault();
      var $userText = $('#user-text');
      $active = $predictions.find('.active');
      $userText.val($userText.val() + $active.text())
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