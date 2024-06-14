package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class TestDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSession();
	
public List<MatchDTO> View() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlsessionFactory.openSession(true);
		
		// session.insert("경로",넘겨줄 파라미터);
		List<MatchDTO> match = session.selectList("com.baseballtalk.database.MatchMapper.match");
		session.close();
		return match;
	}
}
