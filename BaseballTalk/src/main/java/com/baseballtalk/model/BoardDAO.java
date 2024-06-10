package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class BoardDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertBoard(Board board) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertBoard",board);
		session.close();
		return cnt;
	}
	
	public List<Board> showBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Board> list = session.selectList("com.smhrd.database.BoardMapper.showBoard");
		session.close();
		return list;
		
	}
	
	public Board detailBoard(int num) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		Board board = session.selectOne("com.smhrd.database.BoardMapper.detailBoard", num);
		session.close();
		return board;
		
	}

}
