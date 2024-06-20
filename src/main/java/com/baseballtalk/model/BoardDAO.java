package com.baseballtalk.model;

import java.util.List;

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
		int cnt = session.insert("com.baseballtalk.database.BoardMapper.insertNoticeBoard",noticeBoard);
		session.close();
		return cnt;
	}
	
	public int insertFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.BoardMapper.insertFreeBoard",freeBoard);
		session.close();
		return cnt;
	}
	
	public int insertTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.BoardMapper.insertTeamBoard",teamBoard);
		session.close();
		return cnt;
	}
	

	
	public int updateNoticeBoard(NoticeBoardDTO noticeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.baseballtalk.database.BoardMapper.updateNoticeBoard",noticeBoard);
		session.close();
		return cnt;
		
	}
	
	public int updateFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.baseballtalk.database.BoardMapper.updateFreeBoard",freeBoard);
		session.close();
		return cnt;
		
	}
	
	public int updateTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.baseballtalk.database.BoardMapper.updateTeamBoard",teamBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteNoticeBoard(NoticeBoardDTO noticeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.BoardMapper.deleteNoticeBoard",noticeBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteFreeBoard(FreeBoardDTO freeBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.BoardMapper.deleteFreeBoard",freeBoard);
		session.close();
		return cnt;
		
	}
	
	public int deleteTeamBoard(TeamBoardDTO teamBoard) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.BoardMapper.deleteTeamBoard",teamBoard);
		session.close();
		return cnt;
		
	}
	
	public List<TeamBoardDTO> selectTeamBoard() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> board = session.selectList("com.baseballtalk.database.BoardMapper.selectTeamBoard");
		session.close();
		return board;
		
	}
	
	public List<NoticeBoardDTO> showNoticeBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<NoticeBoardDTO> noticeBoard = session.selectList("com.baseballtalk.database.BoardMapper.showNoticeBoard");
		session.close();
		return noticeBoard;
		
	}
	
	public List<FreeBoardDTO> showFreeBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FreeBoardDTO> freeBoard = session.selectList("com.baseballtalk.database.BoardMapper.showFreeBoard");
		session.close();
		return freeBoard;
		
	}
	
	


}
