<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/myPage.css">
</head>
<body>
<div id="header">
	<div id="inner_header">
		<jsp:include page="common/top.jsp" flush="true"/><br>
	</div>
</div>
<div id="section_mypage_menu">
	<div id="inner_menu">
		<jsp:include page="common/myPageMenu.jsp" flush="true"/>
	</div>
</div>
<div id="section_mypage_wrap">
	<div id="article_interestList">
		<jsp:include page="house/interestList.jsp" flush="true"/>
	</div>
</div>
</body>
</html>