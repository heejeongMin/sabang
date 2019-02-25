<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/top.jsp" flush="true"/> 
<jsp:include page="common/menu.jsp" flush="true"/>
<hr>
<div id="mainWrap">
	<jsp:include page="house/houseList.jsp" flush="true"/>
	<div id="houseMapWrap">
		<jsp:include page="house/houseMap.jsp" flush="true"/>
	</div>
</div>
</body>
</html>