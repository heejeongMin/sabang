package com.controller.member;

import java.io.IOException;

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
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		String nextPage=null;
		if(member!=null) {
			String userid = member.getUserid();
			String passwd = request.getParameter("pwdCheck");
			if(passwd==null || passwd.isEmpty()) {
				passwd = member.getPasswd();
			}
			String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
			if(phone.equals("nullnullnull")) {
				phone = member.getPhone();
			}
			MemberDTO updateMDto = new MemberDTO(userid, passwd, phone);
			
			
			MemberService service = new MemberService();
			int num = service.MemberUpdate(updateMDto);
			
			nextPage="MyPageServlet";
			session.setAttribute("mesg", "성공적으로 업데이트 되었습니다.");
			
			response.sendRedirect(nextPage);
		}else {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect(nextPage);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
