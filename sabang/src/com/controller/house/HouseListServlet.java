package com.controller.house;

import java.io.IOException;
import java.io.PrintWriter;
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
		String search = request.getParameter("search");
		String curPage = request.getParameter("curPage");
		if(curPage == null) curPage = "1";
		HouseService service = new HouseService();
		HashMap<String, Object> pagingMap = null;
		
		if(search!=null || curPage!=null) {
			pagingMap = service.searchList(search, Integer.parseInt(curPage));
			request.setAttribute("search", search);
			request.setAttribute("pagingMap", pagingMap);
		}
		System.out.println(2%3);
		System.out.println(3%3);
		System.out.println(5%3);
		
		RequestDispatcher dis = request.getRequestDispatcher("houseList.jsp");
		dis.forward(request, response);
		
//		request.setAttribute("list", list);
		
	}//end doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
