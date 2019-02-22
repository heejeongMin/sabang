/**
 * 
 */

$(document).ready(function() {
		
		$('input[type=radio]').on("click", function() {
			page = $('input[type=radio]:checked').val();
			$.ajax({
				url : "SignFormServlet",
				type : "get",
				dataType : "text",
				data : {
					page : page
				},
				success : function(data, status, xhr) {
					$("#signForm").html(data);
				},
				error : function(xhr, status, e) {
					console.log("error");
				}
			})
		}) // end radio event
		
		$("body").on("keyup", "#cnfPasswd", function() {
			var passwd = $("#passwd").val();
			var mesg = null
			if (passwd != $(this).val()) {
				mesg = "비밀번호가 일치하지 않습니다.";
			}
			$("#checkPW").text(mesg);
		}); //end equal check password
		
		$("body").on("change", "#email3", function(){
			var email = $(this).val();
			  $("#email2").val(email);
		})// end select email
		
		$("body").on("submit", "#signForm", function(event){
			$(this).find("span.live").remove();
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			var cnfPw = $("#cnfPasswd").val();
			var username = $("#username").val();
			var ssn1  = $("#ssn1").val();
			var ssn2  = $("#ssn2").val();
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var phone3 = $("#phone3").val();
			var addr = $("#sample4_roadAddress").val();
			var email1 =  $("#email1").val();			
			var email2 =  $("#email2").val();			
			var email3 =  $("#email3").val();			
			var mesg = null;
			var liveDiv = "<span class = 'live'></span>";
			
			/* length  check*/
			if (userid.length == 0) {
			 	event.preventDefault();
				var idM= "아이디를 입력해주세요.";
				$("#userid").focus();
				$("#userid").after("<span class = 'live'>"+idM+"</span>");
// 				console.log($("#userid"));
				//$(".live").text(idM);
			}  
			if(passwd.length == 0) {
			 	event.preventDefault();
				var pwM = "비밀번호를 입력해주세요.";
				$("#passwd").after("<span class = 'live'>"+pwM+"</span>");
				//$(".live");
			}
			if (username.length == 0){
				event.preventDefault();
				var unM = "이름을 입력해주세요.";
				$("#username").after("<span class = 'live'>"+unM+"</span>");
			}
			
			if (phone2.length == 0 || phone3.length == 0){
				event.preventDefault();
				var phM = "핸드폰 번호를 입력해주세요.";
				$("#phone3").after("<span class = 'live'>"+phM+"</span>");
			} 
			
			if (email2.length == 0 || email3.length == 0){
				event.preventDefault();
				var emM = "이메일을 입력해주세요.";
				$("#email3").after("<span class = 'live'>"+emM+"</span>");
			} 
			
			if (passwd != cnfPw){
			 	event.preventDefault();
			 	var cpM = "비밀번호가 일치하지 않습니다.";
			 	$("#cnfPasswd").after("<span class = 'live'>"+cpM+"</span>");
			}
			
			var page = $('input[type=radio]:checked').val();
			if(page != 'agent'){
				if(ssn1.length == 0 || ssn2.length == 0){
			 	event.preventDefault();
				var snM = "주민등록번호를 입력해주세요.";
				$("#ssn2").after("<span class = 'live'>"+snM+"</span>");
				// $(".live");
			}
		 	if(addr == 0 ){
			 	event.preventDefault();
				var adM = "주소를 입력해주세요.";
				$("#sample4_roadAddress").after("<span class = 'live'>"+adM+"</span>");
				// $(".live");
			} 
		}// end if 
			$(".live").css("font-size", "9pt"); 
			
			
			/* Regular Expression */
			/*Rules*/
			var idRule = /^[^ㄱ-힣!@#$^&*()<>+?/{}.-]{4,10}$/gi;
			var passRule = /^[a-z0-9_]{4,20}$/;
			var nameRule = /^[가-힣]{2,4}$/;
			var ssn1Rule = /^[0-9]{6}$/;
			var ssn2Rule = /^[0-9]{7}$/;
			var pnumRule = /^[0-9]{3,4}$/;
			var emailRule = /^[^ㄱ-힣]{4,15}$/;
			
			if(!nameRule.test(username)) { 
				alert("이름은 2글자 이상 4글자 이하의 한글만을 허용합니다.")
			};
			
			if(!ssn1Rule.test(ssn1)) { 
				alert("주민등록번호 앞자리는 여섯자리수만을 허용합니다.");
			};
			
			if(!ssn2Rule.test(ssn2)) { 
				alert("주민등록번호 뒷자리는 일곱자리수만을 허용합니다.");
			};
			
			if(!pnumRule.test(phone2) ||!pnumRule.test(phone3)  ) { 
				alert("핸드폰번호는 세자리수 이상 네자리수 이하 숫자만을 허용합니다")
			};
			
			if(!emailRule.test(email1) ||!emailRule.test(email2)  ) { 
				alert("이메일에 한글은 입력 불가능하며 4글자 이상 15자 이하 문자만을 허용합니다.");
			};
			
			
			/*if(!nameRule.test(username)) { 
				alert("이름은 특수문자와 한글을 제외한 6~20자만 허용합니다.")
			};
			d
			if(!nameRule.test(username)) { 
				alert("이름은 특수문자와 한글을 제외한 6~20자만 허용합니다.")
			};
			if(!nameRule.test(username)) { 
				alert("이름은 특수문자와 한글을 제외한 6~20자만 허용합니다.")
			};
			if(!nameRule.test(username)) { 
				alert("이름은 특수문자와 한글을 제외한 6~20자만 허용합니다.")
			};
			if(!nameRule.test(username)) { 
				alert("이름은 특수문자와 한글을 제외한 6~20자만 허용합니다.")
			};
			*/
	//		var regId = /^[^ㄱ-힣!@#$^&*()<>+?/{}.-]/gi;
	//		var regExp =   /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/; /*정규식 찾아보기*/
			/*var pattern = /[=ㄱ-힣!@#$^&*()<>+?/{}.-]/gi;*/
			/* alert('한글과 특수문자는 입력할 수 없습니다.'); */
		}); //end check null and multipled ID and regular expression ==> submit event
		
	
		
		
		$("body").on("keyup", "input[type]", function(e) {
		//		var trim = /(\s*)/g;
				$(this).val($(this).val().replace(/(\s*)/g, ""));
		//		if($(this).val().test(trim)) { 
		//			alert("공백문자는 입력할 수 없습니다.");
		//	}; // end space character expression ==> keyup event
		});
});
//이메일 선택 */
/* 
 $("#email2").on("change",function(){
 var email = $(this).val();
 if (email == 'direct'){

 }

 $("#email2").val(email);
 }); */

/* 	$("#userid").on("keyup", function(event) {
	$.ajax({
		type : "GET",
		url : "MemberIdCheckServlet",
		dataType : "text",
		data : {
			userid : $("#userid").val()
		},
		success : function(responseData, status, xhr) {
			$("#result").text(responseData);
		},
		error : function(xhr, status, error) {
			console.log("error");
		}
	});
}); */