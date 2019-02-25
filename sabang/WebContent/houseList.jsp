<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 div#houseListWrap {
 	border: 1px solid blue;
    width: 880px;
    position: realtive;
    position: absolute;
 }
 div#houseMapWrap{
    border: 1px solid red;
    width: 720px;
    height: 780px;
    float: left;
    position: relative;
    left: 880px
 }
</style>
</head>
<body>
<jsp:include page="common/top.jsp" flush="true"/> 
<jsp:include page="common/menu.jsp" flush="true"/>
<hr>
<div id="houseListWrap">
	<jsp:include page="house/houseList.jsp" flush="true"/>
</div>
<div id="houseMapWrap">
	<jsp:include page="house/houseMap.jsp" flush="true"/>
<div>
</body>
</html>