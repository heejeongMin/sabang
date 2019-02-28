$(document).ready(function(){
	
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "QN3lv2J2hB8uD9Nm2s90",
			callbackUrl: "http://localhost:8090/sabang/naverJumpPage.jsp",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 25} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

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
			console.log(email);
			
			var result = "";
			if (uniqId != null){
				result = sabangSignUp(uniqId, name, email);
			}
			if (result != null){
				$("a#logout").click(function(e){
					e.preveDefault();
					naverLogin.logout();
					location.href = "LogoutServlet";
				});
			} 
		}//end setLoginStatus
		
		function sabangSignUp (uniqId, name, email){
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
});