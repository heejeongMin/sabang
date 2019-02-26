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
</head>
<body id="wrap">
<div id="wrap">
	<div id="header">
		<jsp:include page="common/top.jsp" flush="true" /><br>
		<a href="HouseListServlet">houseOverview</a> <br>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "QN3lv2J2hB8uD9Nm2s90",
				callbackUrl: "http://localhost:8090/sabang/main.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			var email = naverLogin.user.getEmail();//email
			var name = naverLogin.user.getName(); // name
			var uniqId = naverLogin.user.getId(); //43415424 -> id 
			
			var result = sabangSignUp(uniqId, name, email); 
			
			if (result != null){
				location.href="main.jsp"
			} 
		}//end setLoginStatus
		
		function sabangSignUp (uniqId, name, email){//ajax로 회원 정보 있는지 확인하고 없으면 생성하고 memberDTO에 담는다.
			console.log(uniqId, name, email);
			var result = ""; 
			$.ajax({
				type:'post',
				url:'NaverSignin',
				data:{
					uniqId : uniqId,
					name : name,
					email : email
				},
				dataType: 'text',
				success:function(data, status, xhr){
					result = data;
				},
				error:function(xhr, status, error){console.log(status);}
			});//end ajax
			return result;
		}//end sabangSignUp
		
		$("a#logout").click(function(e){
			e.preveDefault();
			naverLogin.logout();
			location.href = "LogoutServlet";
		});
</script>