<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="sabangTest.css"> -->
 <style>

body {
background-image: url('https://wallpapercave.com/wp/tmx6W6N.png');
}
h1,a {
color : white;
}
a:link {
  text-decoration: none;
}
</style>  
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

<jsp:include page="common/top.jsp" flush="true" /><br>
<a href="HouseListServlet">houseOverview</a>
</body>
</html>



