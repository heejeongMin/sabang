<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sabang.css">
</head>
<body>
<div id="header">
	<div id="inner_header">
		<jsp:include page="common/top.jsp" flush="true" /><br>
	</div>
</div>
<div id="section_wrap">
	<div id="article_loginForm">
		<h1>로그인</h1>
		<jsp:include page="member/loginForm.jsp" flush="true" />
	</div>
</div>
</body>
</html>