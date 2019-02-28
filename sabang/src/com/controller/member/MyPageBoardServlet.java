package com.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.HouseRcnlistDTO;
import com.dto.HouseWishlistDTO;
import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class InterestServlet
 */
@WebServlet("/MyPageBoardServlet")
public class MyPageBoardServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 정보 확인
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		
		MemberService mService = new MemberService();
		
		String nextPage=null;
		
		//로그인 여부 검사
		if(member!=null) {
			nextPage="myPageBoard.jsp";
			String userid = member.getUserid();
			
			
			List<HashMap<String,String>> list = mService.myPageBoard(userid);
			
			System.out.println(list);
			
			session.setAttribute("map", list);
			
		}
		else {
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
