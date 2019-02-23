package com.controller.house;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AgentDTO;
import com.service.HouseService;

@WebServlet("/houseUIControleServlet")
public class houseUIControleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		AgentDTO agent = (AgentDTO)session.getAttribute("agentInfo");	
		String work = (String) request.getParameter("work");
		
		String nextPage="";
		
		if(agent == null) {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		} else {
			System.out.println(work.equals("regisger"));
			nextPage = (work.equals("regisger"))? "houseRegister.jsp" : "houseUpdate.jsp";
			request.setAttribute("work", "register");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}