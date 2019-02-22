package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.AgentDTO;
import com.dto.MemberDTO;
import com.dto.WdMbrDTO;

public class MemberService {

	
	/* 가입  */

	public int signMbr(MemberDTO member) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			MemberDAO dao = new MemberDAO();
			n = dao.signMbr(session, member);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	public int signAgnt(AgentDTO agent) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			MemberDAO dao = new MemberDAO();
			n = dao.signAgnt(session, agent);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	public int idCheck(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int count = 0;
		try {
			MemberDAO dao = new MemberDAO();
			count = dao.idCheck(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
	public int agntIdCheck(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int count = 0;
		try {
			MemberDAO dao = new MemberDAO();
			count = dao.agntIdCheck(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
	public int signedCheck(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int hasSigned = 0;
		try {
			MemberDAO dao = new MemberDAO();
			hasSigned = dao.signedCheck(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return hasSigned;
	}// end hasSigned
	
	public WdMbrDTO wdMbrInfo (String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		WdMbrDTO SignedMbr = null;
		try {
			MemberDAO dao = new MemberDAO();
			SignedMbr = dao.wdMbrInfo(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return SignedMbr;
	}// end overDayCheck
	
	
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
	
	
	
	
	// 마이페이지
	public MemberDTO mypage(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		try {
			MemberDAO dao = new MemberDAO();
			dto = dao.mypage(session, userid);
		}finally {
			session.close();
		}
		return dto;
	}
		
		
	public int MemberUpdate(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			MemberDAO dao = new MemberDAO();
			n = dao.MemberUpdate(session, dto);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}
	
}
