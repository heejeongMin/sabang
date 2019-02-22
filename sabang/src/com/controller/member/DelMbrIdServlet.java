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
@WebServlet("/DelMbrIdServlet")
public class DelMbrIdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String inputpw = request.getParameter("passwd");

		MemberService mService = new MemberService();

		MemberDTO member = (MemberDTO) session.getAttribute("memberInfo");
		AgentDTO agent = (AgentDTO) session.getAttribute("agentInfo");

		String nextPage = null;

		String userid = null;
		String userpw = null;
		
		if (member != null || agent != null) { //멤버 혹은 중개사 로그인 정보가 있다면
			if (member != null) {
				userid = member.getUserid(); // 로그인된 유저의 아이디 가져오기
				userpw = member.getPasswd(); // 로그인된 유저의 비밀번호 가져오기
			} else {
				userid = agent.getAgntid(); // 로그인된 유저의 아이디 가져오기
				userpw = agent.getPasswd(); // 로그인된 유저의 비밀
			}
			
			if (userpw.equals(inputpw)) {
				HttpSession htss = request.getSession();
				htss.invalidate();
				int n = mService.delMbrId(userid);
				nextPage = "delMbrId.jsp";
				request.setAttribute("mesg", "탈퇴되었습니다");
			}
		} else{ //멤버 혹은 중개사 로그인 정보가 없다면
			nextPage = "LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
