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
	
	public int login(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("com.baseballtalk.database.MemberMapper.login", member);
		session.close();
		return cnt;
	}
	
	public int SerchPw(MemberDTO member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("com.baseballtalk.database.MemberMapper.serchPw", member);
		session.close();
		return cnt;
	}
	
	
}
