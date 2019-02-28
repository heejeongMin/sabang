package com.dao;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.BoardDTO;

public class BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	// 보드 리스트 가져오기
	public List<BoardDTO> boardList(SqlSession session, String hcode){
		List<BoardDTO> list = session.selectList("BoardMapper.boardList", hcode);
		return list;
	}
	
	// 보드 삭제, pcode와 게시물 비밀번호를 받는다
	public int deleteBoard(SqlSession session, HashMap<String,String> list){
		int x = session.delete("BoardMapper.deleteBoard", list);
		return x;
	}
	
	// 보드 수정, dto와 게시물 비밀번호를 받는다
//	public int updateBoard(SqlSession session, HashMap<String,BoardDTO> map){
//		int x = session.update("BoardMapper.updateBoard", map);
//		return x;
//	}
	
	public int updateBoard(SqlSession session, BoardDTO board){
		int x = session.update("BoardMapper.updateBoard", board);
		return x;
	}
	//보드 수정과 삭제를 위한 게시물 비밀번호로 보드 데이터 가져오기
/*	public List<BoardDTO> boardList(SqlSession session, String hcode){
		List<BoardDTO> list = session.selectList("BoardMapper.boardList", hcode);
		return list;
	}*/
	
}
