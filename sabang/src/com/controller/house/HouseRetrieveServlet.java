package com.controller.house;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.AgentDTO;
import com.dto.HouseInfoDTO;
import com.dto.MemberDTO;
import com.dto.HouseRcnlistDTO;
import com.service.HouseService;

/**
 * Servlet implementation class GoodsRetrieveServlet
 */
@WebServlet("/HouseRetrieveServlet")
public class HouseRetrieveServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseRetrieveServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hcode = request.getParameter("hcode");
		
		HouseService service = new HouseService();
		HouseInfoDTO hDto = service.HouseRetrieve(hcode);
		
		
		HttpSession session = request.getSession();	
		MemberDTO member = (MemberDTO)session.getAttribute("memberInfo");
		AgentDTO agent = (AgentDTO)session.getAttribute("agentInfo");	
		if(member!=null) {									
			// session 확인 및 생성
			HashMap<Long, String> history = (HashMap)session.getAttribute("history");
			if(history==null) {
				history = new HashMap<>();
			}
			
			// 사용자가 가지고 있는 최근 상품 정보 가져오기
			List<Long> userRcnList = new ArrayList<>();
			String userid = member.getUserid();
			List<HouseRcnlistDTO> list = service.selectRcnlist(userid);
			if(list.size() != 0) {
				for(HouseRcnlistDTO rcn : list) {
					history.put(rcn.getnum(), rcn.getHcode());
					userRcnList.add(rcn.getnum());
				}
				int n = service.deleteRcnlist(userRcnList);
			}
				
				
			if(history.size()==0) {//없으면 map 새로 생성하고, 값 새로 저장
				history.put(System.currentTimeMillis(), hcode);
				session.setAttribute("history", history);
			}else if(history.size() > 0 && history.size() < 7 ){//map은 있는데 아직 6개 다 안찬경우
				Long[] keys = new Long[history.size()];
				String[] values = new String[history.size()];
				int index=0;
					for(Map.Entry<Long, String> mapEntry : history.entrySet()) {
						keys[index] = mapEntry.getKey();
						values[index] = mapEntry.getValue();
						index++;
					}
				// 동일한 gCode이면 저장되지않고 늦게 저장된 것으로 변경하기
				for(int i=0; i<keys.length; i++) {
					if(history.get(keys[i]).equals(hcode) && System.currentTimeMillis() > keys[i]) {
						history.remove(keys[i]);
					}
				}
				history.put(System.currentTimeMillis(), hcode);
				session.setAttribute("history", history);
				
				Set<Long> keySet = history.keySet();
				if(keySet.size()>6) {
					long oldest = Long.MAX_VALUE;
					for(long key: keySet) { 
						oldest = (oldest < key)? oldest : key;
					}
					history.remove(oldest);
					history.put(System.currentTimeMillis(), hcode);
					session.setAttribute("history", history);
				}
			}
		}
		
		request.setAttribute("HouseRetrieve", hDto);
		RequestDispatcher dis = request.getRequestDispatcher("houseRetrieve.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
