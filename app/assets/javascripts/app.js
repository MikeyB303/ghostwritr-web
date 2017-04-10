$(document).ready(function () {
  var apiDestination;


  // $('app-container').replaceWith(
  //     "<textarea disabled='true' id='user_text'/>" +
  //     "<br>" + "<ul id='predicted_text'></ul>" +
  //     "<button class='inspirational_author' data-author='/shakespeare'>Shakespeare</button>" + "<br>" +
  //     "<button class='inspirational_author' data-author='/rowling'>J-K Rowling</button>" + "<br>" +
  //     "<button class='inspirational_author' data-author='/got'>George RR Martin</button>"
  // );

  $('#libraries').on('click', '.inspirational_author', function (event) {
    var $library = $(this);
    $('#predicted_text').empty();
    $('#user-text').val('');
    apiDestination = $library.data('author');
    $('#user-text').prop('disabled', false);
  });

  $('#post-form').on('keyup', '#user-text', function (event) {
    if(event.which === 32){
    console.log(apiDestination);
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

  // function formatPredictions(predictions) {
  //   var probableWords = [];
  //   $.each(predictions, function (word) {
  //     if (probability > 0.01){
  //       probableWords.push({word: word, probability: probability});
  //     }
  //   });
  //   probableWords.sort(function (a, b) {
  //     return b.probability - a.probability
  //   });
  //
  //   return probableWords
  // }

  function renderWords(wordsArray) {
    var $predictionField = $('#predicted_text');
    $predictionField.empty();
    for(var i = 0; i < wordsArray.length; i++){
      $predictionField.append('<li>' + wordsArray[i].next_word + ' -- '
          + (wordsArray[i].probability * 100).toFixed(2) + '% </li>')
    }
  }
});