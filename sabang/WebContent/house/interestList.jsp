<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="js/innerTable.js"></script>
<link rel="stylesheet" href="css/houseList.css">
<style>
a.focusedPage{
	background: none;
    width: 25px;
    color: dodgerblue;
}
a.unfocusedPage{
	background: dodgerblue;
    border-radius: 50%;
    width: 25px;
    color: white;
    text-decoration: none;
}
</style>
<div id="wrap">
<c:set var="HInfoRcn" value="${houseInfoRcnList}"/>
<c:set var="HInfoWish" value="${houseInfoWishList}"/>
<c:set var="HInfoRcnLength" value="${fn:length(houseInfoRcnList)}"/>
<c:set var="HInfoWishLength" value="${fn:length(houseInfoWishList)}"/>
<a href="InterestListServlet?iCategory=rcnlist">최근 본 방</a>
<a href="InterestListServlet?iCategory=wishlist">찜한 방</a>
	<c:if test="${!empty HInfoRcn}">
	<h1>최근 본 방<span id="noOfHouse">${fn:length(houseInfoRcnList)}</span>건</h1>
		<table id="wholeTable">
			<tr>
				<td>
					<table id="outerTable">
					<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td height="1" colspan="8" bgcolor="CECECE"></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							
							<c:forEach var="HouseInfo" items="${houseInfoRcnList}" varStatus="status">
							<td>
								<table id="innerTable">
								<tr>
									<td class="img"><img src="#" alt="${HouseInfo.HCODE}" width="300" height="300"/></td>
								</tr>
								<tr> 
									<td class="greyText">
									<c:choose>
										<c:when  test="${HouseInfo.HTYPE == 'o'}">
											원룸 
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 't'}">
											투룸
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 'f'}">
											오피스텔
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 'p'}">
											아파트
										</c:when>
									</c:choose>
									</td>
						 		</tr>
								<tr>
									<td style="padding: 6px 0 6px 0;"><font size=5><b>${HouseInfo.RTYPE} ${HouseInfo.DEPOSIT} / ${HouseInfo.MRENT}</b></font></td>
								</tr>
						 		<tr>
									<td class="greyText">
										<span>${HouseInfo.AREA},</span>
										<span>관리비 ${HouseInfo.MAINTC}</span>
									</td>
								</tr>
								<tr> <td class="greyText"><p class="hetc">${HouseInfo.HETC}</p></td> </tr>
								</table>
							</td>
							<c:if test="${(status.index+1)%3==0}">
								<tr>
									<td height="10"> </td>
								</tr>
							</c:if>
							</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="10">
			</tr>
		</table>
	</c:if>
	<c:if test="${!empty HInfoWish}">
	<h1>찜한 방<span id="noOfHouse">${fn:length(houseInfoWishList)}</span>건</h1>
	    <table id="BackTable">
			<tr>
				<td>
					<table id="outerTable">
					<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td height="1" colspan="8" bgcolor="CECECE"></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							
							<c:forEach var="HouseInfo" items="${houseInfoWishList}" varStatus="status">
							<td>
								<table id="innerTable">
								<tr>
									<td class="img"><img src="#" alt="${HouseInfo.HCODE}" width="300" height="300"/></td>
								</tr>
								<tr> 
									<td class="greyText">
									<c:choose>
										<c:when  test="${HouseInfo.HTYPE == 'o'}">
											원룸 
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 't'}">
											투룸
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 'f'}">
											오피스텔
										</c:when>
										<c:when  test="${HouseInfo.HTYPE == 'p'}">
											아파트
										</c:when>
									</c:choose>
									</td>
						 		</tr>
								<tr>
									<td style="padding: 6px 0 6px 0;"><font size=5><b>${HouseInfo.RTYPE} ${HouseInfo.DEPOSIT} / ${HouseInfo.MRENT}</b></font></td>
								</tr>
						 		<tr>
									<td class="greyText">
										<span>${HouseInfo.AREA},</span>
										<span>관리비 ${HouseInfo.MAINTC}</span>
									</td>
								</tr>
								<tr> <td class="greyText"><p class="hetc">${HouseInfo.HETC}</p></td> </tr>
								</table>
							</td>
							<c:if test="${(status.index+1)%3==0}">
								<tr>
									<td height="10"></td>
								</tr>
							</c:if>
							</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="10">
			</tr>
		</table>
	</c:if>
</div>