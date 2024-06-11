package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class TestDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
public List<Match> View() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true); // auto commit 역할
		
		// session.insert("경로",넘겨줄 파라미터);
		List<Match> match = session.selectList("com.smhrd.database.MemberMapper.match");
		session.close();
		return match;
	}
}
