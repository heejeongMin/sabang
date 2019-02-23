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
import com.dto.MemberDTO;
import com.service.MemberService;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		AgentDTO agent = (AgentDTO)session.getAttribute("agentInfo");
		
		MemberService service = new MemberService();
		String nextPage=null;
		if(member!=null) {
			nextPage="mypage.jsp";
			String userid = member.getUserid();
			
			MemberDTO x = service.mypageMember(userid);
			String memberEmail = x.getEmail();
			String [] email = memberEmail.split("@");
			String memberPhone = x.getPhone();
			String [] phone = new String[3];
			phone[0] = memberPhone.substring(0, 3);
			phone[1] = memberPhone.substring(3, 7);
			phone[2] = memberPhone.substring(7);
				
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("login", x);
		}else if(agent!=null) {
			nextPage="mypage.jsp";
			String userid = agent.getAgntid();
			AgentDTO x = service.mypageAgent(userid);
			
			String memberEmail = x.getAgntemail();
			String [] email = memberEmail.split("@");
			String memberPhone = x.getAgntphone();
			String [] phone = new String[3];
			phone[0] = memberPhone.substring(0, 3);
			phone[1] = memberPhone.substring(3, 7);
			phone[2] = memberPhone.substring(7);
				
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("login", x);
		}else {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
