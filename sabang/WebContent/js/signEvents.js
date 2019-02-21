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
		}); //equal check password end
	
		$("body").on("submit", "#signForm", function(event) {
			$(this).find("span.live").remove();
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			var cnfPw = $("#cnfPasswd").val();
			var username = $("#username").val();
			var ssn1  = $("#ssn1").val();
			var ssn2  = $("#ssn2").val();
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
			}
			$(".live").css("font-size", "9pt"); 
		}); //check null and multipled ID end
	
	 	$("body").on("submit", "#signForm", function(){
			var nextPage = "#"
			if (page == 'member') {
				nextPage = "main"
			}
			$("form").attr("action", nextPage)
		}) 
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