$(document).ready(function(){
	$("body").find(".goDetail").on("click", function(e){
		location.href = "HouseDetailInfoServlet?hcode="+$(e.target).attr("data-hcode");
	})
});//end ready