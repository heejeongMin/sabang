<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8573930680705c377bb41b984d5c1a"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8573930680705c377bb41b984d5c1a&libraries=clusterer"></script>

<!-- 신매물 테이블 좌표저장 -->
<c:if test="${!(empty newList)}">
	<c:set var="newListforMap" value="newList"/>
	<script>
		var coord = [];
	</script>
	<c:forEach var="item" items="${newList}">
		<c:set var="x" value="${item.COORDX}"/>
		<c:set var="y" value="${item.COORDY}"/>
		<script>
		var array = [];
			array.push("${x}");
			array.push("${y}");
			coord.push(array);
		</script>
	</c:forEach>
</c:if>


<script type="text/javascript">
	$(document).ready(function(){
		// 함수 호출
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.565778, 126.938528), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);
		// 지도의 최대레벨
		map.setMaxLevel(6);
		// 지도의 최소레벨
		map.setMinLevel(6);
		// 지도 이동 금지
		map.setDraggable(false);
	
		
	
		// 마커 출력
		var positions = [];
		for(var i = 0; i< coord.length; i++){
			var json = {};
			json.latlng = new daum.maps.LatLng(coord[i][0], coord[i][1]);
			positions.push(json);
		}
		 
		
		// 마커 이미지 저장
		var imageSrc = "images/marker/markerBlue.png"; 
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    });
		}
		 
		 
		
		// 마커 클러스터러
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });
	 
	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	    $.get(positions, function(data) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        var markers = $(data.positions).map(function(i, position) {
	            return new daum.maps.Marker({
	                position : new daum.maps.LatLng(position.lat, position.lng)
	            });
	        });

	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    });
	});
</script>
<link rel="stylesheet" href="css/mainmap.css">
<div id="container">
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
    </div>
</div>