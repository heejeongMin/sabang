package com.controller.house;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.localWeather.Coord;
import com.localWeather.CoordFetcher;
import com.localWeather.TimeFetcher;

@WebServlet("/WeatherServlet")
public class WeatherServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coordX = request.getParameter("nx");
		String coordY = request.getParameter("ny");
//		System.out.println(coordX + "\t" + coordY);
		
		//요청 일자, 시간 만들기
		TimeFetcher test = new TimeFetcher();
		Calendar c1 = Calendar.getInstance();
		Calendar c = test.getBaseTime();
//		System.out.println("c:" + c.get(Calendar.HOUR_OF_DAY));
//		System.out.println("c1:" + c1.get(Calendar.HOUR_OF_DAY));
		for (int i = 0; i<10; i++) {
		}
		
//		System.out.println("c" + c);
//		System.out.println("그냥" + Calendar.HOUR_OF_DAY);
		String m = (c.MONTH<10)? "0"+c.MONTH :String.valueOf(c.MONTH);
		String base_date = String.valueOf(c.getWeekYear())+m+c.get(Calendar.DATE);
		String base_time = String.valueOf(c.HOUR_OF_DAY)+"00";
//		System.out.println(base_time);
		
		//요청 동네의 좌표 만들기
		String[] asLocation = new String[]{"서울특별시", "서초구", "반포1동"};  
		String x = null;
		String y = null;
		if(coordX==null || coordY == null) {
			CoordFetcher cf = new CoordFetcher();
			Coord coord = cf.fetchCoord(asLocation);
			x = coord.getSx();
			y = coord.getSy();
		}
		
		//요청 URL 만들기
		 String reqURL ;
		 reqURL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?";
		 reqURL += "ServiceKey=VD5ItN1ersyBmcioWetkmK%2B4gwxiWRfmz4XKtGg%2FntXHP4CtGSLuAkL4VDjr8rPJEy1S6eYO0BdsVK8C%2FeqL0A%3D%3D";
		 reqURL += "&base_date="+base_date;
		 reqURL += "&base_time="+base_time;
		 if (coordX==null||coordY==null) {
			 reqURL += "&nx="+x+"&ny="+y;
		 } else {
			 reqURL += "&nx="+coordX+"&ny="+coordY;
		 }
		 reqURL += "&_type=json";
//		 System.out.println(reqURL);
		 //내가 만든 String을 url로 만들기
		 URL url = new URL(reqURL);
		 BufferedReader bf; 
		 String line = "";
		 String result = "";
		 
		 //날씨 정보 받아오기
		 bf = new BufferedReader(new InputStreamReader(url.openStream()));
		 
		 //버퍼에 있는 정보를 하나의 문자열로 변환
		 while ((line=bf.readLine())!=null) {
			 result=result.concat(line);
//			 System.out.println(result); //읽은 데이터 출력
		 }
		 
		 //읽어온 문자열 데이터를 객체화
		 JSONParser parser = new JSONParser();
		HashMap<String, String> map = new HashMap<>();
		String weatherResult = "";
		 try {
			JSONObject obj = (JSONObject) parser.parse(result);
			// response부분 가져오기
			JSONObject parse_response = (JSONObject) obj.get("response");
			// body 가져오기
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			// items 가져오기
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			// item 가져오기
			JSONArray parse_item = (JSONArray) parse_items.get("item");
			for(int i = 0; i<parse_item.size(); i++) {
				JSONObject weather = (JSONObject) parse_item.get(i);
				String category = (String) weather.get("category");
				switch (category) {
				case "POP" : 
					weatherResult = "{\"POP\":"+ weather.get("fcstValue") + ",";
					map.put("POP", String.valueOf(weather.get("fcstValue")));
					break;
				case "TMX" :
					weatherResult += "\"TMX\":"+(int)((double)weather.get("fcstValue"))+"}";
//					map.put("TMX", String.valueOf());
				}
			}//end for
			
		 } catch (ParseException e) {
			e.printStackTrace();
		}//end try~catch
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out = response.getWriter();
		 out.print(weatherResult);
				 
//		 request.setAttribute("map", map);
//		 RequestDispatcher dis = request.getRequestDispatcher("showWeather.jsp");
//		 dis.forward(request, response);
//		 
		// 응답데이터 :  전체 데이터를 json object로 받고, 이 object 아래 body라는 object 아래 items 라는 object 아래 item이라는 array 아래 object들에 접근
		// baseDate : 발표시각의 날짜
//			baseTime : 발표시각의 시분
//			category : 데이터 종류
//			fcstDate : 예보시각의 날짜
//			fcstTime : 예보시각의 시분
//			fcstValue : 예보 값
//			nx, ny : 기상청 지역코드	
		// 항목값	항목명			단위	Missing
		// POP		강수확률		%		-1 % ----- 20%
		// T3H 		3시간 기온 		℃ 		-50 ℃  ----
		// TMN 		아침 최저기온 	℃ 		-50 ℃  ----
		// TMX 		낮 최고기온		℃ 		-50 ℃   ---- 5 도
		
	}//end doGet

}
