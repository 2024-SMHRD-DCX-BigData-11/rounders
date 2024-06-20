package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class MatchDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<MatchDTO> View() {

		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);

		// session.insert("경로",넘겨줄 파라미터);
		List<MatchDTO> match = session.selectList("com.baseballtalk.database.MatchMapper.match");
		session.close();
		return match;
	}
	
	public MatchDTO myView(int team_idx) {

		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);

		// session.insert("경로",넘겨줄 파라미터);
		MatchDTO match = session.selectOne("com.baseballtalk.database.MatchMapper.match_my",team_idx);
		session.close();
		return match;
	}

	public String match_time(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String match_time = session.selectOne("com.baseballtalk.database.MatchMapper.matchtime", team_idx);
		session.close();
		return match_time;
	}
}
