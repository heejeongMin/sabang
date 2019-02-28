function myPosition (nx, ny, errorCode){
	$("#x").val(nx);
	$("#y").val(ny);
	console.log(nx, ny);
	
	$.ajax({
		type:'get',
		url:'WeatherServlet',
		data: { nx : nx,
				ny : ny
			},
		dataType:'text',
		success:function(data, status, xhr){
			var result = $.parseJSON(data);
			$("span#pop").text(result.POP);
			$("span#tmx").text(result.TMX);
			var weatherMsg = "";
			if (Number.parseInt(result.POP) < 70){
				weatherMsg = (Number.parseInt(result.TMX) < 27)? "공인중개사님 만나기 좋은 날씨이네요! <i class='fas fa-grin-hearts'></i>": "오늘 좀 덥지만 방보는 걸 막을 수 없다! 공인중개사님과 연락하세요~ <i class='fas fa-meh-rolling-eyes'></i>";
			} else {
				weatherMsg = (result.TMX < 27)? "오늘은 비가 올 수도 있겠어요! 우산을 챙기고 강동원 닯은 공인중개사님을 만나볼까요? <i class='fas fa-smile-wink'></i>": "오늘 불쾌지수 오마이갓! 그래도 방 보는걸 막을 수 없다! 공인중개사님과 약속을 먼저 잡아 보는건 어떠세요? <i class='fas fa-grin-squint-tears'></i>";
			}
			$("p#weatherForcast").html(weatherMsg);
		},
		error:function(xhr, status, error){
		}
		
	});//end ajax
	
//	location.href="WeatherServlet?x="+nx+"&y="+ny;
	console.log($("#x").val());
}//end myPosition

function getLocation(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(locationSuccess, locationError, geo_options);
    }else{
        console.log("지오 로케이션 없음");
    }
};
//getLocation 

 function locationSuccess(p){
        var latitude = p.coords.latitude,
        longitude = p.coords.longitude;
        var rs = dfs_xy_conv("toXY",latitude,longitude);
        // 위도/경도 -> 기상청 좌표x / 좌표 y 변환
        console.log(rs.nx, rs.ny);
        myPosition(rs.nx, rs.ny);
    }
// locationSuccess
 
 function locationError(error){
        var errorTypes = {
            0 : "무슨 에러냥~",
            1 : "허용 안눌렀음",
            2 : "위치가 안잡힘",
            3 : "응답시간 지남"
        };
        var errorMsg = errorTypes[error.code];
        console.log(errorMsg);
        if (errorMsg.length != 0 ){
        	myPosition(0,0,2);
        }
}// locationError
 
    var geo_options = {
        enableHighAccuracy: true,
        maximumAge        : 30000,
        timeout           : 27000
    };
    // geo_options
    
// LCC DFS 좌표변환을 위한 기초 자료
    //
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0; // 격자 간격(km)
    var SLAT1 = 30.0; // 투영 위도1(degree)
    var SLAT2 = 60.0; // 투영 위도2(degree)
    var OLON = 126.0; // 기준점 경도(degree)
    var OLAT = 38.0; // 기준점 위도(degree)
    var XO = 43; // 기준점 X좌표(GRID)
    var YO = 136; // 기1준점 Y좌표(GRID)
    //
    // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
    //
function dfs_xy_conv(code, v1, v2) {
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;
 
    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;
 
    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);
    var rs = {};
    if (code == "toXY") {
        rs['lat'] = v1;
        rs['lng'] = v2;
        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        var theta = v2 * DEGRAD - olon;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        rs['nx'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
        rs['ny'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
    }
    else {
        rs['nx'] = v1;
        rs['ny'] = v2;
        var xn = v1 - XO;
        var yn = ro - v2 + YO;
        ra = Math.sqrt(xn * xn + yn * yn);
        if (sn < 0.0) - ra;
        var alat = Math.pow((re * sf / ra), (1.0 / sn));
        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
 
        if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
        }
        else {
            if (Math.abs(yn) <= 0.0) {
                theta = Math.PI * 0.5;
                if (xn < 0.0) - theta;
            }
            else theta = Math.atan2(xn, yn);
        }
        var alon = theta / sn + olon;
        rs['lat'] = alat * RADDEG;
        rs['lng'] = alon * RADDEG;
    }
    return rs;
}
// dfs_xy_conv

