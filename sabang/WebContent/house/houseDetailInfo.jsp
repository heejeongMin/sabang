<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="js/houseDetailInfo.js"></script>
<link rel="stylesheet" href="css/houseDetailInfo.css">
<div class="wrapper">
	<div class="main-element">
		<p>${info.hcode}</p>
		<span id="title">${info.hname}</span>
	</div>
	<br>
	<div class="element-container">
		<div class="element" id="leftElement">
			<div class="houseImg">
				<img src="${info.himage}.jpg" alt="${info.himage}.jpg" height="42"
					width="42">
			</div>
			<br>
			<div class="agentInfo">
				<h3>공인중개사 정보</h3>
				<br>
				<hr class="content">
				<br>
				<table>
					<tr>
						<th>이름</th>
						<td>${agentInfo.username}</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td>${agentInfo.phone}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${agentInfo.email}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${agentInfo.addr}</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="option"></div>


		<div class="element" id="rightElement">
			<div class="housePrice">
				<h3>가격 정보</h3>
				<br>
				<hr class="content">
				<br>
				<table>
					<tr>
						<th>보증금</th>
						<td>${price.deposit}만원</td>
					</tr>
					<tr>
						<th>월세</th>
						<td>${price.mrent}만원</td>
					</tr>
					<tr>
						<th>전세</th>
						<td>${price.yrent}만원</td>
					</tr>
					<tr>
						<th>관리비</th>
						<td>${price.maintc}만원</td>
					</tr>
					<tr>
						<th>주차비</th>
						<td>${price.parkf}만원</td>
					</tr>
				</table>
			</div>
			<br>
			<div class="option">
				<h3>옵션</h3>
				<br>
				<hr class="content">
				<br>
				<table>
					<tr>
						<c:choose>
							<c:when test="${option.loan == 'Y'.charAt(0) }">
								<td text-align="center"><img
									src="images/pictograms/loan.png" height="40" width="40"><br>전세자금대출가능
								</td>
							</c:when>
							<c:when test="${option.pet == 'Y'.charAt(0) }">
								<td text-align="center"><img
									src="images/pictograms/pet.png" height="40" width="40"><br>애완동물
								</td>
							</c:when>
						</c:choose>
					</tr>
				</table>
			</div>
			<br>
			<div id="board">
				<h3>문의사항</h3>
				<br>
				<hr class="content">
				<br>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<c:forEach var="board" items="${board}" varStatus="status" scope = "session">
						<!-- 해당 보드 클릭시 팝업으로 보드 보이기 -->
						<tr class = "row" data-pcode="${board.pcode}">
							<%--  <c:set var="count" value="${status.count}" data-count = "${status.count}" scope="session" /> --%>
							<td>${status.count}</td>
							<td>${board.title}</td>
							<td>${board.userid}</td>
							<td>${board.pdate}</td>
							<td><input type="button" value="수정" data-class="${board.pcode}"></td>
							<td><input type="button" value="삭제"
								data-id="${board.pcode}>"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>