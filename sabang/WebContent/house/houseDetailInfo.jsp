<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/houseDetailInfo.css">
		<div class="wrapper">
			<div class="main-element">
				<p>${info.hcode}</p>
				<span id = "title">${info.hname}</span>
			</div>
			<div class="element-container">
				<div class="element" id="leftElement">
					<div class="houseImg">
						<img src="${info.himage}.jpg" alt="${info.himage}.jpg" height="42" width="42">
					</div>
					<div class="agentInfo">
							${agentInfo.username}
					</div>
				</div>
				<div class="element" id="rightElement">
					<div class="housePrice"> ${price.deposit} </div>
					<div class="option">
							<c:choose>
								<c:when test="${option.loan == 'Y'.charAt(0) }">
									<img src="images/pictograms/loan.png" height="42" width="42">
								</c:when>
								<c:when test="${option.pet == 'Y'.charAt(0) }">
									<img src="images/pictograms/pet.png" height="42" width="42">
								</c:when>
							</c:choose>
					</div>
					<div id="board"> 
					<table>
					<tr> <td colspan = '3'> 제목</td> <td> 핸드폰번호</td> </tr>
				 	 	<c:forEach var="board" items="${board}">
					<tr>
					<td>${board.title}</td>
					<td colspan = '3'> ${board.phone}</td>
					</tr>
						</c:forEach>	  
					</table>
					</div> 
	</div>
	</div>
