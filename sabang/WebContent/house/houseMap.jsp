<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8573930680705c377bb41b984d5c1a"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8573930680705c377bb41b984d5c1a&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af8573930680705c377bb41b984d5c1a&libraries=clusterer"></script>
<link rel="stylesheet" href="css/mainmap.css">
</head>
<body>
<div id="container">
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
    	
    	 <!-- 지도 위에 표시될 마커 카테고리 -->
		 <div class="category">
	        <ul>
	            <li id="coffeeMenu" onclick="changeMarker('coffee')">
	                <span class="ico_comm ico_coffee"></span>
	                	카페
	            </li>
	            <li id="storeMenu" onclick="changeMarker('store')">
	                <span class="ico_comm ico_store"></span>
	                	편의점
	            </li>
	            <li id="carparkMenu" onclick="changeMarker('carpark')">
	                <span class="ico_comm ico_carpark"></span>
	                	도서관
	            </li>
	        </ul>
	    </div>
    </div>
</div>




<!-- 신매물 테이블 좌표저장 -->
<c:if test="${!(empty newList)}">
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
		map.setMinLevel(3);
		// 지도 이동 금지
		map.setDraggable(false);
		
		
		
		// 마우스 휠 이벤트
		// 지도 확대 후 이동 가능 및 축소 후 원래 좌표로 돌아오기 
		daum.maps.event.addListener(map, 'idle', function() {
			if(map.getLevel()<6){
				map.setDraggable(true);
			}else if(map.getLevel()==6){
				map.setDraggable(false);
				map.setCenter(new daum.maps.LatLng(37.565778, 126.938528));
			}
		});
		
		
		
/* 
		// 마커 출력
		var positions = [];
		for(var i = 0; i< coord.length; i++){
			var json = {};
			json.latlng = new daum.maps.LatLng(coord[i][0], coord[i][1]);
			positions.push(json);
		}
		 
		
		// 마커 이미지 저장
		var imageSrc = "images/marker/markerBlue.png"; 
		for (var i = 1; i < (positions.length); i ++) {
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
			
		} */
		
		
		
		// 카페 마커가 표시될 좌표 배열입니다
		var coffeePositions = [ 
		    new daum.maps.LatLng(37.569406672142456, 126.93173920685587),
		    new daum.maps.LatLng(37.56351392364315, 126.9253926114588),
		    new daum.maps.LatLng(37.56186042771902, 126.92656230924486),
		    new daum.maps.LatLng(37.5584391131211, 126.9370866812841),
		    new daum.maps.LatLng(37.558244042277146, 126.94330255758469),
		    new daum.maps.LatLng(37.56205766207434, 126.92499565832408),
		    new daum.maps.LatLng(37.55413739144038, 126.92706331544218),               
		    new daum.maps.LatLng(37.55774083206093, 126.93878492052923),               
		    new daum.maps.LatLng(37.5570612945145, 126.93506425671245),                
		    new daum.maps.LatLng(37.56255993608386, 126.94745540735512),                
		    new daum.maps.LatLng(37.56331504061321, 126.94369712684679)                
		];

		// 편의점 마커가 표시될 좌표 배열입니다
		var storePositions = [
		    new daum.maps.LatLng(37.56470049815986, 126.9394990975759),
		    new daum.maps.LatLng(37.55904754883219, 126.93590005603934),
		    new daum.maps.LatLng(37.55880216671275, 126.94228352892168),
		    new daum.maps.LatLng(37.55893473356894, 126.94070798030427),
		    new daum.maps.LatLng(37.55873266769416, 126.94782931992488),
		    new daum.maps.LatLng(37.55720425065452, 126.94709700502537),
		    new daum.maps.LatLng(37.56540832218574, 126.95031480987691),
		    new daum.maps.LatLng(37.56255993608386, 126.94745540735512),
		    new daum.maps.LatLng(37.56510662917557, 126.95285494806376),
		    new daum.maps.LatLng(37.564634392107806, 126.93069771150611),
		    new daum.maps.LatLng(37.5653020379637, 126.93226361831663),
		    new daum.maps.LatLng(37.563182507210136, 126.93159095453868),
		    new daum.maps.LatLng(37.5590258340482, 126.92942172294279),
		    new daum.maps.LatLng(37.55867069691373, 126.93225151323217),
		    new daum.maps.LatLng(37.56291887235145, 126.93065855417491),
		    new daum.maps.LatLng(37.56876210571136, 126.93269062032132)
		];

		// 주차장 마커가 표시될 좌표 배열입니다
		var carparkPositions = [
		    new daum.maps.LatLng(37.55585045214628, 126.94218621244649),
		    new daum.maps.LatLng(37.55859026760159, 126.93668816730333),
		    new daum.maps.LatLng(37.55688729590438, 126.93325812644618),
		    new daum.maps.LatLng(37.563876754527094, 126.95061463835172),
		    new daum.maps.LatLng(37.56255993608386, 126.94745540735512),
		    new daum.maps.LatLng(37.56470049815986, 126.9394990975759),
		    new daum.maps.LatLng(37.56437248231042, 126.93273984469688)
		];
		
		
		var markerImageSrc = 'images/marker/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
	    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
	    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
	    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

	    
		createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
		createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
		createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다
	
	
	
		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new daum.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}
	
		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
		    var marker = new daum.maps.Marker({
		        position: position,
		        image: image
		    });
		    
		    return marker;  
		}   
		   
		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {
		    
		    for (var i = 0; i < coffeePositions.length; i++) {  
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {  
		                spriteOrigin: new daum.maps.Point(10, 0),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };     
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(coffeePositions[i], markerImage);  
		        
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        coffeeMarkers.push(marker);
		    }     
		}
	
		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {        
		    for (var i = 0; i < coffeeMarkers.length; i++) {  
		        coffeeMarkers[i].setMap(map);
		    }        
		}
	
		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
		    for (var i = 0; i < storePositions.length; i++) {
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new daum.maps.Point(10, 36),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(storePositions[i], markerImage);  
	
		        // 생성된 마커를 편의점 마커 배열에 추가합니다
		        storeMarkers.push(marker);    
		    }        
		}
	
		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {        
		    for (var i = 0; i < storeMarkers.length; i++) {  
		        storeMarkers[i].setMap(map);
		    }        
		}
	
		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
		    for (var i = 0; i < carparkPositions.length; i++) {
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new daum.maps.Point(10, 72),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(carparkPositions[i], markerImage);  
	
		        // 생성된 마커를 주차장 마커 배열에 추가합니다
		        carparkMarkers.push(marker);        
		    }                
		}
	
		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {        
		    for (var i = 0; i < carparkMarkers.length; i++) {  
		        carparkMarkers[i].setMap(map);
		    }        
		}
	
		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
		    
		    var coffeeMenu = document.getElementById('coffeeMenu');
		    var storeMenu = document.getElementById('storeMenu');
		    var carparkMenu = document.getElementById('carparkMenu');
		    	
		    
		    // 커피숍 카테고리가 클릭됐을 때
		    if (type === 'coffee') {
		    
		        // 커피숍 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = 'menu_selected';
		        
		        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
		        storeMenu.className = '';
		        carparkMenu.className = '';
		        
		        
		        // 커피숍 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(map);
		        setStoreMarkers(null);
		        setCarparkMarkers(null);
		        
		    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
		    
		        // 편의점 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = 'menu_selected';
		        carparkMenu.className = '';
		        
		        // 편의점 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(map);
		        setCarparkMarkers(null);
		        
		    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
		     
		        // 주차장 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = '';
		        carparkMenu.className = 'menu_selected';
		        
		        // 주차장 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(null);
		        setCarparkMarkers(map);  
		    }
		} 
			
</script>
</body>
</html>