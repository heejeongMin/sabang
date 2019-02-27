$(document).ready(function(){
	$(".row").on("click", function(e){
		window.open("board/houseDetailBoard.jsp?pcode="+$(e.target).attr('data-pcode'),"", 
				"scrollbars=no,toolbar=no,menubar=no,location=no,resizable=no,"+
				"left = 500px, top= 200px, width=500, height=200"
		);
	})
	
	$(".row").mouseover(function(){
		$(this).css({'background-color': 'tomato'})
	})
	$(".row").mouseleave(function(){
		$(this).css({'background-color': 'white'})
	})
	
	
/*	$(".row").mouseover(function(){
		$(this).css('font-weight', 'bold')
	})
	$(".row").mouseleave(function(){
		$(this).css('font-weight', 'regular')
	})
*/	
	
});//end ready

