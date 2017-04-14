$(document).on('turbolinks:load', function(){

	$('#add-comment').on('click', function(event){
		event.preventDefault();
		$('#ajax-comment-form-container').removeClass('hide');
		$(this).closest('.card-action').addClass('hide');
	});

	$('#ajax-comment-form').on('submit',function(event){
		event.preventDefault();
		var $target = $(this);
		var url = $target.attr('action');
		var method = $target.attr('method');
		var data = $target.serialize();

		$.ajax({
			url: url,
			method: method,
			data: data
		});
	})
})