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
		//	var page = $('input[type=radio]:checked').val();
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
			var idM= "아이디를 입력해주세요.";
			var pwM = "비밀번호를 입력해주세요.";
			var unM = "이름을 입력해주세요.";
			var phM = "핸드폰 번호를 입력해주세요.";
			var emM = "이메일을 입력해주세요.";
			var cpM = "비밀번호가 일치하지 않습니다.";
			var snM = "주민등록번호를 입력해주세요.";
			var adM = "주소를 입력해주세요.";
			var unRM = "이름은 2자 이상 4자 이하의 한글만을 허용합니다.";
			var idRM = "아이디는 2자 이상 10자 이하의 한글과 특수문자를 제외한 문자를 허용합니다.";
			var pwRM = "비밀번호는 6자리수만을 허용합니다.";
			var snRM =  "주민등록번호 앞자리는 6자리수만을 허용합니다.";
			var snRM2 = "주민등록번호 뒷자리는 7자리수만을 허용합니다.";
			var pnRM = "핸드폰번호는 3자리수 이상 자리수 이하 숫자만을 허용합니다"
			var emRM = "이메일은 4자 이상 15자 이하 한글을 제외한 문자만을 허용합니다.";
			
			if (email2.length == 0 || (!emailRule.test(email1) ||!emailRule.test(email2)) ){
				event.preventDefault();
				if (email2.length == 0){
					$("#email3").after("<span class = 'live'>"+emM+"</span>");
				}else if(!emailRule.test(email1) ||!emailRule.test(email2)  ) { 
					$("#email3").after("<span class = 'live'>"+emRM+"</span>");
				}
			};
			
			if ( (phone2.length == 0 || phone3.length == 0)|| (!pnumRule.test(phone2) ||!pnumRule.test(phone3)) ){
				event.preventDefault();
				if (phone2.length == 0 || phone3.length == 0){
					$("#phone3").after("<span class = 'live'>"+phM+"</span>");
				}else if(!pnumRule.test(phone2) ||!pnumRule.test(phone3)) { 
					$("#phone3").after("<span class = 'live'>"+pwRM+"</span>");
				}
			} 
			
/*			if(page != 'N'){
				if(addr == 0 ){
					event.preventDefault();
					$("#sample4_roadAddress").after("<span class = 'live'>"+adM+"</span>");
				} 
			}// end if not agent
*/			
			if( ssn1.length == 0 || ssn2.length == 0 || !ssn1Rule.test(ssn1) || !ssn2Rule.test(ssn2) ){
				event.preventDefault();
				if(ssn1.length == 0 || ssn2.length == 0){
					$("#ssn2").after("<span class = 'live'>"+snM+"</span>");
				}else if(!ssn1Rule.test(ssn1)) { 
					$("#ssn2").after("<span class = 'live'>"+snRM+"</span>");
				}else if(!ssn2Rule.test(ssn2)) { 
					$("#ssn2").after("<span class = 'live'>"+snRM2+"</span>");
				} 
			}

			if (username.length == 0 || !nameRule.test(username)){
				event.preventDefault();
				if (username.length == 0){
					$("#username").after("<span class = 'live'>"+unM+"</span>");
				}else if(!nameRule.test(username)) {
					$("#username").after("<span class = 'live'>"+unRM+"</span>");
				} 
			}
			
			if(passwd.length == 0 ||!pwRule.test(passwd) || passwd != cnfPw){
				event.preventDefault();
				if(passwd.length == 0) {
					$("#passwd").after("<span class = 'live'>"+pwM+"</span>");
				}else if(!pwRule.test(passwd)) { 
					$("#passwd").after("<span class = 'live'>"+pwRM+"</spaan>");				
				}else if (passwd != cnfPw){
				 	$("#cnfPasswd").after("<span class = 'live'>"+cpM+"</span>");
				}
			}		 //?
			
			if (userid.length == 0 || !idRule.test(userid)){
				event.preventDefault();
				if (userid.length == 0){
					$("#userid").after("<span class = 'live'>"+idM+"</span>");
				}else if(!idRule.test(userid)){ 
					$("#userid").after("<span class = 'live'>"+idRM+"</span>");				
				} 
			} 
			
			
			$(".live").css("font-size", "9pt"); 
		}); //end check null and multipled ID and regular expression ==> submit event
		
		
		$("body").on("keyup", "input[type]", function(e) {
				$(this).val($(this).val().replace(/(\s*)/g, ""));
		});
});
