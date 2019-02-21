package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HouseDAO {
	private static final Logger logger = LoggerFactory.getLogger(HouseDAO.class);
	/* 
	 * 페이징 처리
	 * 1. curPage : 현재 페이지 
	 * 2. perPage : 한번에 보여줄 페이지 개수 
	 * 3. totalPage : 전체 목록 개수
	 * 4. list : db에서 가져온 애들
	 * */
	
	//검색에 의한 결과 리스트 페이징 처리
	public HashMap<String, Object> searchList(SqlSession session, String search, int curPage){
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("curPage", curPage);
		pagingMap.put("perPage", 3);
		pagingMap.put("totalPage", totalListBySearch(session, search));
		
		int offset = (curPage-1) * (int)pagingMap.get("perPage");
		List<HashMap<String, Object>> list = session.selectList("HouseMapper.searchList", search, new RowBounds(offset, (int)pagingMap.get("perPage")));
		pagingMap.put("list", list);
		
		return pagingMap; 
	}//searchList
	
	//searchList에서만 사용해서 private처리
	private int totalListBySearch(SqlSession session, String search) {
		return session.selectOne("HouseMapper.totalListBySearch", search);
	}//totalListbySearch
	
	//신매물 리스트
	public List<HashMap<String, Object>> retrieveNewItems(SqlSession session){
		return session.selectList("HouseMapper.retrieveNewItems");
	}//end retrieveNewItems
	
	//핫매물 리스트
	public List<HashMap<String, Object>> retrieveHotItems(SqlSession session){
		return session.selectList("HouseMapper.retrieveHotItems");
	}//end retrieveHotItems
		
	//필터에 의한 리스트
	public HashMap<String, Object> listByFilter(SqlSession session, HashMap<String, List<String>> queryMap, int curPage){
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("curPage", curPage);
		pagingMap.put("perPage", 3);
		pagingMap.put("totalPage", totalListByFilter(session, queryMap));
		
		int offset = (curPage-1) * (int)pagingMap.get("perPage");
		List<HashMap<String, Object>> list = session.selectList("HouseMapper.listByFilter", queryMap, new RowBounds(offset, (int)pagingMap.get("perPage")));
		pagingMap.put("list", list);
		
		return pagingMap; 
	}//listByFilter
	
	//listByFilter에서만 사용해서 private 처리
	private int totalListByFilter(SqlSession session, HashMap<String, List<String>> queryMap) {
		return session.selectOne("HouseMapper.totalListByFilter", queryMap);
	}//totalListByFilter
	

}
