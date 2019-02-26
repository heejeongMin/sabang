$(document).ready(function(){
	$(".row").on("click", function(e){
		window.open("house/houseDetailBoard.jsp", "mywindow","location=no, scrollbars=no, left = 400px, top = 300px, directories=no, menubar = no, width=500,height=270");
//		window.open("house/houseDetailBoard.jsp", "location=no", " resizable=no","scrollbars=no"  );
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

