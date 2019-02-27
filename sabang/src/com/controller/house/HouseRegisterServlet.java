package com.controller.house;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.HouseInfoDTO;
import com.dto.HouseOptionDTO;
import com.dto.HousePriceDTO;
import com.dto.MemberDTO;
import com.service.HouseService;

@WebServlet("/HouseRegisterServlet")
public class HouseRegisterServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(HouseRegisterServlet.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HouseService service = new HouseService();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String htype = request.getParameter("htype");
		
		if(member == null) {
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect("LoginUIServlet");
		} else if(htype!=null) {//htype이 null이 아닐때는 register
			String lastCode = service.getLastCode(htype);
			PrintWriter out = response.getWriter();
			out.print(lastCode.substring(1));
		} else {
		
		
		//>>>>>>>>>>>>>>>>>>>>>>>>>> 파일 업로드
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
	
		HouseInfoDTO infoDTO = new HouseInfoDTO();
		HousePriceDTO priceDTO = new HousePriceDTO();
		HouseOptionDTO optionDTO = new HouseOptionDTO();
		
		FileItem item = null; 
		String fileName = null;
		int n = 0;
		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {
			    item = iter.next();
			    if (item.isFormField()) {// 일반 텍스트 가져오기
			    	switch (item.getFieldName()) {
			    	case "htype" : infoDTO.setHtype(item.getString("utf-8")); break;
			    	case "hcode": infoDTO.setHcode(item.getString("utf-8")); 
			    				  priceDTO.setHcode(item.getString("utf-8"));
			    				  optionDTO.setHcode(item.getString("utf-8"));
			    				  break;
			    	case "rtype" : infoDTO.setRtype(item.getString("utf-8")); break;
			    	case "hname" : infoDTO.setHname(item.getString("utf-8")); break;
			    	case "hetc" : infoDTO.setHetc(item.getString("utf-8")); break;
			    	case "area" : infoDTO.setArea(item.getString("utf-8")); break;
			    	case "flr" : infoDTO.setFlr(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "whflr" : infoDTO.setWhlflr(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "room" : infoDTO.setRoom(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "batr" : infoDTO.setBatr(item.getString("utf-8")); break;
			    	case "addr" : infoDTO.setAddr(item.getString("utf-8")); break;
			    	case "deposit" : priceDTO.setDeposit(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "mrent" : priceDTO.setMrent(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "yrent" : priceDTO.setYrent(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "maintc" : priceDTO.setMaintc(Integer.parseInt(item.getString("utf-8"))); break;
			    	case "parkf" : priceDTO.setParkf(Double.parseDouble(item.getString("utf-8"))); break;
			    	case "options" :
			    		switch (item.getString("utf-8")) {
			    		case "BLTIN" : optionDTO.setBltin('Y'); break;
			    		case "ELEV" : optionDTO.setElev('Y'); break;
			    		case "PET" : optionDTO.setPet('Y'); break;
			    		case "VRD" : optionDTO.setVrd('Y'); break;
			    		case "LOAN" : optionDTO.setLoan('Y'); break;
			    		case "PARK" : optionDTO.setPark('Y'); break;
			    		case "MDATE" : optionDTO.setMdate('Y'); break;
			    		}
			     	case "etc" : optionDTO.setEtc(item.getString("utf-8")); break;
			    	}
			    } else { // System.currentTimeMills() 사용으로 DB에 gimage 데이터타입을 varchar2(20)에서 varchar2(80)으로 변경
			    	if(item.getName().length() != 0) {
			    		String[] fileNames = item.getName().split("\\.");
			    		fileName = fileNames[0] + System.currentTimeMillis() + "." + fileNames[1];
			    		infoDTO.setHimage(fileName);
				    	File f = new File("C:\\Projects\\sabang\\masterGit\\sabang\\WebContent\\images", fileName);
//				    	File f = new File("C:\\gitTest3\\sabang\\sabang\\WebContent\\images", fileName);
				    	item.write(f);
			    	}
			    }
			}
			//Image 업로드

	    	HashMap<String, Object> registerMap = new HashMap<>();
	    	infoDTO.setAgntid(member.getUserid());//session에 잇는 에이전트의 유저 아이디도 가져온다. 
	    	System.out.println(infoDTO);
	    	registerMap.put("info", infoDTO);
	    	registerMap.put("price", priceDTO);
	    	registerMap.put("option", optionDTO);
	    	
	    //	DB에 저장
	    	n = service.houseRegister(registerMap);
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			String registerMsg = (n==1)? "매물등록에 성공하였습니다. Happy Sabang~" : "매물등록에 실패하였습니다. 관리자에게 문의해주세요.";
			session.setAttribute("registerMsg", registerMsg);
			response.sendRedirect("HouseManagingServlet");
		}
	}
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
