package com.controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/SignMbrServlet")
public class SignMbrServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
			
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String ssn = ssn1 + '-' + ssn2;
		String post = request.getParameter("post");
		String addr = request.getParameter("addr");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + phone2 + phone3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + '@' + email2;
	
		char agent = (char)session.getAttribute("agent");
		
		MemberDTO member = new MemberDTO(userid, passwd, ssn, username, post, addr, phone, email,agent);
		
		
		MemberService service = new MemberService();
		// 받은 아이디로 두 개의 쿼리문 작업 수행
		
		//  1. id 중복 체크
		int hasUserId = service.idCheck(userid); 
		
		// 2. 가입 이력 검사
		int hasSigned = service.signedCheck(userid);
		
		if (hasUserId == 0 && hasSigned == 0) {
			service.signMbr(member);
			session.setAttribute("mesg", "사방팔방 곳곳의 방에 오신 것을 환영합니다");
			response.sendRedirect("main.jsp");
		}else if(hasSigned == 1)  { //가입 이력이 있다면
			// 탈퇴 + 24시간 출력, sql상에서 날짜포맷 변환을 위한 TO_CHAR 작업으로 mapper에서 parameterType을 String으로 주었으므로 형변환 작업이 수반된다
			int outDate = Integer.parseInt(service.overDay(userid));
			// 현재시간을 구하기 위한 Date 객체
			Date date = new Date();
			// 시간 포맷 지정하는 SimpleDateFormat 객체 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
			// 현재 시간을 simpledateformat으로 구한 시간 포맷으로 변환, integer형으로 형변환한다. 
			int curDate = Integer.parseInt(sdf.format(date));
			System.out.println(outDate);
			System.out.println(curDate );
			if(curDate > outDate ) {
				
				service.signMbr(member);
				session.setAttribute("mesg", "다시 돌아와 주었군요! 재가입을 환영합니다.");
				response.sendRedirect("main.jsp");
			} else {
				session.setAttribute("mesg", "탈퇴한 회원은 24시간 이내에 재가입 할 수 없습니다. 시간 경과후 다시 시도해 주시길 바랍니다.");
				response.sendRedirect("loginForm.jsp");
			} 
		} // end hasSigned == 1 
	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
