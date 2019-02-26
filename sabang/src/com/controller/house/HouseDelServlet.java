package com.controller.house;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseDelServlet")
public class HouseDelServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HouseService service = new HouseService();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String[] delList = request.getParameterValues("check");
		
		
		// panel에 리스트뽑기
		if(member == null) {
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect("LoginUIServlet");
		} else {
			List<String> list = Arrays.asList(delList);
			int n = service.houseDel(list);
			String deleteMsg = (n>0)? "성공적으로 삭제되었습니다. 다음 매물을 기다릴게요~":"삭제 실패하였습니다. 관리자에게 문의해주세요.";
			session.setAttribute("deleteMsg", deleteMsg);
			response.sendRedirect("HouseManagingServlet");
		}//end if~else
		
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
