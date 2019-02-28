package com.controller.board;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.BoardService;

@WebServlet("/PostBoardServlet")
public class PostBoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("pcode", request.getParameter("pcode"));
		session.setAttribute("ppwd", request.getParameter("ppwd"));
		
		RequestDispatcher dis = request.getRequestDispatcher("board/postBoard.jsp");
		dis.forward(request, response);
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
