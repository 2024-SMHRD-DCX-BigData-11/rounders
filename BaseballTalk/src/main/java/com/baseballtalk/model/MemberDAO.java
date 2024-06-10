package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int join(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.MemberMapper.join", member);
		session.close();
		return cnt;
	}

	public Member login(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Member login_member = session.selectOne("com.smhrd.database.MemberMapper.login", member);
		session.close();
		return login_member;
	}

	public int update(Member update_member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.MemberMapper.update", update_member);
		session.close();
		return cnt;
	}

	public boolean emailCheck(String inputEmail) {
		SqlSession session = sqlSessionFactory.openSession(true);
		boolean result = session.selectOne("com.smhrd.database.MemberMapper.emailCheck", inputEmail);
		session.close();
		return result;
	}
	
	public List<Member> showMember(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Member> list = session.selectList("com.smhrd.database.MemberMapper.showMember");
		session.close();
		return list;
	}

	public int delete(String email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.MemberMapper.delete", email);
		session.close();
		return cnt;
	}
	
	
	
	
	
	
}
