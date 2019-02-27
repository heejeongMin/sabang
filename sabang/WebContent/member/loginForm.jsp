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
	<c:remove var="mesg" />
</c:if>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/naverLogin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// id 문자열 체크 정규식 #$%^&*()-=<>+?/{}.
		$("input[type=text]").on("keyup", function(e) {
			if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
				var pattern = /[=ㄱ-힣!@#$^&*()<>+?/{}.-]/gi;
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(pattern, '')); //특수문자 alert 경고문 추가
				/* alert('한글과 특수문자는 입력할 수 없습니다.'); */
			}
		});

		$("form").on("submit", function(event) {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid.length == 0) {
				alert("아이디를 입력해 주세요.")
				$("#userid").focus();
				event.preventDefault();
			} else if (passwd.length == 0) {
				alert("비밀번호를 입력해 주세요.")
				$("#passwd").focus();
				event.preventDefault();
			}
		});

	});
</script>
<form action="LoginServlet" method="get">
	아이디:<input type="text" name="userid" id="userid"><br>
	비밀번호:<input type="password" name="passwd" id="passwd"><br>
	<input type="submit" value="로그인"> <input type="reset" value="취소">
 
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin"></div>
</form>
