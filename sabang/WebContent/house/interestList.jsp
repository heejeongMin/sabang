<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<link rel="stylesheet" href="css/houseList.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
  <!-- Initialize Swiper -->
<div id="wrap">
<a href="InterestListServlet?iCategory=rcnlist">최근 본 방</a>
<a href="InterestListServlet?iCategory=wishlist">찜한 방</a>
<h1>최근 본 방<span id="noOfHouse">${fn:length(newList)}</span>건</h1>
  <!-- Swiper -->
  <div class="swiper-container" style="width:880px; margin-left:0; height: 360px">
    <div class="swiper-wrapper">
    	<c:forEach var="HouseInfo" items="${houseInfoList}">
	    	 <div class="swiper-slide">
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
		 	</div>
    	</c:forEach>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination" ></div>
  </div>
