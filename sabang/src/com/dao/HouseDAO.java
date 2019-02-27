package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.HouseInfoDTO;
import com.dto.HouseOptionDTO;
import com.dto.HousePriceDTO;
import com.dto.HouseRcnlistDTO;
import com.dto.HouseWishlistDTO;

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
	
	//panel에 매물리스트
	public List<HashMap<String, Object>> houseByAgent(SqlSession session, String agntid){
		return session.selectList("HouseMapper.houseByAgent", agntid);
	}//houseByAgent
	
	//가장 최근에 등록된 매물코드가져오기
	public String getLastCode(SqlSession session, String htype){
		return session.selectOne("HouseMapper.getLastCode", htype);
	}//end getLastCode
	
	//매물 올리기- info - info&price&option 트랜잭션 처리
	public int houseRegister_info(SqlSession session, HouseInfoDTO infoDTO){
		return session.insert("HouseMapper.houseRegister_info", infoDTO);
	}//end houseRegister_info
	
	//매물 올리기- price - info&price&option 트랜잭션 처리
	public int houseRegister_price(SqlSession session, HousePriceDTO priceDTO){
		return session.insert("HouseMapper.houseRegister_price", priceDTO);
	}//end houseRegister_price
	
	//매물 올리기- option - info&price&option 트랜잭션 처리
	public int houseRegister_option(SqlSession session, HouseOptionDTO optionDTO){
		return session.insert("HouseMapper.houseRegister_option", optionDTO);
	}//end houseRegister_option
	
	
	//매물 수정- info - info&price&option 트랜잭션 처리
	public int houseUpdate_info(SqlSession session, HouseInfoDTO infoDTO){
		return session.update("HouseMapper.houseUpdate_info", infoDTO);
	}//end houseRegister_info

	//매물 수정- price - info&price&option 트랜잭션 처리
	public int houseUpdate_price(SqlSession session, HousePriceDTO priceDTO){
		return session.update("HouseMapper.houseUpdate_price", priceDTO);
	}//end houseRegister_price

	//매물 수정- option - info&price&option 트랜잭션 처리
	public int houseUpdate_option(SqlSession session, HouseOptionDTO optionDTO){
		return session.update("HouseMapper.houseUpdate_option", optionDTO);
	}//end houseUpdate_option
	
	//매물 삭제
	public int houseDel(SqlSession session, List<String> list){
		int n = session.delete("HouseMapper.houseDel_info", list);
		n = session.delete("HouseMapper.houseDel_price", list);
		n = session.delete("HouseMapper.houseDel_option", list);
		return n;
	}//end houseDel
	
	//매물 cntwish 값 업데이트
	public int updateCntWish(SqlSession session, String hcode) {
		int n = getCntWish(session, hcode);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("hcode", hcode);
		map.put("cntwish", n);
		
		n = session.update("HouseMapper.updateCntWish", map);
		return n;
	}//updateCntWish
	
	
	//매물 cntwish 값 가져오기 
	private int getCntWish(SqlSession session, String hcode) {
		return session.selectOne("HouseMapper.getCntWish", hcode);
	}//getCntWish
		
	// 유저가 찜한 매물 저장하기
	public int addWish(SqlSession session, HouseWishlistDTO dto) {
		int n = getNoOfWishes(session, dto.getUserid());
		int result = (n >= 6)? 0 : session.insert("HouseMapper.addWish", dto);
		return result;
	}//updateCntWish
	
	//한 유저당 찜 한 개수 가지고 오기
	private int getNoOfWishes(SqlSession session, String userid) {
		return session.selectOne("HouseMapper.getNoOfWishes", userid);
	}//getCntWish
	
	
	///////////////////////////////////////////////////////////
	// Basic: House 자세히보기
	public HouseInfoDTO houseRetrieve(SqlSession session, String hcode){
	HouseInfoDTO dto = session.selectOne("HouseMapper.houseRetrieve",hcode);
	return dto;
	}
	
	// Basic: House 가격
	public HousePriceDTO housePrice(SqlSession session, String hcode){
	HousePriceDTO dto = session.selectOne("HouseMapper.housePrice",hcode);
	return dto;
	}
	// Basic: House 옵션
	public HouseOptionDTO houseOption(SqlSession session, String hcode){
	HouseOptionDTO dto = session.selectOne("HouseMapper.houseOption",hcode);
	return dto;
	}
	
	
	///////////////////////////////////////////////////////////
	// 최근 본 House 테이블 보기
	public List<HouseRcnlistDTO> selectRcnlist(SqlSession session, String userid){
		List<HouseRcnlistDTO> list = session.selectList("HouseMapper.rcnList", userid);
		return list;
	}
	
	// 최근 본 House DB 데이터 저장
	public int rcnListAllDone(SqlSession session, List<HouseRcnlistDTO> rList) {
		int n = session.insert("HouseMapper.rcnInsertAll", rList);
		return n;
	}
	
	// 최근 본 House DB 데이터 삭제
	public int deleteRcnlist(SqlSession session,List<Long> userRcnList) {
		int n = session.delete("HouseMapper.rcnDelete",userRcnList);
		return n;
	}
	
	// 최근 본 / 찜한 House 리스트 보기
	public List<HashMap<String, Object>> rcnHouseInfo(SqlSession session, List<String> hCodeList){
		List<HashMap<String, Object>> list = session.selectList("HouseMapper.rcnHouseList", hCodeList);
		return list;
	}
	
	// 찜한 House 테이블 보기
	public List<HouseWishlistDTO> selectWishlist(SqlSession session, String userid){
		List<HouseWishlistDTO> list = session.selectList("HouseMapper.wishList", userid);
		return list;
	}
}
