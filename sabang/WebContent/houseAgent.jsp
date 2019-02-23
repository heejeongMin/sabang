<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div#houseControlWrap{    width: 900px;
    position: absolute;
    left: 380px;
    height: 800px;
    text-align: center;}
p#initalMsg{font-size: 50px; font-weight: bold; color: darkblue; display: inline-block;
    margin-top: 200px;}
</style>
</head>
<body>
<jsp:include page="common/top.jsp" flush="true"/><br>
<jsp:include page="common/myPageMenu.jsp" flush="true"/>
<hr>
<jsp:include page="house/housePanel.jsp" flush="true"/>
<div id="houseControlWrap">
	<c:choose>
		<c:when test="${empty work}"><p id="initalMsg">안녕하세요 ${login.agntname}님 :)</p></c:when>
		<c:when test='${work.equals("register")}'><jsp:include page="house/houseRegister.jsp" flush="true"/></c:when>
	</c:choose>

</div>
</body>
</html>