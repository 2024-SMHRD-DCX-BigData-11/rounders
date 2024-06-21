package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class TeamDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	public String getTeamName(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String TeamName = session.selectOne("com.baseballtalk.database.TeamMapper.selectTeamName",team_idx);
		session.close();
		return TeamName;
		
	}
	
	public String getTeamLogo(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String TeamName = session.selectOne("com.baseballtalk.database.TeamMapper.selectTeamLogo",team_idx);
		session.close();
		return TeamName;
		
	}
}
