<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form#panel{
    float: left;
    width: 350px;
    maring-right: 100px;
    padding-right: 50px;
}
	ul{
		list-style: none;
    	padding: 0;
    	border-top: 1px solid lightgray;
    	border-right: 1px solid lightgray;
	}
</style>
</head>
<body>
<form action="" method="get" id="panel">
<button id="delBtn">매물 삭제</button>
<button id="registerBtn">매물 등록</button>
<button id="updateBtn">매물 수정</button>
<ul>
<c:forEach var="" items="">
	<li>
		<input type="checkbox" name="check" value="">
		
	</li>
</c:forEach>
</ul>
</form>
</body>
</html>

