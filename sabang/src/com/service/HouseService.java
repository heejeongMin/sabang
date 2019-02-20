package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.HouseDAO;

public class HouseService {

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
}
