package com.controller.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.BoardDTO;
import com.dto.HouseInfoDTO;
import com.dto.HouseOptionDTO;
import com.dto.HousePriceDTO;
import com.dto.MemberDTO;
import com.service.BoardService;
import com.service.HouseService;
import com.service.MemberService;


@WebServlet("/HouseDetailInfoServlet")
public class HouseDetailInfoServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseDetailInfoServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		
		String hcode = request.getParameter("hcode");
		
		HouseService hService = new HouseService();	
		BoardService bService = new BoardService();
		MemberService mService = new MemberService();
		
		HouseInfoDTO info = hService.houseRetrieve(hcode);
		HousePriceDTO price = hService.housePrice(hcode);
		HouseOptionDTO option = hService.houseOption(hcode);
		List<BoardDTO> board = bService.boardList(hcode);
		
		String agntid = info.getAgntid();
		MemberDTO agentInfo = mService.mypageMember(agntid);
		String nextPage = null;
		
		
		
		// session 만료 검사
		if(member == null) { 
			nextPage = "LoginUIServlet";	
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}else {
			session.setAttribute("price", price);
			session.setAttribute("option", option);
			session.setAttribute("info", info);
			session.setAttribute("agentInfo", agentInfo);
			session.setAttribute("board", board);
			
			ArrayList<String> list = new ArrayList<String>();
			if (option.getBltin() == 'Y') {
				list.add("bltin");
			}
			if (option.getElev() == 'Y') {
				list.add("elev");
			}
			if (option.getPet() == 'Y') {
				list.add("pet");
			}
			if (option.getLoan() == 'Y') {
				list.add("loan");
			}
			if (option.getPark() == 'Y') {
				list.add("park");
			}
			if (option.getMdate() == 'Y') {
				list.add("mdate");
			}
			if (option.getEtc() != null) {
				list.add("etc");
			}
			
		/*	for (int i = 0; i < 4; i++) {
				list.add(i);*/
			session.setAttribute("list", list);	
		//	} // house option 3행을 기준으로 나누기 위한 iterable 객체 생성
			System.out.println(list.size());
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));
			System.out.println(list.get(3));
			nextPage = "houseDetailInfo.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
