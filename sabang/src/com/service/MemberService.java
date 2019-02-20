package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.AgentDTO;
import com.dto.MemberDTO;

public class MemberService {

	/* 로그인 */

	public MemberDTO login(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO member = null;
		try {
			MemberDAO dao = new MemberDAO();
			member = dao.login(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return member;
	}// end member login

	
	public AgentDTO agntlogin(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		AgentDTO agent = null;
		try {
			MemberDAO dao = new MemberDAO();
			agent = dao.agntlogin(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return agent;
	}// end agent login

	
/*회원 탈퇴*/
	
	public int delMbrId(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int delMbr = 0;
		try {
			MemberDAO dao = new MemberDAO();
			delMbr = dao.delMbrId(session, userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return delMbr;
	}// end delMbrId


	public int delAgntId(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int delMbr = 0;
		try {
			MemberDAO dao = new MemberDAO();
			delMbr = dao.delAgntId(session, userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return delMbr;
	}// end delMbrId

	
	
	
	public MemberDTO checkMbrPw(String passwd) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO checkMbrPw = null;
		try {
			MemberDAO dao = new MemberDAO();
			checkMbrPw = dao.checkMbrPw(session, passwd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return checkMbrPw;
	}// end checkMbrPw
	
	
	
}
