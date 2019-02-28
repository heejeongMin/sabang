package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.BoardDAO;
import com.dto.BoardDTO;

public class BoardService {

	
	// 보드 리스트 가져오기
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
		}//end boardList
	 
	 
	// 보드 삭제
	 public int deleteBoard(HashMap<String,String> list) {
			SqlSession session = MySqlSessionFactory.getSession();
			int deleteBoard = 0;
			try {
				BoardDAO dao = new BoardDAO();
				deleteBoard = dao.deleteBoard(session, list);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return deleteBoard;
		}
	// 보드 수정
/*	 public int updateBoard(HashMap<String,BoardDTO> map) {
			SqlSession session = MySqlSessionFactory.getSession();
			int updateBoard = 0;
			try {
				BoardDAO dao = new BoardDAO();
				updateBoard = dao.updateBoard(session, map);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return updateBoard;
		}*/
	 
	 
	 
	 public int updateBoard(BoardDTO board) {
			SqlSession session = MySqlSessionFactory.getSession();
			int updateBoard = 0;
			try {
				BoardDAO dao = new BoardDAO();
				updateBoard = dao.updateBoard(session, board);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return updateBoard;
		}
}
