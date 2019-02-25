<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="MyPageServlet">정보 수정</a>
<a href="#">연락한 부동산</a>
<a href="#">내가 쓴 리뷰</a>
<a href="InterestListServlet">관심목록</a>
<a href="HouseManagingServlet">매물 관리</a>
<%-- 
에이전트 체크 후 메뉴 변동사항
<c:choose>
    <c:when test="${agent == 'N'}">
		<a href="MyPageServlet">내 정보</a>
		<a href="#">연락한 부동산</a>
		<a href="#">내가 쓴 리뷰</a>
		<a href="InterestListServlet">관심목록</a>
    </c:when>

    <c:when test="${agent == 'Y'}">
	   	<a href="MyPageServlet">내 정보</a>
		<a href="#">연락한 부동산</a>
		<a href="#">내가 쓴 리뷰</a>
		<a href="InterestListServlet">관심목록</a>
		<a href="#">매물 관리</a>
    </c:when> 
              
    <c:otherwise>
        <a href="LoginUIServlet" id="login">로그인</a> 
		<a href="SignCheckMbrServlet">회원가입</a>
	</c:otherwise>
 </c:choose> 
 --%>