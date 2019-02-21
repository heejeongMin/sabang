<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" href="css/sabangTest.css">

<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").on("submit", function(event) {
			var passwd = $("#passwd").val();
			if (passwd.length == 0) {
				alert("passwd 필수")
				$("#passwd").focus();
				event.preventDefault();
			}
		});
	});
</script>  
<p style =  "line-height: 140%"> 안전한 탈퇴를 위해, 비밀번호를 확인해주세요.<br>
비밀번호 확인 후 즉시 탈퇴됩니다. 탈퇴 후 아이디와 데이터는 복구 할 수 없으니 신중하게 고려한 후 선택해 주세요. </p>
<form action="DelMbrIdServlet" method="get">
비밀번호:<input type="password" name="passwd" id="passwd"><br> 
<input type="submit" value="탈퇴">
<input type="reset" value="취소">
</form>
