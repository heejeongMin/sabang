package com.controller.house;

import java.io.IOException;
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
		
		HouseInfoDTO info = hService.HouseRetrieve(hcode);
		HousePriceDTO price = hService.HousePrice(hcode);
		HouseOptionDTO option = hService.HouseOption(hcode);
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
			System.out.println(board);
			nextPage = "houseDetailInfo.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
