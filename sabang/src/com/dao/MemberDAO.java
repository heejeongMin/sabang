package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.AgentDTO;
import com.dto.MemberDTO;
import com.dto.WdMbrDTO;

public class MemberDAO {
	
	
	
	/* 가입 */
	
	public int signMbr(SqlSession session, MemberDTO member) {
		int n = session.insert("MemberMapper.signMbr", member);
		return n;
	}
	
	public int signAgnt(SqlSession session, AgentDTO agent) {
		int n = session.insert("MemberMapper.signAgnt", agent);
		return n;
	}
	
	public int idCheck(SqlSession session, String userid) {
		int count = session.selectOne("MemberMapper.idCheck", userid);
		return count;
	}
	
	public int agntIdCheck(SqlSession session, String userid) {
		int count = session.selectOne("MemberMapper.agntIdCheck", userid);
		return count;
	}

	public int signedCheck(SqlSession session, String userid) {
		return session.selectOne("MemberMapper.signedCheck", userid);
	}
	
	public WdMbrDTO wdMbrInfo(SqlSession session, String userid) {
		return session.selectOne("MemberMapper.wdMbrInfo", userid);
	}
	
	
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
	public MemberDTO mypageMember(SqlSession session,String userid) {
		MemberDTO n = session.selectOne("MemberMapper.mypageMember",userid);
		return n;
	}
	
	public AgentDTO mypageAgent(SqlSession session,String userid) {
		AgentDTO n = session.selectOne("MemberMapper.mypageAgent",userid);
		return n;
	}
	
	public int MemberUpdate(SqlSession session, MemberDTO dto) {
		int n = session.update("MemberMapper.memberUpdate",dto);
		return n;
	}
	/*
	public MemberDTO myPageCheckMember(SqlSession session, HashMap<String, String> map) {
		MemberDTO checkMbrPw = session.selectOne("MemberMapper.checkMbrPw", map);
		return checkMbrPw;
	}
	*/
}
