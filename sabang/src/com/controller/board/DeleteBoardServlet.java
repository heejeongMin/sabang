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

@WebServlet("/DeleteBoardServlet")
public class DeleteBoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pcode = request.getParameter("pcode");
		String ppwd = request.getParameter("ppwd");
		
		HashMap<String,String> list = new HashMap<>();
		
		list.put("pcode",pcode);
		list.put("ppwd",ppwd);
		
		BoardService bService = new BoardService();
		int delBrd = bService.deleteBoard(list);
		
		
		if( delBrd != 1 ) {
			session.setAttribute("mesg", "게시물 비밀번호를 확인해주세요");
			
		}else {
			session.setAttribute("mesg", "삭제되었습니다.");
		}
		
		session.setAttribute("func", "window.close()");
		RequestDispatcher dis = request.getRequestDispatcher("board/houseDetailBoard.jsp");
		dis.forward(request, response);
		
		/*response.sendRedirect("board/houseDetailBoard.jsp");*/
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
