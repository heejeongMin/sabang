package com.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.WdMbrDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/SignMbrServlet")
public class SignMbrServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
			
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String ssn = ssn1 + '-' + ssn2;
		String post = request.getParameter("post");
		String addr = request.getParameter("addr");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + phone2 + phone3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + '@' + email2;
	
		char agent = (char) session.getAttribute("agent");
		
		MemberDTO member = new MemberDTO(userid, passwd, ssn, username, post, addr, phone, email,agent);
		
		System.out.println("* * * * SignMbrServlet  :  agent is     " + agent); 
		
		
		MemberService service = new MemberService();
		// 받은 아이디로 두 개의 쿼리문 작업 수행
		
		//  1. id 중복 체크
		int hasUserId = service.idCheck(userid); 
		
		// 2. 가입 이력
		int hasSigned = service.signedCheck(userid);
		
		if (hasUserId == 0 && hasSigned == 0) {
			int n = service.signMbr(member);
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
