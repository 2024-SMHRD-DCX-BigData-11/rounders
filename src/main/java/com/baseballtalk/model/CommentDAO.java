package com.baseballtalk.model;

import java.util.List;

import org.apache.catalina.Session;
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
		int cnt = session.insert("com.baseballtalk.database.CommentMapper.insertRecoredComment",Recoredcomment);
		session.close();
		return cnt;
	}
	
	public int insertFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.CommentMapper.insertFreeBoardComment",Freecomment);
		session.close();
		return cnt;
	}
	
	public int insertTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.BoardMapper.insertTeamComment",Teamcomment);
		session.close();
		return cnt;
	}
	
	public int updateRecoredComment(RecoredCommentDTO Recoredcomment) {
			
			SqlSession session = sqlSessionFactory.openSession(true);
			int cnt = session.update("com.baseballtalk.database.CommentMapper.updateRecoredComment",Recoredcomment);
			session.close();
			return cnt;
			
		}
	

	public int updateFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.baseballtalk.database.CommentMapper.updateFreeBoardComment",Freecomment);
		session.close();
		return cnt;
		
	}
	
	public int updateTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.baseballtalk.database.CommentMapper.updateTeamBoardComment",Teamcomment);
		session.close();
		return cnt;
		
	}
	
	public int deleteRecoredComment(RecoredCommentDTO Recoredcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.CommentMapper.deleteRecoredComment",Recoredcomment);
		session.close();
		return cnt;
		
	}
	
	
	public int deleteFreeBoardComment(FreeBoardCommentDTO Freecomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.CommentMapper.deleteFreeBoardComment",Freecomment);
		session.close();
		return cnt;
		
	}
	
	public int deleteTeamBoardComment(TeamBoardCommentDTO Teamcomment) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.baseballtalk.database.CommentMapper.deleteTeamBoardComment",Teamcomment);
		session.close();
		return cnt;
		
	}
	
	public List<RecoredCommentDTO> show_RecoredComment(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<RecoredCommentDTO> show_RecoredComment = session.selectList("com.baseballtalk.database.CommentMapper.showRecoredComment");
		return show_RecoredComment;
	}
	
	
	public List<FreeBoardCommentDTO> show_FreeBoardComment(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FreeBoardCommentDTO> show_FreeBoardComment = session.selectList("com.baseballtalk.database.CommentMapper.showFreeBoardComment");
		return show_FreeBoardComment;
	}
	
	public List<FreeBoardCommentDTO> show_TeamBoardComment(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FreeBoardCommentDTO> show_FreeBoardComment = session.selectList("com.baseballtalk.database.CommentMapper.showTeamBoardComment");
		return show_FreeBoardComment;
	}


}
