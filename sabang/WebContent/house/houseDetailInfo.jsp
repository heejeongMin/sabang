<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
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
				<img src="images/house/${info.himage}.jpg" alt="${info.himage}.jpg"
					width="100%">
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
				<c:set var="remainder" value="${fn:length(list)%3}" />
				<c:choose>
					<c:when test="${remainder == 0 }">
						<c:set var="row" value="${fn:length(list)/3}" />
					</c:when>
					<c:otherwise>
						<c:set var="row" value="${(fn:length(list)/3)}" />
					</c:otherwise>
				</c:choose>
				<c:set var="num" value="0" />
				<c:set var="condition" value="true" />
				<div style="margint-left: auto; margin-right: auto; text-align : center;" >
					<c:forEach var="item" items="${list}" varStatus="status">
						<c:if test="${condition}">
							<c:if test="${num == status.index}">
								<c:choose>
									<c:when test="${num ==0 || num % 3 != 0 }">
										<div id = "pics" style="display: inline-block; margin: 10px 0 10px 0 ; padding: 0 10px 0 10px">
											<img src="images/pictograms/${item}.png" height="40"
												width="40">
											<c:if test="${item eq 'bltin'}">
												<br>빌트인 주방
										</c:if>
											<c:if test="${item eq 'loan'}">
												<br>전세자금대출가능
										</c:if>
											<c:if test="${item eq 'mdate'}">
												<br>즉시 입주
										</c:if>
											<c:if test="${item eq 'pet'}">
												<br>애완동물
										</c:if>
											<c:if test="${item eq 'elev'}">
												<br>엘레베이터
										</c:if>

										</div>
										<c:set var="num" value="${num + 1}" />
									</c:when>
									<c:when test="${num%3 ==0 }">
										<div></div>
										<div style="display: inline-block; width: 40px;">${item}</div>
										<c:set var="condition" value="false" />
										<c:set var="num" value="${num + 1}" />
									</c:when>
								</c:choose>
							</c:if>
						</c:if>
					</c:forEach>
					<br> 기타 사항 ( ${etc} )
					<c:set var="condition" value="true" />
					<c:forEach var="item" items="${list}" varStatus="status">
					</c:forEach>
				</div>
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
					</tr>

					<c:forEach var="board" items="${board}" varStatus="status">
						<!-- 해당 보드 클릭시 팝업으로 보드 보이기 -->
						<tr class="row">
							<td>${status.count}</td>
							<td data-pcode="${board.pcode}">${board.title}</td>
							<td data-pcode="${board.pcode}">${board.userid}</td>
							<td data-pcode="${board.pcode}">${board.pdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>