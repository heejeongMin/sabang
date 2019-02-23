package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AgentDTO;
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
		HashMap<String, String> map = new HashMap<>();
		
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		
		String nextPage=null;
		if(member!=null) {
			String memberid = member.getUserid();
				map.put("userid", memberid);
				map.put("passwd", passwd);
				
				if(member.getPasswd().equals(passwd)) {
					member = service.myPageCheckMember(map);
				}
			
			String mesg = "비밀번호 불일치";
			if(member != null) {
				if(member.getPasswd().equals(passwd)) {
					mesg = "비밀번호 일치";
				};
			}
			response.setContentType("type/text;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(mesg);
			
		}else {
			nextPage="LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			RequestDispatcher dis = request.getRequestDispatcher(nextPage);
			dis.forward(request, response);
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
