package com.controller.house;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.HouseService;

import jdk.nashorn.internal.parser.JSONParser;


@WebServlet("/HouseListServlet")
public class HouseListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filters = request.getParameter("filters"); //필터 버튼들중 가격대 버튼을 제외한 값들
		JSONParser parser = new JSONParser(filters, null, false);
//		JSONObject json = (JSONObject) parser.parse(parser);
		
		
		
		
		//검색어 + 페이징 처리 관련 변수 
		String search = request.getParameter("search");
		String curPage = request.getParameter("curPage");
		if(curPage == null) curPage = "1";
		
		HouseService service = new HouseService();
		HashMap<String, Object> pagingMap = null;
		
		if(search!=null) {//menu.jsp에서 검색어를 입력하고 검색 버튼을 누른 경우
			pagingMap = service.searchList(search, Integer.parseInt(curPage));
			request.setAttribute("search", search);
			request.setAttribute("pagingMap", pagingMap);
			RequestDispatcher dis = request.getRequestDispatcher("houseList.jsp");
			dis.forward(request, response);
		} else {//main.jsp를 통해서 houseOverview.jsp로 처음 넘어오는 경우
			List<HashMap<String, Object>> newList = service.retrieveNewItems();
			List<HashMap<String, Object>> hotList = service.retrieveHotItems();
			request.setAttribute("newList", newList);
			request.setAttribute("hotList", hotList);
			RequestDispatcher dis = request.getRequestDispatcher("houseOverview.jsp");
			dis.forward(request, response);
		}
		
//		request.setAttribute("list", list);
		
	}//end doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
