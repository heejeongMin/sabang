package com.controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.MemberService;

/**
 * Servlet implementation class MemberUIServlet
 */
@WebServlet("/MultipleIdServlet")
public class MultipleIdServlet extends HttpServlet {


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//Calendar cal = Calendar.getInstance( ); 
		
	/*	String userid = request.getParameter("userid");
		MemberService service = new MemberService();
		
		int hasUserId = service.idCheck(userid); // id 중복 check
		int hasSigned = service.hasSigned(userid); // 가입 이력 check
		
		int overDay = Integer.parseInt(service.overDay(userid)); // 탈퇴한 시간+24, 가입 시도 시간 출력
		//int curHour = cal.get(Calendar.HOUR_OF_DAY);
		
		//System.out.println(curHour);
		
		if (hasSigned == 1) { //가입 이력이 있다면
		//	if ( < afterDay )	{
				
	//		}
			RequestDispatcher dis = request.getRequestDispatcher("loginForm.jsp");
			dis.forward(request, response);
			request.setAttribute("mesg", "탈퇴한 회원은 24시간 이내에 재가입 할 수 없습니다. 시간 경과후 다시 시도해 주시길 바랍니다.");
			
		}*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
