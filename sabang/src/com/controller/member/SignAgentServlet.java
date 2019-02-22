package com.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AgentDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/SignAgentServlet")
public class SignAgentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String agntid = request.getParameter("userid");
		String userid = agntid;
		String passwd = request.getParameter("passwd");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String agntssn = ssn1+ '-' +ssn2;
		String agntname = request.getParameter("username");
		String addr = request.getParameter("addr");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String agntphone =  phone1 + phone2 + phone3;
		String phone = agntphone;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String agntemail = email1 + '@' + email2;
		String email = agntemail;
		
		AgentDTO agent = new AgentDTO(agntid, passwd, agntssn, agntname, agntphone, agntemail); 
		// 받은 아이디로 두 개의 쿼리문 작업 수행
		
		MemberService mService = new MemberService();
		
		//  1. id 중복 체크
		int hasUserId = mService.agntIdCheck(userid); 
		System.out.println(hasUserId);
		
		// 2. 가입 이력
		int hasSigned = mService.signedCheck(userid);
		
		if (hasUserId == 0 && hasSigned == 0) {
			int cnt = mService.signAgnt(agent);
			HttpSession session = request.getSession();
			session.setAttribute("mesg", "회원가입성공");
			response.sendRedirect("main.jsp");
		}else if(hasSigned == 1)  { //가입 이력이 있다면
			RequestDispatcher dis = request.getRequestDispatcher("loginForm.jsp");
			dis.forward(request, response);
			request.setAttribute("mesg", "탈퇴한 회원은 24시간 이내에 재가입 할 수 없습니다. 시간 경과후 다시 시도해 주시길 바랍니다.");
			/*
			RequestDispatcher dis = request.getRequestDispatcher("MultipleIdServlet"); 
			//유저의 id 중복 혹은 가입 이력 체크
		    dis.forward(request, response);*/
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
