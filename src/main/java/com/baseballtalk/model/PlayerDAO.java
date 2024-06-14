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

}
