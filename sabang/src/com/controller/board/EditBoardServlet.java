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
		
	/*	String pcode = (String)session.getAttribute("pcode");*/
		
		String pcode = (String)session.getAttribute("pcode");
		String ppwd = (String)session.getAttribute("ppwd");
		
		String confirmPw = request.getParameter("confirmPw").trim();
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		if (ppwd.equals(confirmPw)) {
			BoardService bService = new BoardService();
			BoardDTO edit = new BoardDTO(pcode, title, content);
			int updBrd = bService.updateBoard(edit);
			if (updBrd != 1) {
				session.setAttribute("mesg", "게시물 비밀번호를 확인해주세요.");
			} else {
				session.setAttribute("mesg", "수정되었습니다.");
			}
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
