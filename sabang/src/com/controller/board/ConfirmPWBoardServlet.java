package com.controller.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BoardDTO;
import com.service.BoardService;

@WebServlet("/ConfirmPWBoardServlet")
public class ConfirmPWBoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String ppwd = request.getParameter("ppwd");
		String pcode = request.getParameter("pcode");
		
		BoardService bService = new BoardService();
		HashMap<String, BoardDTO> map = new HashMap<>();
		
		
	/*	map.put("ppwd", ppwd);
		map.put("board",)
		
		int delBrd = bService.deleteBoard(ppwd);
		
		
		*/
		
		
		
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
