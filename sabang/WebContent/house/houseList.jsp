<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<c:set var="list" value="${pagingMap.list}"/>
<h1>조건에 맞는 방 <span id="noOfHouse"> ${pagingMap.totalPage}</span>건</h1>
<table id="outerTable">
	<tr>
		<td>
			<c:forEach var="house" items="${list}">
				<table id="innerTable">
					<tr>
						<td class="img"><img src="#" alt="${house.HCODE}" width="300" height="300"/></td>
					</tr>
					<tr> 
						<td class="greyText">
						<c:choose>
							<c:when  test="${house.HTYPE == 'o'}">
								원룸 
							</c:when>
							<c:when  test="${house.HTYPE == 't'}">
								투룸
							</c:when>
							<c:when  test="${house.HTYPE == 'f'}">
								오피스텔
							</c:when>
							<c:when  test="${house.HTYPE == 'p'}">
								아파트
							</c:when>
						</c:choose>
						</td>
 					</tr>
					<tr>
						<td style="padding: 6px 0 6px 0;"><font size=5><b>${house.RTYPE} ${house.DEPOSIT} / ${house.MRENT}</b></font></td>
					</tr>
 					<tr>
						<td class="greyText">
							<span>${house.AREA},</span>
							<span>관리비 ${house.MAINTC}</span>
						</td>
					</tr>
					<tr> <td class="greyText"><p class="hetc">${house.HETC}</p></td> </tr>
				</table>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td id="pages">
			<c:choose>
				<c:when test="${fn:length(list) == 0}"><!-- 검색 결과가 0건일때  -->
					검색 결과가 없습니다 :(
				</c:when>
				<c:otherwise><!-- 검색 결과가 0건이 아닐때  -->
					<c:set var="repeat" value="${pagingMap.totalPage%pagingMap.perPage}"/>
					<c:if test="${repeat != 0 }">
						<c:set var="repeat" value="${(pagingMap.totalPage/pagingMap.perPage) + 1}"/>
					</c:if>
					<c:if test="${repeat == 0 }">
						<c:set var="repeat" value="${(pagingMap.totalPage/pagingMap.perPage)}"/>
					</c:if>
					<c:forEach var="i" begin="1" end="${repeat}">
						<c:choose>
							<c:when test="${i == (pagingMap.curPage)}">
								<a class="focusedPage">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="HouseListServlet?curPage=${i}&search=${search}" class="unfocusedPage">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
