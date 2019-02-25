package com.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.BoardDTO;

public class BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	public List<BoardDTO> boardList(SqlSession session, String hcode){
		List<BoardDTO> list = session.selectList("BoardMapper.boardList", hcode);
		return list;
	}
}
