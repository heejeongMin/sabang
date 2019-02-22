<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h4>회원 가입 </h4>

<form action = "SignMbrServlet" method = "get">
 <input type="text" name="userid" id="userid" placeholder = "아이디">
<br> 
<input type="password" name="passwd" id="passwd" placeholder="비밀번호" ><br>
<input type="password" name="cnfPasswd" id="cnfPasswd" placeholder="비밀번호 확인" >
<br> 
<input type="text" name="username" id ="username" placeholder = "이름"><br> 
<input type = "text" name = "ssn1" id = "ssn1" placeholder = "주민등록번호 앞자리"> - <input type = "password" id = "ssn2" name = "ssn2" placeholder = "주민등록번호 뒷자리"> <br> 
<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name="addr" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;">
<span id="guide"></span>
<br>
<select name="phone1" id = "phone1">
  <option value="010">010</option>
  <option value="011">011</option>
</select>-
<input type="text" name="phone2" id = "phone2">-<input type="text" name="phone3" id = "phone3">
<br>
<input type="text" name="email1" id="email1" placeholder = "이메일">@
<input type="text" name = "email2" id="email2" placeholder = "직접 입력">
	<select id="email3">
		<option value="direct">직접 입력</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="yahoo.co.kr">yahoo.co.kr</option>
		<option value="paran.com">paran.com</option>
		<option value="nate.com">nate.com</option>
		<option value="empal.com">empal.com</option>
		<option value="dreamwiz.com">dreamwiz.com</option>
		<option value="hanafos.com">hanafos.com</option>
		<option value="korea.com">korea.com</option>
		<option value="chol.com">chol.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="lycos.co.kr">lycos.co.kr</option>
		<option value="netian.com">netian.com</option>
		<option value="hanmir.com">hanmir.com</option>
		<option value="sayclub.com">sayclub.com</option>
	</select> 
	<!-- <span id="direct_email" style="margin-top:3px;display:none">
        <input type="text" name="email3" id="email3"  class="MS_input_txt" value="" size="15" maxlength="25"  onchange="this.form.emailcheck.value=''" />
    </span>   -->
	
<br>
<input type="submit" value="회원가입">
<input type="reset" value="취소"> 
</form>