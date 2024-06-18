package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

	
public class PitcherStatDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<PitcherStatDTO> showPitcherStat() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<PitcherStatDTO> pitcher_stat = session.selectList("com.baseballtalk.database.StatMapper.showPitcherStat");
		session.close();
		
		return pitcher_stat;

	}

}
