$(document).ready(function(){
	$("body").find(".goDetail").on("click", function(e){
		console.log($(e.target));
		console.log($(e.target).attr("data-hcode"));
	})
});//end ready