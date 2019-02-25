package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class SignFormServlet
 */
@WebServlet("/SignFormServlet")
public class SignFormServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		char agent = request.getParameter("page").charAt(0);
		
		session.setAttribute("agent", agent);
		
		System.out.println("SignFormServlet    agent is~~~~~" + agent); 
		
/*		String nextPage = null;
		if (page.equals("member")) {
			 nextPage = "member/signMbrForm.jsp";
		}else {
			 nextPage = "member/signAgntForm.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(member/signMbrForm.jsp);
		dis.forward(request, response);
		
		*/
		
		RequestDispatcher dis = request.getRequestDispatcher("member/signMbrForm.jsp");
		dis.forward(request, response);
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
