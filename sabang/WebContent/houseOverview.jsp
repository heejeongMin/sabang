<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 div#houseMapWrap{
    border: 1px solid red;
    width: 720px;
    height: 780px;
    float: left;
    position: absolute;
    left: 880px;
    top: 150px;
 }
</style>
</head>
<body>
<jsp:include page="common/top.jsp" flush="true"/>
<jsp:include page="common/menu.jsp" flush="true"/>
<hr>
<div id="mainWrap">
		<jsp:include page="house/houseOverview.jsp" flush="true"/>
	<div id="houseMapWrap">
		<jsp:include page="house/houseMap.jsp" flush="true"/>
	</div>
</div>
</body>
</html>