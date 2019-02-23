<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sabangTest.css">
</head>
<body>
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
		<a href="HouseListServlet">houseOverview</a>
	</div>
	<div id="main">
	
	</div>
	<div id="footer">
	
	</div>
</div>
</body>
</html>



