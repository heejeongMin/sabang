<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<c:remove var="mesg" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").on("click", function(e){
			var ppwd = prompt("비밀번호 입력","게시물 비밀번호를 입력해주세요");
			var pcode = $("h3").attr("data-pcode")
			location.href = "../DeleteBoardServlet?pcode="+pcode+"&ppwd="+ppwd; 
		})
		
	 	$("#edit").on("click", function(e){
			var pcode = $("h3").attr("data-pcode")
			var ppwd = $("h3").attr("data-ppwd")
			location.href = "../PostBoardServlet?pcode="+pcode+"&ppwd="+ppwd; 
		})
	})
</script>


<style>
th {
	text-align: left;
}
</style>


	<table>
		<c:forEach var="board" items="${board}" varStatus="status">
			<c:if test="${board.pcode eq param.pcode }">
				<h3 data-pcode="${board.pcode}" data-ppwd ="${board.ppwd}"> ${board.title}</h3>
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
	 <input type="button" id="edit" class = "alter" value="수정"> 
	 <input type="button" id="delete" class = "alter"value="삭제">
		
<c:set var="func" value="${func}" scope="session" />
<c:if test="${!(empty func)}">
	<script>
		window.close();
	</script>
</c:if>
<c:remove var="func" />		
		
