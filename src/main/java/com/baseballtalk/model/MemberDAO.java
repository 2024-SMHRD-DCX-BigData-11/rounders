package com.baseballtalk.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	 
	public int join(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.MemberMapper.join", member);
		session.close();
		return cnt;
	}
	
	public boolean pwCheck(String inputPw1, String inputPw2) {
		
		boolean result = inputPw1.equals(inputPw2);
				
		return result;
	}
	
	public boolean nickCheck(String inputNick) {
		SqlSession session = sqlSessionFactory.openSession(true);
		boolean result = session.selectOne("com.baseballtalk.database.MemberMapper.emailCheck", inputNick);
		session.close();
		return result;
	}
	
	public MemberDTO login(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		MemberDTO login_member = session.selectOne("com.baseballtalk.database.MemberMapper.login", member);
		System.out.println(login_member);
		session.close();
		return login_member;
	}
	
	public MemberDTO kakaologin(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		MemberDTO kakao_member = session.selectOne("com.baseballtalk.database.MemberMapper.kakaologin", member);
		System.out.println(kakao_member);
		session.close();
		return kakao_member;
	}
	
	public int SerchPw(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("com.baseballtalk.database.MemberMapper.serchPw", member);
		session.close();
		return cnt;
	}
	
	
}
