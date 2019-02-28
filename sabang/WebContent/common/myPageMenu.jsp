<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<a href="MyPageServlet">내정보</a>
<a href="#">연락한 부동산</a>
<a href="MyPageBoardServlet">내가 쓴 리뷰</a>

<a href="InterestListServlet">관심목록</a>
	<c:if test="${login.agent == 'Y'.charAt(0)}">
		<a href="HouseManagingServlet">매물 관리</a>
	</c:if>