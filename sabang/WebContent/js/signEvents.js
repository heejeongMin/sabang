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
			/* space check */
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
			/* Regular Expression */
			var idRule = /^[^ㄱ-힣!@#$^&*()<>+?/{}.-]{4,10}$/gi;
			var passRule = /^[a-z0-9_]{4,20}$/;
			var nameRule = /^[가-힣]{2,4}$/;
			var ssn1Rule = /^[0-9]{6}$/;
			var ssn2Rule = /^[0-9]{7}$/;
			var pnumRule = /^[0-9]{3,4}$/;
			var emailRule = /^[^ㄱ-힣]{4,15}$/;
			
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
			
			if (email2.length == 0){
				event.preventDefault();
				var emM = "이메일을 입력해주세요.";
				$("#email3").after("<span class = 'live'>"+emM+"</span>");
			} 
			
			if (passwd != cnfPw){
			 	event.preventDefault();
			 	var cpM = "비밀번호가 일치하지 않습니다.";
			 	$("#cnfPasswd").after("<span class = 'live'>"+cpM+"</span>");
			}
			
			if(ssn1.length == 0 || ssn2.length == 0){
				event.preventDefault();
				var snM = "주민등록번호를 입력해주세요.";
				$("#ssn2").after("<span class = 'live'>"+snM+"</span>");
			}
			
			var page = $('input[type=radio]:checked').val();
				if(page != 'agent'){
					if(addr == 0 ){
						event.preventDefault();
						var adM = "주소를 입력해주세요.";
						$("#sample4_roadAddress").after("<span class = 'live'>"+adM+"</span>");
					} 
				}// end if not agent 
			$(".live").css("font-size", "9pt"); 
			
			if(!nameRule.test(username)) {
				event.preventDefault();
				alert("이름은 2글자 이상 4글자 이하의 한글만을 허용합니다.");
			}else if(!idRule.test(userid)) { 
				event.preventDefault();
				alert("주민등록번호 앞자리는 여섯자리수만을 허용합니다.");
			}else if(!passRule.test(password)) { 
				event.preventDefault();
				alert("주민등록번호 앞자리는 여섯자리수만을 허용합니다.");
			}else if(!ssn1Rule.test(ssn1)) { 
				event.preventDefault();
				alert("주민등록번호 앞자리는 여섯자리수만을 허용합니다.");
			}else if(!ssn2Rule.test(ssn2)) { 
				event.preventDefault();
				alert("주민등록번호 뒷자리는 일곱자리수만을 허용합니다.");
			}else if(!pnumRule.test(phone2) ||!pnumRule.test(phone3)  ) { 
				event.preventDefault();
				alert("핸드폰번호는 세자리수 이상 네자리수 이하 숫자만을 허용합니다")
			}else if(!emailRule.test(email1) ||!emailRule.test(email2)  ) { 
				event.preventDefault();
				alert("이메일에 한글은 입력 불가능하며 4글자 이상 15자 이하 문자만을 허용합니다.");
			};
		}); //end check null and multipled ID and regular expression ==> submit event
		
		
		$("body").on("keyup", "input[type]", function(e) {
				$(this).val($(this).val().replace(/(\s*)/g, ""));
		});
});
