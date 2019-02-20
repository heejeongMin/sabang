<%@page import="com.dto.AgentDTO"%>
<%@page import="com.dto.MemberDTO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>




<span style="color: white"> <img src="images/logo/sabanglogo_w.png" width="23px" height = "100%"> Sabang

	<c:choose>
             <c:when test="${memberInfo ne null}">
             <c:set var="name" value="${memberInfo.username}" scope="request" />
				<c:out value="${name}" />님을 위한 사방팔방 곳곳의 방
				<a href="LogoutServlet">로그아웃</a> 
				<a href="MyPageServlet">mypage</a>
				<a href = "#" id ="delMbr">회원탈퇴 </a>
             </c:when>

             <c:when test="${agentInfo ne null}">
              <c:set var="name" value="${agentInfo.agntnam}" scope="request" />
				<c:out value="${name}" />님을 위한 사방팔방 곳곳의 방
				<a href="LogoutServlet">로그아웃</a> 
				<a href="MyPageServlet">mypage</a>
             </c:when> 
              
              <c:otherwise>
              	<a href="LoginUIServlet">로그인</a> 
              	<a href="MemberUIServlet">회원가입</a>
              </c:otherwise>
       </c:choose>
       	</span>
 
 <!-- my page -->
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delMbr").on("click", function() {
			var cfm = confirm("정말 탈퇴하시겠습니까? 회원 탈퇴시 하루동안 재가입 할 수 없습니다.");
			if (cfm == true) {
				location.href = "DelMbrIdConfirmServlet";
				alert("탈퇴하기를 누르셨습니다. "+'${name}'+"님의 모든 정보는 모두 삭제됩니다");
			} else {
				alert("감사합니다, "+'${name}'+"님께 더 나은 서비스를 제공하는 사방이 되겠습니다.");
			}
		})
	})
</script>
       	
       	
       	
