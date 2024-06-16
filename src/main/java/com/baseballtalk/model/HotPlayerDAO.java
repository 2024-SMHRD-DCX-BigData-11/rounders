package com.baseballtalk.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class HotPlayerDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertHotPlayer(HotPlayerDTO hotPlayer) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.HotPlayerMapper.insertHotPlayer", hotPlayer);
		session.close();
		return cnt;
	}
	
	
	

}
