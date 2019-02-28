<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="js/houseDetailInfo.js"></script>
<c:if test="${!(empty mesg)}">
	<script type="text/javascript">
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg" />
<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<div id="board" style = "width: 50%">
	<h3>나의 문의 사항</h3>
	<hr class="content" >
	<table>
		<tr style= "text-align: left">
			<th>번호</th>
			<th>집 이름</th>
			<th>작성일</th>
			<th>글 제목</th>
		</tr>
		<c:forEach var="mybord" items="${map}" varStatus="status">
			<tr class="row">
				<td>${status.count}</td>
				<td data-pcode="${mybord.PCODE}">${mybord.HNAME}</td>
				<td data-pcode="${mybord.PCODE}">${mybord.PDATE}</td>
				<td data-pcode="${mybord.PCODE}">${mybord.TITLE}</td>
			</tr>
		</c:forEach>
	</table>
</div>