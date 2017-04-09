$(document).ready(function () {
  var probabilityChain;


  $('app-container').replaceWith('<h1>GhostWriter</h1>' +
      "<br>" + "<textarea id='user_text'/>" + "<br>" + "<ul id='predicted_text'></ul>" +
      "<a href='/shakespeare'>Shakespeare</a>" + "<br>" + "<a href='/rowling'>J-K Rowling</a>"
  );

  $('body').on('click', 'a', function (event) {
    var $library = $(this);
    $('#predicted_text').empty();
    $('#user_text').val('');
    event.preventDefault();
    $.ajax({
      url: $library.attr('href'),
      method: 'get'
    }).done(function (response) {
      probabilityChain = response;
    });

  });

  $('body').on('keyup', '#user_text', function (event) {
    if(event.which === 32){
      var userText = lastWord($(this).val());
      var possibleWords = probabilityChain[userText];
      var filteredProbabilities = formatPredictions(possibleWords);
      renderWords(filteredProbabilities);
    }
  });

  function lastWord(input) {
    var inputArray = input.split(' ');
    return inputArray[inputArray.length - 2].toLowerCase()
  }

  function formatPredictions(predictions) {
    var probableWords = [];
    $.each(predictions, function (word, probability) {
      if (probability > 0.003){
        probableWords.push({word: word, probability: probability});
      }
    });
    probableWords.sort(function (a, b) {
      return b.probability - a.probability
    });

    return probableWords
  }

  function renderWords(wordsArray) {
    var $predictionField = $('#predicted_text');
    $predictionField.empty();
    for(var i = 0; i < wordsArray.length; i++){
      $predictionField.append('<li>' + wordsArray[i].word + ' -- '
          + (wordsArray[i].probability * 100).toFixed(2) + '% </li>')
    }
  }
});