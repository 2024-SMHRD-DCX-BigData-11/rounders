package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class PlayerDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<PlayerDTO> showPlayer() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <PlayerDTO> player = session.selectList("com.baseballtalk.database.PlayerMapper.showPlayer");
		session.close();
		
		return player;

	}
	
	public List<PlayerDTO> showHitter_info() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <PlayerDTO> hitter_info = session.selectList("com.baseballtalk.database.PlayerMapper.showHitter_info");
		session.close();
		
		return hitter_info;

	}
	
	public List<PlayerDTO> showPitcher_info() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <PlayerDTO> pitcher_info = session.selectList("com.baseballtalk.database.PlayerMapper.showPitcher_info");
		session.close();
		
		return pitcher_info;

	}

}
