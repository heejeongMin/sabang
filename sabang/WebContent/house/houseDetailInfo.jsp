<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/houseDetailInfo.css">
	<c:forEach var="info" items="${info}">
		<div class="wrapper">
			<div class="main-element">
				<p>${info.hcode}</p>
			</div>
			<div class="element-container">
				<div class="element" id="leftElement">
					<div class="houseImg">
						<img src="${info.himage}.jpg" alt="${info.himage}.jpg" height="42" width="42">
					</div>
					<div class="agentInfo">
						<c:forEach var="agentInfo" items="${agentInfo}">
							${agentInfo.username}
						</c:forEach>
					</div>
				</div>
				<div class="element" id="rightElement">
						<div class="housePrice">
							<c:forEach var="price" items="${price}">
								${price.deposit}
							</c:forEach>
						</div>
<!-- 					<div class="option"> -->
<%-- 						<c:forEach var="option" items="${option}"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${option.loan == 'Y'}"> --%>
<!-- 									<img src="loan.png" height="42" width="42"> -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${option.pet == 'Y'}"> --%>
<!-- 									<img src="pet.png" height="42" width="42"> -->
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
	<%-- 			<div class="board">
	 	 	<c:forEach var="board" items="${board}">
				 ${board.content} 
			</c:forEach>	  
			</div> --%>
	</div>
	</div>
	</c:forEach>
