package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.AgentDTO;
import com.dto.MemberDTO;

public class MemberDAO {
	
	
	/* 로그인 */
	
	public MemberDTO login(SqlSession session, HashMap<String, String> map) {
		MemberDTO member = session.selectOne("MemberMapper.login", map);
		return member;
	}
	
	public AgentDTO agntlogin(SqlSession session, HashMap<String, String> map) {
		AgentDTO agent = session.selectOne("MemberMapper.agntlogin", map);
		return agent;
	}
	
	
	/* 탈퇴 */
	
	public int delMbrId(SqlSession session, String userid) {
		int delMbr = session.delete("MemberMapper.delMbrId", userid);
		return delMbr;
	}
	
	public int delAgntId(SqlSession session, String userid) {
		int delAgntId = session.delete("MemberMapper.delAgntId", userid);
		return delAgntId;
	}

	

	public MemberDTO checkMbrPw(SqlSession session, String passwd) {
		MemberDTO checkMbrPw = session.selectOne("MemberMapper.checkMbrPw", passwd);
		return checkMbrPw;
	}

	
	
	//////////////////////////////////////////////////////////////////
	// 마이페이지
	public MemberDTO mypage(SqlSession session,String userid) {
	MemberDTO n = session.selectOne("MemberMapper.mypage",userid);
	return n;
	}
	
	
	public int MemberUpdate(SqlSession session, MemberDTO dto) {
	int n = session.update("MemberMapper.memberUpdate",dto);
	return n;
	}
}
