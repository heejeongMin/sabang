package com.controller.house;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AgentDTO;
import com.dto.HouseInfoDTO;
import com.dto.HouseRcnlistDTO;
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
		AgentDTO agent = (AgentDTO)session.getAttribute("agentInfo");
		
		
		
		// 최근본방 & 찜한방
		String iCategory = request.getParameter("iCategory");
		if(iCategory==null) {
			iCategory = "rcnlist";
		}
		
		HouseService hService = new HouseService();
		
		
		
		String nextPage=null;
		if(member!=null) {
			nextPage="interestList.jsp";
			
			
			
		}else if(agent!=null) {
			nextPage="interestList.jsp";
			String agentid = agent.getAgntid();
			System.out.println("agentid"+agentid);
			// 최근 본 방
			if(iCategory.equals("rcnlist")) {
				List<HouseRcnlistDTO> rcnList = hService.selectRcnlist(agentid);
				List<String> hCodeList = null;
				for(int i=0 ; i<rcnList.size() ; i++) {
					for(HouseRcnlistDTO rcnDto : rcnList) {
						if(rcnDto.getUserid().equals(agentid)) {
							System.out.println("agenthCode"+rcnDto.getHcode());
							Arrays.asList(rcnDto.getHcode());
						}
					}
				}
				List<HouseInfoDTO> houseInfoList = hService.rcnHouseInfo(hCodeList);
				request.setAttribute("houseInfoList", houseInfoList);
			// 찜리스트
			}else if(iCategory.equals("wishlist")) {
							
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
