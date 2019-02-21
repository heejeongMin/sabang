package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberIdCheckServlet
 */
@WebServlet("/MemberPwdCheckServlet")
public class MemberPwdCheckServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passwd = request.getParameter("passwd");
		MemberService service = new MemberService();
		
		MemberDTO member = service.checkMbrPw(passwd);
		String mesg = "비밀번호 불일치";
		if(member != null) {
			if(member.getPasswd().equals(passwd)) {
				mesg = "비밀번호 일치";
			};
		};
		
		response.setContentType("type/text;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(mesg);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
