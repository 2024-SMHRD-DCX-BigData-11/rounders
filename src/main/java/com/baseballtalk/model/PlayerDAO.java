package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class PlayerDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<PlayerDTO> selectplayer(String player_id){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PlayerDTO> list = session.selectList("com.baseballtalk.database.PlayerMapper.selectPlayer", player_id);
		session.close();
		return list;
		
	}
	

}
