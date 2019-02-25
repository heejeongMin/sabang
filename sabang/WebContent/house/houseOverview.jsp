<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<link rel="stylesheet" href="css/houseList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script src="js/innerTable.js"></script>
  <!-- Initialize Swiper -->
<c:set var="newList" value="${newList}"/>
<h1>신매물 <span id="noOfHouse">${fn:length(newList)}</span>건</h1>
  <!-- Swiper -->
  <div class="swiper-container" style="width:880px; margin-left:0; height: 360px; padding-top: 3px;">
    <div class="swiper-wrapper">
    	<c:forEach var="newHouse" items="${newList}">
	    	 <div class="swiper-slide" style="margin-right:-10px;">
				<table id="innerTable">
					<tr>
						<td class="img">
						<img class="goDetail" data-hcode="${newHouse.HCODE}" src="#" alt="${newHouse.HCODE}" width="300" height="250"/></td>
					</tr>
					<tr> 
						<td class="greyText">
						<c:choose>
							<c:when  test="${newHouse.HTYPE == 'o'}">
								원룸 
							</c:when>
							<c:when  test="${newHouse.HTYPE == 't'}">
								투룸
							</c:when>
							<c:when  test="${newHouse.HTYPE == 'f'}">
								오피스텔
							</c:when>
							<c:when  test="${newHouse.HTYPE == 'p'}">
								아파트
							</c:when>
						</c:choose>
						</td>
 					</tr>
					<tr>
						<td class="goDetail" data-hcode="${newHouse.HCODE}" style="padding: 6px 0 6px 0;  cursor:pointer;"><font size=5><b class="goDetail" data-hcode="${newHouse.HCODE}">${newHouse.RTYPE} ${newHouse.DEPOSIT} / ${newHouse.MRENT}</b></font></td>
					</tr>
 					<tr>
						<td class="greyText">
							<span>${newHouse.AREA},</span>
							<span>관리비 ${newHouse.MAINTC}</span>
						</td>
					</tr>
					<tr> <td class="greyText"><p class="hetc">${newHouse.HETC}</p></td> </tr>
				</table>
		 	</div>
    	</c:forEach>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination" ></div>
  </div>

<c:set var="hotList" value="${hotList}"/>
<h1>핫매물 <span id="noOfHouse">${fn:length(hotList)}</span>건</h1>
 <!-- Swiper -->
  <div class="swiper-container" style="width:880px; margin-left:0; height: 360px; padding-top: 3px;">
    <div class="swiper-wrapper">
    	<c:forEach var="hotHouse" items="${hotList}">
	    	 <div class="swiper-slide">
				<table id="innerTable">
					<tr>
						<td class="img">
						<img class="goDetail" data-hcode="${hotHouse.HCODE}" src="#" alt="${hotHouse.HCODE}" width="300" height="250"/></td>
					</tr>
					<tr> 
						<td class="greyText">
						<c:choose>
							<c:when  test="${hotHouse.HTYPE == 'o'}">
								원룸 
							</c:when>
							<c:when  test="${hotHouse.HTYPE == 't'}">
								투룸
							</c:when>
							<c:when  test="${hotHouse.HTYPE == 'f'}">
								오피스텔
							</c:when>
							<c:when  test="${hotHouse.HTYPE == 'p'}">
								아파트
							</c:when>
						</c:choose>
						</td>
 					</tr>
					<tr>
						<td class="goDetail" data-hcode="${newHouse.HCODE}" style="padding: 6px 0 6px 0;  cursor:pointer;"><font size=5><b class="goDetail" data-hcode="${hotHouse.HCODE}" >${hotHouse.RTYPE} ${hotHouse.DEPOSIT} / ${hotHouse.MRENT}</b></font></td>
					</tr>
 					<tr>
						<td class="greyText">
							<span>${hotHouse.AREA},</span>
							<span>관리비 ${hotHouse.MAINTC}</span>
						</td>
					</tr>
					<tr> <td class="greyText"><p class="hetc">${hotHouse.HETC}</p></td> </tr>
				</table>
		 	</div>
    	</c:forEach>
    </div>
    <!-- Add Pagination -->
   <div class="swiper-pagination"></div>
</div>
 <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 30,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        dynamicBullets: true,
      },
    });
  </script>