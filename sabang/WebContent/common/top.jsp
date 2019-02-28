<%@page import="com.dto.AgentDTO"%>
<%@page import="com.dto.MemberDTO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/menu.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("li.filterRgn").on("click", function(e){
		$("li.filterRgn").find("ul.sublist").each(function(idx, ele){//다른 버튼을 누르면 이미 열린애들은 닫아주기
			if(ele.clientHeight != 0) $(ele).hide(); 
		});//end ul.sublist반복
		
	$(e.target).find("ul.sublist").slideToggle();
	});//end .filterRgn onClick
	
	//sub메뉴가 열렸을 때 누르면 부모인 li.filterRgn에 이벤트 전파 방지
	$("ul.sublist").on("click", function(e){
		e.stopPropagation();
	});//end ul.sublist onClick

	$(document).mouseup(function(e){// 버튼 눌렀다가 다른데 누르면 드롭다온 사라짐. 
		if($(e.target).parents().filter("ul#filterList").length == 0){
			$("li.filterRgn").find("ul.sublist").each(function(idx, ele){//다른 버튼을 누르면 이미 열린애들은 닫아주기
				if(ele.clientHeight != 0) $(ele).hide(); 
			});//end ul.sublist반복
		};
	});//end mouseup 
	
	$("input[name='region']").on("change", function(e){
		if ($(this).val() != '신촌') {
			alert("준비중입니다.")
		}
	});
	
	$("img#logoImg").on("click", function(e){
		location.href="main.jsp";
	});
	
	
});//end ready
	
</script>
<span style="color: white"> <img src="images/logo/sabanglogo_w.png" width="23px" height = "100%" id="logoImg" style="cursor: pointer;"> Sabang
	<c:choose>
             <c:when test="${memberInfo ne null}">
             <c:set var="name" value="${memberInfo.username}" scope="request" />
				<c:out value="${name}" />님을 위한 사방팔방 곳곳의 방
				<ul id="filterListRgn">
					<li class="filterRgn">지역별 매물
						<ul class="sublist subListHide" id="rgn">
							<li class="subFilter">
								<div class="rangeWrapRgn" >
									<input type="radio" name="region" class="filterRgn" value="신촌">신촌<br>
									<input type="radio" name="region" class="filterRgn" value="홍대">홍대<br>
									<input type="radio" name="region" class="filterRgn" value="안암">안암
								</div>
							</li>
						</ul>
					</li>
					<li><a href="LogoutServlet" id="logout">로그아웃</a></li>
					<li><a href="MyPageServlet">mypage</a></li>
					<li><a href = "#" id ="delMbr">회원탈퇴 </a> </li>
				</ul>
				
             </c:when>

             <c:when test="${agentInfo ne null}">
              <c:set var="name" value="${agentInfo.agntname}" scope="request" />
				<c:out value="${name}" />님을 위한 사방팔방 곳곳의 방
				<a href="LogoutServlet">로그아웃</a> 
				<ul id="filterListRgn">
					<li class="filterRgn">지역별 매물
						<ul class="sublist subListHide" id="rgn">
							<li class="subFilter">
								<div class="rangeWrapRgn" >
									<input type="radio" name="region" class="filterRgn" value="신촌">신촌<br>
									<input type="radio" name="region" class="filterRgn" value="홍대">홍대<br>
									<input type="radio" name="region" class="filterRgn" value="안암">안암
								</div>
							</li>
						</ul>
					</li>
					<li><a href="LogoutServlet">로그아웃</a></li>
					<li><a href="MyPageServlet">mypage</a></li>
					<li><a href = "#" id ="delMbr">회원탈퇴 </a> </li>
				</ul>
             </c:when> 
              
              <c:otherwise>
              	<a href="LoginUIServlet" id="login">로그인</a> 
              	<a href="SignCheckMbrServlet">회원가입</a>
              </c:otherwise>
       </c:choose>
       	</span>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delMbr").on("click", function() {
			var cfm = confirm("정말 탈퇴하시겠습니까? 회원 탈퇴시 하루동안 재가입 할 수 없습니다.");
			if (cfm == true) {
				location.href = "/sabang/DelMbrIdConfirmServlet";
				alert("탈퇴하기를 누르셨습니다. "+'${name}'+"님의 모든 정보는 모두 삭제됩니다");
			} else {
				alert("감사합니다, "+'${name}'+"님께 더 나은 서비스를 제공하는 사방이 되겠습니다.");
			}
		});
	});
</script>

       	
       	
       	
	
       	
