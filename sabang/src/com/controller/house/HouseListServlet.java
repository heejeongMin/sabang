package com.controller.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.HouseService;

@WebServlet("/HouseListServlet")
public class HouseListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");//검색어
		String curPage = request.getParameter("curPage");//사용자가 누른 현재페이지 번호
		String filters = request.getParameter("filters"); //필터 버튼들중 가격대 버튼을 제외한 값들
		HouseService service = new HouseService();
		HashMap<String, Object> pagingMap;
		List<String> list = new ArrayList<>(); 
		if(curPage == null) curPage = "1"; //curPage 초기값 1
		
		if(search!=null) {//menu.jsp에서 검색어를 입력하고 검색 버튼을 누른 경우
			pagingMap = service.searchList(search, Integer.parseInt(curPage));
			request.setAttribute("search", search);
			request.setAttribute("pagingMap", pagingMap);
			RequestDispatcher dis = request.getRequestDispatcher("houseList.jsp");
			dis.forward(request, response);
		} else if(filters != null) {//필터 버튼들 중 가격대를 제외한 버튼을 누른 경우
			String[] filterArray = filters.split(","); //
			String[] inOperator = {"o", "t", "f", "p", "mrent", "yrent"};
			
			for(int i = 0; i < filterArray.length; i++) {//1. 사용자가 체크한 값을 받아서 그 길이만큼 돈다.
				for(int n = 0; n<inOperator.length; n++) {//2. in 연산자 값에 들어갈 수 있는 가능 값 수 만큼 돈다.
					if(!(filterArray[i].equals(inOperator[n]))) {// 사용자 값이랑 inOperator에 있는 값이랑 같지않으면
						if(list.size() == n) {//list사이즈와 현재 n이 동일하면 추가
							list.add(n, "null");
						} else {//list가 더 작으면 그 안에 이미 값이 있으니까 set으로 수정해준다. 
							if(list.get(n).equals("null")) list.set(n, null);
						}//end if~else
					} else {// 사용자 값이랑 inOperator에 있는 값이랑 일치하면
						list.add(n, filterArray[i]);
						break;
					}//end if~else
				}//end inOperator for
			}// end for
			if(list.size() < inOperator.length) { // in 연산자에서 쓰기위해서 모자라는 값은 null을 넣어서 길이를 고정
				for(int i = list.size(); i < inOperator.length; i++) {
					list.add(i, "null");
				}
			}//end if
			
//			pagingMap = service.listByFilter(list, Integer.parseInt(curPage));
//			request.setAttribute("search", search);
//			request.setAttribute("pagingMap", pagingMap);
			RequestDispatcher dis = request.getRequestDispatcher("houseList.jsp");
			dis.forward(request, response);
			
		}else {//main.jsp를 통해서 houseOverview.jsp로 처음 넘어오는 경우
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
