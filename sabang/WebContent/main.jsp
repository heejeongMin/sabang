<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sabangTest.css">
<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
	<c:remove var="mesg" />
</c:if>
</script>
</head>

<body id="wrap">

<%-- <%
   String mesg = (String)session.getAttribute("memberAdd");
   if(mesg!=null){
%>
   <script type="text/javascript">
     alert('<%=mesg%>');
   </script>
<%
   }"WebContent/images/logo/sabanglogo_w.png"
%> --%>
<div id="wrap">
	<div id="header">
		<jsp:include page="common/top.jsp" flush="true" /><br>
		<a href="HouseListServlet">houseOverview</a> <br>
	</div>
	<div id="main">
	
	</div>
	<div id="footer">
	
	</div>
</div>
</body>
</html>