$(document).ready(function () {
  var probabilityChain;

  $.ajax({
    url: '/shakespeare',
    method: 'get',
    async: false
  }).done(function (response) {
    probabilityChain = response;
  });

  $('app-container').replaceWith('<h1>GhostWritr</h1>' +
      '<br>' + "<textarea id='user_text'/>" + "<br>" + "<ul id='predicted-text'></ul>"
  );

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
      if (probability >= 0.025){
        probableWords.push({word: word, probability: probability});
      }
    });
    probableWords.sort(function (a, b) {
      return b.probability - a.probability
    });

    return probableWords
  }

  function renderWords(wordsArray) {
    var $predictionField = $('#predicted-text');
      $predictionField.empty();
    for(var i = 0; i < wordsArray.length; i++){
      $predictionField.append('<li>' + wordsArray[i].word + ' -- '
          + (wordsArray[i].probability * 100).toFixed(2) + '% </li>')
    }
  }
});