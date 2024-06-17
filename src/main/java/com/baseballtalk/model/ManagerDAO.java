package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.baseballtalk.database.SqlSessionManager;

public class ManagerDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<FreeBoardDTO> showFreeBoard() {
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <FreeBoardDTO> FreeBoard = session.selectList("com.baseballtalk.database.ManagerMapper.showFreeBoard");
		session.close();
		
		return FreeBoard;
	}
	
	public List<TeamBoardDTO> showTeamBoard() {
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <TeamBoardDTO> TeamBoard = session.selectList("com.baseballtalk.database.ManagerMapper.showTeamBoard");
		session.close();
		
		return TeamBoard;
	}
	
	
	public List<MemberDTO> showAllMember() {
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List <MemberDTO> AllMember = session.selectList("com.baseballtalk.database.ManagerMapper.showAllMember");
		session.close();
		
		return AllMember;
	}
	
	
	

}
