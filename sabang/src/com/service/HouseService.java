package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.config.MySqlSessionFactory;
import com.dao.HouseDAO;
import com.dto.HouseInfoDTO;
import com.dto.HouseRcnlistDTO;

public class HouseService {
	private static final Logger logger = LoggerFactory.getLogger(HouseService.class);
	public HashMap<String, Object> searchList(String search, int curPage){
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
	
	public List<HashMap<String, Object>> retrieveNewItems(){
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
	
	public List<HashMap<String, Object>> retrieveHotItems(){
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
	
	public HashMap<String, Object> listByFilter(HashMap<String, List<String>> queryMap, int curPage){
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
	
	
	
	///////////////////////////////////////////////////////////
	// House 자세히보기
	public HouseInfoDTO HouseRetrieve(String hcode){
	SqlSession session = MySqlSessionFactory.getSession();
	HouseInfoDTO dto = null;
	try {
	HouseDAO dao = new HouseDAO();
	dto = dao.HouseRetrieve(session,hcode);
	}finally {
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

	
	// 최근 본 House 리스트 보기
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
}
