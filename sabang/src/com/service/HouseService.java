package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.config.MySqlSessionFactory;
import com.dao.HouseDAO;

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
	
	
	
	
}
