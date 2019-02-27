<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" href="css/houseDetailInfo.css">
<link rel="stylesheet" href="css/houseDetailInfo2.css">

<script src="js/houseDetailInfo.js"></script>
<script src="js/geoLocation.js"></script>

<c:set var="mesg" value="${mesg}" scope="session" />
<c:if test="${!(empty mesg)}">
	<script>
		alert('${mesg}');
	</script>
	<c:remove var="mesg" />
</c:if>

<div class="wrapper">
	<div class="main-element">
		<h2><p id="hcodeBar">매물코드 : ${info.hcode}</p></h2>
		<div id="likeAndShare">
			<div class="func" id="like" data-code="${info.hcode}"><i class="fas fa-heart"></i> 찜하기</div>
			<div class="func" id="share" onclick="share()">
				<span>
					<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
					<script type="text/javascript">
						new ShareNaver.makeButton({"type": "b"});
					</script>
				</span>
			공유하기</div>
			<form id="myform" style="dispaly:none;"><!-- form 부분은 없으면 네이버 공유가 작동을 안해서 넣어놈. display 안됨 -->
				<input type="hidden" style="dispaly:none;" id="url" value="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"><br/>
    			<input type="hidden" style="dispaly:none;" id="title" value="사방 매물 공유 ${info.hcode} "><br/>
			</form>
		</div>
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
				<div id="weatherBlock">
					<p><i class="fas fa-umbrella"></i> 강수량: <span id="pop"></span>&percnt; <i class="fas fa-sun"></i> 낮 최고기온: <span id="tmx"></span>&#8451;</p>
					<p id="weatherForcast"></p>
				</div>
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
<script type="text/javascript">
$(document).ready(function(){
	getLocation();// 화면뜨자마자 현재위치 기반 날씨 가져오기
	
	$("div#like").on("click", function(e){//찜하기 누르면 house_info의 cntwish 값 증가와 wishlist 추가
		$.ajax({
			type:'get',
			url:'HouseLikeServlet',
			data: {hcode:$(e.target).attr("data-code")},
			dataType: 'text',
			success:function(data, status, xhr){
				if (data == 0){
					alert ("찜을 아쉽지만 6개 까지만 가능합니다~");
				} else if (data==1){
					alert ("I like it~ 찜하기에 성공하였습니다.");
				} else if (data==2){
					alert ("이미 찜을 하셨네요~");
				}
			},
			error: function(xhr, status, error){console.log(status);}
		});//end ajax
	});//click
	
	
});//end ready	
	function share() { //네이버 share 기능
	    var url = encodeURI(encodeURIComponent(myform.url.value));
	    var title = encodeURI(myform.title.value);
	    var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
	    alert("많이 공유해주세요~~");
	    window.open (shareURL, "naver공유", "_blank", "width=100, height=100");
	}
</script>