<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/geoLocation.js"></script>
<script>
$(document).ready(function(){
	
	getLocation();
// 	$("form").submit();
});//end ready
</script>
</head>

<body>
	<h1>날씨 테스트</h1>
	현재 당신의 위치는 
	오늘 강수량은 <span id="pop"></span> 이고, 낮 최고기온은 <span id="tmx"></span>도 입니다.
	
	<form action="" method="get">
		<input type="hidden" name="x" id="x">
		<input type="hidden" name="y" id="y">
		<button>test</button>
	</form>
	
</body>
</html>