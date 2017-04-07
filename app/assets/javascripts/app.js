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
      var fileteredProbabilities = formatPredictions(possibleWords);
      renderWords(fileteredProbabilities);
    }
  });

  function lastWord(input) {
    var inputArray = input.split(' ');
    return inputArray[inputArray.length - 2]
  }

  function formatPredictions(predictions) {
    var probableWords = [];
    $.each(predictions, function (word, probability) {
      if (probability >= .025){
        probableWords.push(word);
      }
    });
    return probableWords;
  }

  function renderWords(wordsArray) {
      $('#predicted-text').empty();
    for(var i = 0; i < wordsArray.length; i++){
      $('#predicted-text').append('<li>' + wordsArray[i] + '</li>')
    }
  }
});