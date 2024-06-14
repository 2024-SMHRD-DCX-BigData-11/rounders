package com.baseballtalk.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;
import com.baseballtalk.model.TeamBoardDTO;
import com.baseballtalk.model.FreeBoardDTO;
import com.baseballtalk.model.NoticeBoardDTO;

public class CommentDAO {
	
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int insertRecoredComment(RecoredCommentDTO Recoredcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.CommentMapper.RecoredComment",Recoredcomment);
		session.close();
		return cnt;
	}
	
	public int insertFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.CommentMapper.insertFreeBoardComment",Freecomment);
		session.close();
		return cnt;
	}
	
	public int insertTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertTeamComment",Teamcomment);
		session.close();
		return cnt;
	}
	
	public int updateRecoredComment(RecoredCommentDTO Recoredcomment) {
			
			SqlSession session = sqlSessionFactory.openSession(true);
			int cnt = session.update("com.smhrd.database.CommentMapper.updateRecoredComment",Recoredcomment);
			session.close();
			return cnt;
			
		}
	

	public int updateFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.CommentMapper.updateFreeBoardComment",Freecomment);
		session.close();
		return cnt;
		
	}
	
	public int updateTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.BoardMapper.updateTeamComment",Teamcomment);
		session.close();
		return cnt;
		
	}
	
	public int deleteRecoredComment(RecoredCommentDTO Recoredcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteRecoredComment",Recoredcomment);
		session.close();
		return cnt;
		
	}
	
	
	public int deleteFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteFreeBoardComment",Freecomment);
		session.close();
		return cnt;
		
	}
	
	public int deleteTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.BoardMapper.deleteTeamComment",Teamcomment);
		session.close();
		return cnt;
		
	}
	


}
