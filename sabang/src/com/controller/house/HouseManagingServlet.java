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
import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseManagingServlet")
public class HouseManagingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		
		String nextPage = null;
		if(member == null) {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		} else {
			System.out.println(member.getAgent() == 'Y');
			if(member.getAgent()=='Y') {//멤버가 에이전트이면
				nextPage = "houseAgent.jsp";
				HouseService service = new HouseService();
				request.setAttribute("houseByAgent", service.houseByAgent(member.getUserid()));
			}
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
		
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
