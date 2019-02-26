<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form#panel{
    float: left;
    width: 330px;
    height: 80%;
    box-shadow: 5px 2px 0px 4px lightblue;
    padding: 10px 5px 5px 10px;
        height: 600px;
        position: absolute;
}
form#panel table{    box-shadow: -2px 6px 1px 7px aliceblue; padding: 3px;}
form#panel th {color : darkblue; font-weight: bold; height: 30px;}
form#panel tr:nth-child(odd) {background-color: aliceblue;}
form#panel tr>td {text-align: center;}
div#btnBox{text-align: center;     float: left;
    position: absolute;
    bottom: 0;}
div#btnBox>button {
    margin: 10px 4px 10px 4px;
    border: 0;
    border-radius: 10px;
    padding: 8px 20px 8px 20px;
    background-color: darkblue;
    color: white;
    font-weight: bold;
    cursor: pointer;
    box-shadow:1px 2px 5px 1px cadetblue;
}
</style>
</head>
<body>
<form action="#" method="get" id="panel">
<table id="panel">
	<tr>
		<th></th>
		<th>코드</th>
		<th>주소</th>
		<th>보증금/전세가</th>
		<th>월세</th>
	</tr>
	<c:forEach var="house" items="${houseByAgent}">
		<tr>
			<td><input type="checkbox" name="check" value="${house.HCODE}"></td>
			<td>${house.HCODE}</td>
			<c:set var="addr" value="${fn:split(house.ADDR, ' ')}"/>
			<td>${addr[2]}</td>
			<td>${house.DEPOSIT}</td>
			<td>${house.MRENT}</td>
		</tr>
	</c:forEach>
</table>
<div id="btnBox">
	<button id="delBtn">매물 삭제</button>
	<button id="registerBtn">매물 등록</button>
	<button id="updateBtn">매물 수정</button>
</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#registerBtn").on("click", function(e){//등록버튼 클릭시
		e.preventDefault();
		location.href="HouseUIControleServlet?work=register";
	});
	
	$("#delBtn").on("click", function(e){//삭제버튼 클릭시
		var count = 0;
		$("input[name=check]").each(function(idx, ele){//아무것도 체크하지 않으면 alert
			if(ele.checked) count++;
		});
		if (count == 0 ){
			e.preventDefault();
			alert ("삭제할 매물을 선택해주세요");
		} else {
			$("form#panel").attr("action", "HouseDelServlet");
		}
	});
	
	$("#updateBtn").on("click", function(e){//수정 버튼 클릭시
		e.preventDefault();
		var count = 0;
		var item = "";
		$("input[name=check]").each(function(idx, ele){//아무것도 체크하지 않으면 alert
			if(ele.checked) {
				count++;
				item = $(ele).val();
				console.log($(ele).val());
			}
		});
		
		if (count == 0 ){
			alert ("수정할 매물을 선택해주세요");
		} else if ( count > 1) {
			alert ("한번에 하나의 매물만 수정이 가능합니다. 매물 한개만 체크하고 수정버튼을 눌러주세요.");
		} else {
			location.href="HouseUIControleServlet?hcode="+item;
		}
	});
	
});//end ready
</script>
</body>
</html>

