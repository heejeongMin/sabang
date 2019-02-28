package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.config.MySqlSessionFactory;
import com.dao.HouseDAO;
import com.dto.HouseInfoDTO;
import com.dto.HouseOptionDTO;
import com.dto.HousePriceDTO;
import com.dto.HouseRcnlistDTO;
import com.dto.HouseWishlistDTO;

public class HouseService {
	private static final Logger logger = LoggerFactory.getLogger(HouseService.class);
	
	public HashMap<String, Object> searchList(String search, int curPage){//검색에 의한 결과 리스트 페이징 처리
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> pagingMap = null;
		try {
			HouseDAO dao = new HouseDAO();
			pagingMap = dao.searchList(session, search, curPage);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return pagingMap;
	}//searchList
	
	public List<HashMap<String, Object>> retrieveNewItems(){//신매물 리스트
		SqlSession session = MySqlSessionFactory.getSession();
		List<HashMap<String, Object>> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.retrieveNewItems(session);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}//retrieveNewItems
	
	public List<HashMap<String, Object>> retrieveHotItems(){//핫매물 리스트
		SqlSession session = MySqlSessionFactory.getSession();
		List<HashMap<String, Object>> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.retrieveHotItems(session);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}//retrieveHotItems
	
	public HashMap<String, Object> listByFilter(HashMap<String, List<String>> queryMap, int curPage){//필터에 의한 리스트
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = null;
		
		try {
			HouseDAO dao = new HouseDAO();
			map = dao.listByFilter(session, queryMap, curPage);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return map;
	}//retrieveHotItems
	
	public List<HashMap<String, Object>> houseByAgent(String agntid){//listByFilter에서만 사용해서 private 처리
		SqlSession session = MySqlSessionFactory.getSession();
		List<HashMap<String, Object>> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.houseByAgent(session, agntid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}//houseByAgent
	
	public String getLastCode(String htype) {//마지막으로 등록된 코드 가져오기
		SqlSession session = MySqlSessionFactory.getSession();
		String lastCode = null;
		try {
			HouseDAO dao = new HouseDAO();
			lastCode = dao.getLastCode(session, htype);
		} finally {
			session.close();
		}
		return lastCode;
	}//end getLastCode
	
	public int houseRegister(HashMap<String, Object> registerMap) {//매물등록
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
			n = dao.houseRegister_info(session, (HouseInfoDTO) registerMap.get("info"));
			n = dao.houseRegister_price(session, (HousePriceDTO) registerMap.get("price"));
			n = dao.houseRegister_option(session, (HouseOptionDTO) registerMap.get("option"));
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}//end houseRegister
	
	public int houseUpdate(HashMap<String, Object> registerMap) {//매물 수정
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
			n = dao.houseUpdate_info(session, (HouseInfoDTO) registerMap.get("info"));
			n = dao.houseUpdate_price(session, (HousePriceDTO) registerMap.get("price"));
			n = dao.houseUpdate_option(session, (HouseOptionDTO) registerMap.get("option"));
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}//end houseUpdate
	
	
	public int houseDel(List<String> list) {//매물삭제
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
			n = dao.houseDel(session, list);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}//end houseDel
	
	public int updateCntWish(HouseWishlistDTO dto) {//매물 cnthwish 업데이트
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
//			n = dao.updateCntWish(session, dto.getHcode());
			n = dao.addWish(session, dto);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}//end updateCntWish
	
	
	///////////////////////////////////////////////////////////
	// Basic : House 자세히보기
	public HouseInfoDTO houseRetrieve(String hcode){
	SqlSession session = MySqlSessionFactory.getSession();
	HouseInfoDTO dto = null;
	try {
	HouseDAO dao = new HouseDAO();
	dto = dao.houseRetrieve(session,hcode);
	}finally {
	session.close();
	}
	return dto;
	}
	
	// Basic : house 가격 
	public HousePriceDTO housePrice(String hcode) {
		SqlSession session = MySqlSessionFactory.getSession();
		HousePriceDTO dto = null;
		try {
			HouseDAO dao = new HouseDAO();
			dto = dao.housePrice(session, hcode);
		} finally {
			session.close();
		}
		return dto;
	}
	
	// Basic : house 옵션
	public HouseOptionDTO houseOption(String hcode) {
		SqlSession session = MySqlSessionFactory.getSession();
		HouseOptionDTO dto = null;
		try {
			HouseDAO dao = new HouseDAO();
			dto = dao.houseOption(session, hcode);
		} finally {
			session.close();
		}
		return dto;
	}
	
	///////////////////////////////////////////////////////////
	// 최근 본 House 테이블 보기
	public List<HouseRcnlistDTO> selectRcnlist(String userid){
		SqlSession session = MySqlSessionFactory.getSession();
		List<HouseRcnlistDTO> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.selectRcnlist(session, userid);
		}finally {
			session.close();
		}
		return list;
	}
	
	
	// 최근 본 House DB 데이터 저장
	public int rcnListAllDone(List<HouseRcnlistDTO> rList){
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
			n = dao.rcnListAllDone(session,rList);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return n;
	}
	
	
	// 최근 본 House DB 데이터 삭제
	public int deleteRcnlist(List<Long> userRcnList) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			HouseDAO dao = new HouseDAO();
			n = dao.deleteRcnlist(session,userRcnList);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return n;
	}

	
	// 최근 본 / 찜한 House 리스트 보기
	public List<HashMap<String, Object>> rcnHouseInfo(List<String> hCodeList){
		SqlSession session = MySqlSessionFactory.getSession();
		List<HashMap<String, Object>> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.rcnHouseInfo(session,hCodeList);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
	// 찜한 House 리스트 보기
	public List<HouseWishlistDTO> selectWishlist(String userid){
		SqlSession session = MySqlSessionFactory.getSession();
		List<HouseWishlistDTO> list = null;
		try {
			HouseDAO dao = new HouseDAO();
			list = dao.selectWishlist(session, userid);
		}finally {
			session.close();
		}
		return list;
	}
}
