package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.BoardDAO;
import com.dto.BoardDTO;

public class BoardService {

	 public List<BoardDTO> boardList(String hcode) {
			SqlSession session = MySqlSessionFactory.getSession();
			List<BoardDTO> list = null;
			try {
				BoardDAO dao = new BoardDAO();
				 list = dao.boardList(session, hcode);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}//end idCheck
}
