<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<jsp:include page="common/top.jsp" flush="true"/>
		<jsp:include page="common/myPageMenu.jsp" flush="true"/>
	</div>
</div>
<jsp:include page="member/mypage.jsp" flush="true"/>
</body>
</html>