package com.controller.house;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseManagingServlet")
public class HouseManagingServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseManagingServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HouseService service = new HouseService();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String htype = request.getParameter("htype");
		
		// panel에 리스트뽑기
		if(member == null) {
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect("LoginUIServlet");
		} else {
			if(member.getAgent()=='Y') {//멤버가 에이전트이면 panel에 매물리스트
				session.setAttribute("houseByAgent", service.houseByAgent(member.getUserid()));
				response.sendRedirect("houseAgent.jsp");
			}//end if	
		}//end if~else
		
		
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
