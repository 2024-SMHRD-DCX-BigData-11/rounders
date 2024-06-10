package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class MessageDAO {

 	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertMessage(Message m) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.MessageMapper.insertMessage", m);
		session.close();
		return cnt;
	}
	
	public List<Message> selectMessage(String email){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Message> list = session.selectList("com.smhrd.database.MessageMapper.selectMessage", email);
		session.close();
		return list;
		
	}
	
	public int deleteAllMessage(String email){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.MessageMapper.deleteAllMessage", email);
		session.close();
		return cnt;
		
	}
	

}
