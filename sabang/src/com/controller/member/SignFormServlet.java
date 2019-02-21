package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class SignFormServlet
 */
@WebServlet("/SignFormServlet")
public class SignFormServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member = "member";
		String agent = "agent";
		
		String page = request.getParameter("page");
		
	/*	request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset = utf-8 ");
		
		PrintWriter out = response.getWriter();
		out.print(page);
		System.out.println(page);*/
		
		String nextPage = null;
		if (page.equals("member")) {
			 nextPage = "member/signMbrForm.jsp";
		}else {
			 nextPage = "member/signAgntForm.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
