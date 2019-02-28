<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sabang.css">
<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
	<c:remove var="mesg" />
</c:if>
</head>
<body id="wrap">
<div id="wrap">
	<div id="header">
		<div id="inner_header">
			<jsp:include page="common/top.jsp" flush="true"/>
			
		</div>
	</div>
	<div id="section_main">
		<div id="article_main">
			<a href="HouseListServlet">houseOverview</a>
		</div>
	</div>
</div>
</body>
</html>
