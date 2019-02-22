<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sabangTest.css">
</head>
<body>
<%
   String mesg = (String)session.getAttribute("mesg");
   if(mesg!=null){
%>
   <script type="text/javascript">
     alert('<%=mesg%>');
   </script>
<%
   }
%> 

<jsp:include page="common/top.jsp" flush="true" /><br>
<a href="HouseListServlet">houseOverview</a>
</body>
</html>



