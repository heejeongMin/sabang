package com.controller.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.service.HouseService;


@WebServlet("/HouseListServlet")
public class HouseListServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseListServlet.class);
	
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
			HashMap<String, List<String>> queryMap = new HashMap<>(); //htype과 rtype을 따로 담아서 보내기. 
			List<String> htype = new ArrayList<>();
			List<String> rtype = new ArrayList<>();
			List<String> maintc = new ArrayList<>();
			List<String> mrent = new ArrayList<>();
			List<String> yrent = new ArrayList<>();
			
			String[] filterArray = filters.split(","); //
			String[] inOperator = {"o", "t", "f", "p", "월세", "전세"};
			
			for(int i = 0; i < filterArray.length; i++) {//1. 사용자가 체크한 값을 받아서 그 길이만큼 돈다.
				for(int n = 0; n<inOperator.length; n++) {//2. in 연산자 값에 들어갈 수 있는 가능 값 수 만큼 돈다.
					if(filterArray[i].startsWith("yrent")) {//보증금/전세가 범위
						if(yrent.size() == 0) {
							yrent.add(filterArray[i].substring(5));
						} else {
							continue;
						}// end if~else yrent.size
					} else if(filterArray[i].startsWith("mrent")) {// 월세 범위
						if(mrent.size() == 0) {
							String[] mRange = filterArray[i].substring(5).split("~");
							mrent.add(mRange[0]);
							mrent.add(mRange[1]);
						} else {
							continue;
						}//end if~else mrent.size
					} else if (filterArray[i].startsWith("maintc")) {//filterArray[i]가 maintc로 시작하면 따로 리스트에 저장
						if(!(filterArray[i].substring(6).equals("0")) && maintc.size()==0) {
							maintc.add(filterArray[i].substring(6));
						}//end if~else maintc 숫자 가져오기
					} else if(!(filterArray[i].equals(inOperator[n]))) {// 사용자 값이랑 inOperator에 있는 값이랑 같지않으면
						if(list.size() == n) {//list사이즈와 현재 n이 동일하면 추가
							list.add(n, "na");
						} else {//list가 더 작으면 그 안에 이미 값이 있으니까 set으로 수정해준다. 
							if(list.get(n).equals("na")) list.set(n, "na");
						}//end if~else
					} else {// 사용자 값이랑 inOperator에 있는 값이랑 일치하면
						list.add(n, filterArray[i]);
						break;
					}//end if~else
				}//end inOperator for
			}// end for
			if(list.size() < inOperator.length) { // in 연산자에서 쓰기위해서 모자라는 값은 null을 넣어서 길이를 고정
				for(int i = list.size(); i < inOperator.length; i++) {
					list.add(i, "na");
				}
			}//end if
			
			for(int i = 0; i < list.size(); i++) {
				if (i<4) {
					if(list.get(i) != "na") htype.add(list.get(i));
				} else {
					if(list.get(i) != "na")	rtype.add(list.get(i));
				}
			}//end for
			
			queryMap.put("htype", htype);
			queryMap.put("rtype", rtype);
			queryMap.put("maintc", maintc);
			queryMap.put("mrent", mrent);
			queryMap.put("yrent", yrent);
			
			pagingMap = service.listByFilter(queryMap, Integer.parseInt(curPage));
			request.setAttribute("filters", filters);
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
