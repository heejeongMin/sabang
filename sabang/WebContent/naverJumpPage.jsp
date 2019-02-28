<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
div#NavertoSabang{
	position:fixed; top:0px; left:0px; width:100%; height:100%; min-width:1400px; min-height:780px;
	background: url('https://wallpapercave.com/wp/tmx6W6N.png') no-repeat center center; background-size:cover;
}
button#enterSabang{
	border: 0;
	background: none;
	color: white;
	font-size: 30px; 
	font-weight: bold;
	margin: 20px;
    cursor: pointer;
    box-shadow: 3px 3px 5px 5px mediumpurple;
    padding: 5px;
}
img#enterSabangIMG{
    display: inline-block;
    width: 250px;
    height: 260px;
    margin: 50px 30px 30px 30px;
}
div#JumpImageWrap, div#JumpTextWrap{
	width:100vw;
	text-align:center;
}
</style>
<div id="NavertoSabang">
	<div id="JumpImageWrap"> 
		<img src="images/logo/sabanglogo_w.png" width="300px" height = "300px" id="enterSabangIMG">
	</div>
	<div id="JumpTextWrap">
		<button id="enterSabang">사방으로 입장</button>
	</div>
</div>

<!-- 아래는 없으면 네이버 스크립트에서 오류가 나서 내비둠.   -->
<div class="container" style="display: none;">
	<div class="jumbotron">
		<p>
		<div id="naverIdLogin">
			<a id="naverIdLogin_loginButton" href="#" role="button"
				style="display: none;"> </a>
		</div>
		</p>
	</div>
</div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "QN3lv2J2hB8uD9Nm2s90",
				callbackUrl: "http://localhost:8090/sabang/main.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
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

// 		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			var email = naverLogin.user.getEmail();//email
			var name = naverLogin.user.getName(); // name
			var uniqId = naverLogin.user.getId(); //43415424 -> id 
			
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
		
		$(document).ready(function(){
			$("button#enterSabang").on("click", function(e){
				setLoginStatus();
				opener.location.href="main.jsp";
				window.close();
			});
		});
</script>
