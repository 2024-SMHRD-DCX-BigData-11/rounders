package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.baseballtalk.model.RankDTO;

import com.baseballtalk.database.SqlSessionManager;

public class RankDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<RankDTO> View() {

		// Connection 하나 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);

		// session.insert("경로",넘겨줄 파라미터);
		List<RankDTO> rank = session.selectList("com.baseballtalk.database.RankMapper.rank");
		session.close();
		return rank;
	}
}
