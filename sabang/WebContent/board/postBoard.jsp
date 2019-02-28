<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	 $("input[type=password]").on("keyup", function(){
		var pwRule = /^[0-9]{5}$/gi;
		$(this).val($(this).val().replace(pwRule,""));
		/* if ($(this).val().length == 5){
			alert("게시물 비밀번호는 4자리수 입니다.")
		} */
	 })
 })
	
</script>


<style>
th {
	text-align: left;
}

#title {
font-size: 17px; font-weight: bold
}

::-webkit-input-placeholder {
  color: gray;
}

</style>

<form method = "post" action = "EditBoardServlet">
<input type = "text" name = "title" id = "title" placeholder = "글 제목"> 
<hr> 
<textarea name ="content" id ="content" cols="40" rows="8" placeholder="최대 2000자"></textarea><br>
<input type = "password" name = "confirmPw" placeholder = "게시물 비밀번호">
<input type ="submit" value = "수정">
</form>
