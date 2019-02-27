package com.controller.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BoardDTO;
import com.service.BoardService;

@WebServlet("/EditBoardServlet")
public class EditBoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pcode = (String)session.getAttribute("pcode");
		
	/*	String pcode = request.getParameter("pcode");*/
		String ppwd = request.getParameter("ppwd");
		
		System.out.println(pcode);
		System.out.println(ppwd);
		
		String confirmPw = request.getParameter("confirmPw");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		if (ppwd != confirmPw ) {
			session.setAttribute("mesg", "게시물 비밀번호를 확인해주세요.");
		}else {
			BoardDTO edit = new BoardDTO();
			edit.setContent(content);
			edit.setTitle(title);
			edit.setPcode(pcode);
			BoardService bService = new BoardService();
			int updBrd = bService.updateBoard(edit);
			session.setAttribute("mesg", "수정되었습니다.");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("board/houseDetailBoard.jsp");
		dis.forward(request, response);
		
		/*response.sendRedirect("board/houseDetailBoard.jsp");*/
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
