<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<style>

body {
background-image: url('https://wallpapercave.com/wp/tmx6W6N.png');
}
h3 {
color : white;
}
a:link {
  text-decoration: none;
}
</style>
    
<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    
    
</script>  
<h3> 탈퇴되었습니다. 회원님의 정보는 모두 폐기되며, 24시간 이내에 재가입 할 수 없습니다. <h3>
