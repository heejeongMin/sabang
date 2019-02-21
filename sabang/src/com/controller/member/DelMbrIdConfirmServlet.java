package com.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.controller.house.HouseListServlet;
import com.dto.AgentDTO;
import com.dto.MemberDTO;

@WebServlet("/DelMbrIdConfirmServlet")
public class DelMbrIdConfirmServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 HttpSession session = request.getSession();
	     MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
	     AgentDTO agent = (AgentDTO)session.getAttribute("agentInfo");
	     
	     String nextPage = null;
	     if(member == null && agent == null) {  // 최상위 조건 체크, 해당 회원 정보 없다면.
				nextPage = "LoginUIServlet";	
				session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			}else {
				nextPage = "../DelMbrIdConfirm.jsp";
			}
	     
	      RequestDispatcher dis =
	    		  request.getRequestDispatcher(nextPage);
	      dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
