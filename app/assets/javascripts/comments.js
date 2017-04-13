$(document).on('turbolinks:load', function(){

	$('#add-comment').on('click', function(event){
		event.preventDefault();
		console.log("hit")
	})
})