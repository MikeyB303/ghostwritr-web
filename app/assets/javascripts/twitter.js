$(document).on('turbolinks:load', function(){

	  $('#tweet-container').click(function(event) {
    		event.preventDefault();
    		var $target = $(this);

    		var href = $target.find('a').attr('href');
    		window.open(href,"Twitter", "height=385,width=550,resizable=1");
  		});

})