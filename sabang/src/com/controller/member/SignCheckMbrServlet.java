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
import com.service.MemberService;

/**
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/SignCheckMbrServlet")
public class SignCheckMbrServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.sendRedirect("signCheckMbrForm.jsp");
		
		
		/*String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		MemberDTO dto =
		new MemberDTO(userid, passwd, username, post, addr1, addr2, phone1, phone2, phone3, email1, email2);
		MemberService service = new MemberService();
		
		
		// 받은 아이디로 두 개의 쿼리문 작업 수행
		
		//  1. id 중복 체크
		int hasUserId = service.idCheck(userid); 
		
		// 2. 가입 이력
		int hasSigned = service.hasSigned(userid);
		
		if (hasUserId == 0 && hasSigned == 0) {
			int n = service.memberAdd(dto);
			HttpSession session = request.getSession();
			session.setAttribute("memberAdd", "회원가입성공");
			session.setMaxInactiveInterval(5);
			response.sendRedirect("main");
		}else if(hasSigned == 1)  { //가입 이력이 있다면
			RequestDispatcher dis = request.getRequestDispatcher("loginForm.jsp");
			dis.forward(request, response);
			request.setAttribute("mesg", "탈퇴한 회원은 24시간 이내에 재가입 할 수 없습니다. 시간 경과후 다시 시도해 주시길 바랍니다.");
			
			RequestDispatcher dis = request.getRequestDispatcher("MultipleIdServlet"); 
			//유저의 id 중복 혹은 가입 이력 체크
		    dis.forward(request, response);
		}
	}*/
	
	/*	MemberService service = new MemberService();
		int n = service.memberAdd(dto);
		HttpSession session = request.getSession();
		session.setAttribute("memberAdd", "회원가입성공");
		session.setMaxInactiveInterval(5);
		response.sendRedirect("main");
	}*/
	
	
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
