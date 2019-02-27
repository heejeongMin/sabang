package com.controller.house;

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

import com.dto.HouseInfoDTO;
import com.dto.HouseOptionDTO;
import com.dto.HousePriceDTO;
import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseUIControleServlet")
public class HouseUIControleServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseUIControleServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO agent = (MemberDTO)session.getAttribute("login");	
		String work = (String) request.getParameter("work");
		String hcode = request.getParameter("hcode");
		
		String nextPage="";
		
		if(agent == null) {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		} else if (work != null) {
			nextPage = "houseAgent.jsp";
			request.setAttribute("work", work);
		} else if (hcode != null) {
			nextPage="houseAgent.jsp";
			HouseService service = new HouseService();
			HouseInfoDTO infoDTO = service.houseRetrieve(hcode);
			HousePriceDTO priceDTO = service.housePrice(hcode);
			HouseOptionDTO optionDTO = service.houseOption(hcode);
			
			session.setAttribute("infoDTO", infoDTO);
			session.setAttribute("priceDTO", priceDTO);
			session.setAttribute("optionDTO", optionDTO);
			request.setAttribute("work", "update");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
