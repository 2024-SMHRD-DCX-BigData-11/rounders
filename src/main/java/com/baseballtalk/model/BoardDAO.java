package com.baseballtalk.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;
import com.baseballtalk.model.TeamBoardDTO;
import com.baseballtalk.model.FreeBoardDTO;
import com.baseballtalk.model.NoticeBoardDTO;

public class BoardDAO {
	
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int insertNoticeBoard(NoticeBoardDTO noticeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertNoticeBoard",noticeBoard);
		session.close();
		return cnt;
	}
	
	public int insertFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertFreeBoard",freeBoard);
		session.close();
		return cnt;
	}
	
	public int insertTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertTeamBoard",teamBoard);
		session.close();
		return cnt;
	}
	

	
	public int updateNoticeBoard(NoticeBoardDTO noticeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.BoardMapper.updateNoticeBoard",noticeBoard);
		session.close();
		return cnt;
		
	}
	
	public int updateFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.BoardMapper.updateFreeBoard",freeBoard);
		session.close();
		return cnt;
		
	}
	
	public int updateTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.BoardMapper.updateTeamBoard",teamBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteNoticeBoard(NoticeBoardDTO noticeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteNoticeBoard",noticeBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteFreeBoard",freeBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteTeamBoard",teamBoard);
		session.close();
		return cnt;
		
	}
	


}
