package com.controller.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.HouseRcnlistDTO;
import com.dto.HouseWishlistDTO;
import com.dto.MemberDTO;
import com.service.HouseService;

/**
 * Servlet implementation class InterestServlet
 */
@WebServlet("/InterestListServlet")
public class InterestListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 정보 확인
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		
		
		
		// 최근본방 & 찜한방
		String iCategory = request.getParameter("iCategory");
		if(iCategory==null) {
			iCategory = "rcnlist";
		}
		
		HouseService hService = new HouseService();
		
		
		
		String nextPage=null;
		List<String> hCodeList = new ArrayList<>();
		if(member!=null) {
			nextPage="interestList.jsp";
			String userid = member.getUserid();
			// 최근 본 방
			if(iCategory.equals("rcnlist")) {
				List<HouseRcnlistDTO> rcnList = hService.selectRcnlist(userid);
				for(HouseRcnlistDTO rcnDto : rcnList) {
					if(rcnDto.getUserid().equals(userid)) {
						hCodeList.add(rcnDto.getHcode());
					}
				}
				List<HashMap<String, Object>> houseInfoList = hService.rcnHouseInfo(hCodeList);
				request.setAttribute("houseInfoRcnList", houseInfoList);
			
			// 찜리스트
			}else if(iCategory.equals("wishlist")) {
				List<HouseWishlistDTO> wishList = hService.selectWishlist(userid);
				for(HouseWishlistDTO wishDto : wishList) {
					if(wishDto.getUserid().equals(userid)) {
						hCodeList.add(wishDto.getHcode());
					}
				}
				List<HashMap<String, Object>> houseInfoList = hService.rcnHouseInfo(hCodeList);
				request.setAttribute("houseInfoWishList", houseInfoList);
			}
		}else {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
