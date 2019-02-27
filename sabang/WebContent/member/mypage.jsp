<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!(empty mesg)}">
	<script type="text/javascript">
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		// 아이디 비밀번호 입력 체크
		$("input[type=submit]").on("click",function(event){
			if($("#userid").val().length==0){
				event.preventDefault();
				alert("아이디를 입력해주세요.")
				$("#userid").focus();
			}else if($("#passwd").val().length==0){
				event.preventDefault();
				alert("비밀번호를 입력해주새요.")
				$("#passwd").focus();
			}
		}) // 아이디 비밀번호 입력 체크 end
		
		
		
		// 호출 시 전화번호 선택 방법1
		$("option[value='${phone[0]}']").prop("selected",true);
		
		
	
		// 핸드폰 번호 변경 인증
		var checkNum = 0;
		$("#phnChange").on("click",function(){
			if($("#phnConfirmResult").text().length==0 && $("#phnChange").val()=="변경"){
				$("#phnConfirmTr").css("visibility","visible");
				$("#phnChange").val("인증번호 발송");
			}else if($("#phnChange").val()=="인증번호 발송" && checkNum == 0){
				checkNum = Math.floor(Math.random() * 1000000) + 100000;
				if(checkNum>1000000){
					checkNum = checkNum - 100000;
					}
				$("#phnConfirmCheckNum").text("*인증번호 : " + checkNum);
			}else if($("#phnConfirmResult").text()=="인증이 완료되었습니다."){
				alert("인증이 완료되었습니다.")
			}else{
				alert("발송된 인증번호를 확인하세요.");
			}
		})
		

		
		// 인증 확인
		$("#phnConfirm").on("click",function(){
			if($("#phnConfirmNum").val()==checkNum && $("#phnConfirmCheckNum").text().length!=0){
				$("#phnConfirmTr").css("visibility","collapse");
				$("#phnChange").val("변경");
				$("#phnConfirmResult").text("인증이 완료되었습니다.");
				$(".phn").attr("disabled",false);
			}else{
				alert("인증번호를 확인하세요.");
			}
		    
		})
		
		
		
		// 이메일 자동입력
		$("#emailSelect").on("change",function(){
			$("#email2").val($(this).val());
		}) // end
		
		
		
		// 비밀번호 유효성검사
		$("#passwd").on("keyup",function(event){
				console.log($("#passwd").val());
				if(event.keyCode === 8 && $("#pwdResult").text() == "비밀번호 불일치"){
					event.preventDefault();
				}else{
					$.ajax({
						url:"MemberPwdCheckServlet",
						type:"get",
						data:{
							userid:$("input[name=userid]").val(),
							passwd:$("#passwd").val()
						},
						success:function(data,status,xhr){
							console.log(data);
							$("#pwdResult").text(data);
							if(data=="비밀번호 일치"){
								$(".pwdChange").attr("disabled",false);
							}else {
								$(".pwdChange").attr("disabled",true);
							}
						},
						error:function(xhr,status,err){
						}
					})
				}
				
		})
		
		
		// 비밀번호변경 유효성
		$("#pwdCheck2").on("keyup",function(){
			var passwd1 = $("#pwdCheck").val();
			var passwd2 = $("#pwdCheck2").val();
			if(passwd1.length==0){
				$("#pwdCheckResult").text("변경될 비밀번호를 입력해주세요.");
				$("#pwdCheck2").val("");
			}
			else if(passwd2.length!=0){
				
				if(passwd1==passwd2){
					$("#pwdCheckResult").text("변경 비밀번호 일치");
				}else{
					$("#pwdCheckResult").text("변경 비밀번호 불일치");
				}
			}else if(passwd2.length==0){
				$("#pwdCheckResult").text("");
			}
		}) // 비밀번호 유효성 end
		
		
		
		// 공백 및 한글 입력 방지
		$("input[type=password]").on("keyup",function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    	var inputVal = $(this).val();
		   		$(this).val(inputVal.replace(/[^a-z0-9!@#$%^&*()_+?<>]/gi,''));
			}
	   })
		
		
	   
	   // input 엔터(Submit) 방지
	   $('input').on("keydown",function(event) {
   			 if (event.keyCode === 13) {
       			 event.preventDefault();
    		}
	   });
	   
	   
	   
	   	// 업데이트
	   	$("#updateSubmit").on("click",function(event){
	   		var pwdCR= $("#pwdCheckResult").text();
	   		
	   		if($("#passwd").val().length==0){ 			
	   			event.preventDefault();
	   			alert("비밀번호를 입력하세요.");
	   			$("#passwd").focus();
	   		}else if($("#pwdResult").text()=="비밀번호 불일치"){
	   			event.preventDefault();
	   			alert("비밀번호를 확인해주세요.");
	   			$("#passwd").focus();
	   		}else if(pwdCR!="" && pwdCR=="변경 비밀번호 불일치"){
	   			event.preventDefault();
	   			alert("변경할 비밀번호가 일치하지않습니다.");
	   			$("#pwdCheck2").focus();
	   		}else{
	   			$("form").submit();
	   		}
	   	})
	})
</script>

<form action="MemberUpdateServlet" method="post" >
		<input type="hidden" value="${login.userid}" name="memberid"/>
	
 <table border="1">
		<tr>
			<th>이름</th>
			<td>${login.username}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<input type="text" name="email1" value="${email}" size="30" readonly/>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<select name="phone1" disabled="disabled" class="phn">
					<option value="011" class="phn">011</option>
					<option value="017" class="phn">017</option>
					<option value="010" class="phn">010</option>
				</select>-
				<input class="phn" type="text" name="phone2" value="${phone[1]}" size="3" maxlength="4" disabled="disabled">-
				<input class="phn" type="text" name="phone3" value="${phone[2]}" size="3" maxlength="4" disabled="disabled">
				<input type="button" value="변경" id="phnChange"/>
				<span id="phnConfirmResult" style="color:red"></span>
			</td>
		</tr>
		<tr style="visibility:collapse" id="phnConfirmTr">
			<th>인증번호</th>
			<td>
				<input type="text" id="phnConfirmNum"/>
				<input type="button" id="phnConfirm" value="인증번호 확인"/>
				<span style="color:red" id="phnConfirmCheckNum"></span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input type="password" placeholder="현재 비밀번호를 입력하세요." size="30" id="passwd"/>
				<span id="pwdResult" style="color:red"></span>
			</td>
		</tr>
		<tr>
			<th rowspan="2">
				비밀번호 변경
			</th>
			<td>
				<input type="password" placeholder="변경될 비밀번호를 입력하세요." id="pwdCheck" size="30"
				disabled="disabled" class="pwdChange"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" placeholder="변경될 비밀번호를 한번 더 입력하세요." 
					name="pwdCheck" id="pwdCheck2" size="30" disabled="disabled" class="pwdChange"/>
				<span id="pwdCheckResult" style="color:red"></span>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="updateSubmit" value="수정하기">
				<input type="reset" value="취소">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원탈퇴하기"/>
			</td>
		</tr>
	</table>
</form> 

