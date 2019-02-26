<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
th {
	text-align: left;
}
</style>

<form method="get" action="BoardServlet">
	<table>
		<c:forEach var="board" items="${board}" varStatus="status">
			<c:if test="${board.pcode eq param.pcode }">
				<h3>${board.title}</h3>
				<hr>
				<tr>
					<th>작성자</th>
					<td>${board.userid}</td>
				</tr>
				<tr>
					<th>게시시간</th>
					<td>${board.pdate}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${board.content}</td>
				</tr>

			</c:if>
		</c:forEach>
	</table>
	<br>
	<input type ="button" value = "수정">
	<input type ="button" value = "삭제">
</form>