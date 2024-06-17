package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

	
public class HitterStatDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<HitterStatDTO> showHitterStat() {
		
		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <HitterStatDTO> hitter_stat = session.selectList("com.baseballtalk.database.StatMapper.showHitterStat");
		session.close();
		
		return hitter_stat;

	}

}
