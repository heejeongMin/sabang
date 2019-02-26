package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/NaverSignin")
public class NaverSignin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uniqId = request.getParameter("uniqId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println(uniqId);
		
		MemberService service = new MemberService();
		MemberDTO memberInfo = new MemberDTO();
		HashMap<String, String> naverMap = new HashMap<>();
		naverMap.put("uniqId", uniqId);
		naverMap.put("name", name);
		naverMap.put("email", email);
		
		int n = service.naverUser(naverMap);
		memberInfo = service.getNaverUser(uniqId);
		
		session.setAttribute("memberInfo", memberInfo);
		PrintWriter out = response.getWriter();
		out.print(memberInfo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
