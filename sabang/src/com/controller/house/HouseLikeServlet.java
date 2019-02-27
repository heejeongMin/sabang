package com.controller.house;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.HouseWishlistDTO;
import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseLikeServlet")
public class HouseLikeServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseLikeServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HouseService service = new HouseService();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		String hcode = request.getParameter("hcode");
		
		if(member == null) {
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect("LoginUIServlet");
		} else {// wishlist 테이블과 house_info에 접근
			HouseWishlistDTO dto = new HouseWishlistDTO(member.getUserid(), hcode);
			int n = service.updateCntWish(dto);
			PrintWriter out = response.getWriter();
			out.print(n);
		}//end if~else
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}//doPost

}
