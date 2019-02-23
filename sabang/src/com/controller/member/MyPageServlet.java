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
		
		MemberService service = new MemberService();
		String nextPage=null;
		if(member!=null) {
			nextPage="mypage.jsp";
			String userid = member.getUserid();
			
			MemberDTO x = service.mypageMember(userid);
			String email = x.getEmail();
			String memberPhone = x.getPhone();
			String [] phone = new String[3];
			phone[0] = memberPhone.substring(0, 3);
			phone[1] = memberPhone.substring(3, 7);
			phone[2] = memberPhone.substring(7);
				
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("login", x);
			
			// 에이전트 체크 : 로그인 시 저장
			char agent = 0;
			if(member.getAgent() == 'Y') {
				agent = member.getAgent();
				session.setAttribute("agent", agent);
			}else{
				agent = member.getAgent();
				session.setAttribute("agent", agent);
			}
			
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
