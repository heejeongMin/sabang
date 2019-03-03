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
	</div>
</div>
<div id="menu">
	<div id="inner_menu">
		<jsp:include page="common/search.jsp" flush="true"/>
		<jsp:include page="common/filter.jsp" flush="true"/>
	</div>
</div>


<hr>
<div id="mainWrap">
	<jsp:include page="house/houseOverview.jsp" flush="true"/>
</div>
	<div id="houseMapWrap">
		<jsp:include page="house/houseMap.jsp" flush="true"/>
	</div>
</body>
</html>