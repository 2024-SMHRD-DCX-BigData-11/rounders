package com.baseballtalk.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.baseballtalk.database.SqlSessionManager;

public class HotPlayerDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertHotPlayer(HotPlayerDTO hotPlayer) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.baseballtalk.database.HotPlayerMapper.insertHotplayer", hotPlayer);
		session.close();
		return cnt;
	}
	
	public List<PlayerDTO> selectPlayer(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PlayerDTO> Selcetplayer = session.selectList("com.baseballtalk.database.HotPlayerMapper.selectPlayer", team_idx);
		session.close();
		return Selcetplayer;
	}
	
	public List<PlayerDTO> MainAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PlayerDTO> Selcetplayer = session.selectList("com.baseballtalk.database.HotPlayerMapper.MainAll");
		session.close();
		return Selcetplayer;
	}
	
	public List<PlayerDTO> MainMyteam(int team_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PlayerDTO> Selcetplayer = session.selectList("com.baseballtalk.database.HotPlayerMapper.MainMyteam", team_idx);
		session.close();
		return Selcetplayer;
	}
	
	public int updateLikes(PlayerDTO player) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.update("com.baseballtalk.database.HotPlayerMapper.updateLikes",player);
		session.close();
		return result;
	}
	
	public int selectLikes(int player_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.selectOne("com.baseballtalk.database.HotPlayerMapper.selectLikes",player_idx);
		session.close();
		return result;
	}
	
	public boolean VoteCheck(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		boolean result = session.selectOne("com.baseballtalk.database.HotPlayerMapper.VoteCheck",mem_id);
		session.close();
		return result;
	}
	
	public String votedPlayer(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String result = session.selectOne("com.baseballtalk.database.HotPlayerMapper.votedPlayer",mem_id);
		session.close();
		return result;
	}
	
	
	

}
