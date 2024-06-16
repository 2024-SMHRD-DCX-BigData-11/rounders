package com.baseballtalk.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class MatchDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public String match_time(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String match_time = session.selectOne("com.baseballtalk.database.MatchMapper.matchtime", team_idx);
		session.close();
		return match_time;
	}
}
