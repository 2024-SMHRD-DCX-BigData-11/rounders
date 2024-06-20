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
	
	public List<TeamBoardDTO> showKiaBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> kiaBoard = session.selectList("com.baseballtalk.database.BoardMapper.showKiaBoard");
		session.close();
		return kiaBoard;
		
	}
	
	public List<TeamBoardDTO> showLgBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> LgBoard = session.selectList("com.baseballtalk.database.BoardMapper.showLgBoard");
		session.close();
		return LgBoard;
		
	}
	
	
	public List<TeamBoardDTO> showSamsungBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> SansungBoard = session.selectList("com.baseballtalk.database.BoardMapper.showSamsungBoard");
		session.close();
		return SansungBoard;
		
	}
	
	public List<TeamBoardDTO> showDoosanBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> DoosanBoard = session.selectList("com.baseballtalk.database.BoardMapper.showDoosanBoard");
		session.close();
		return DoosanBoard;
		
	}
	
	public List<TeamBoardDTO> showSsgBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> SsgBoard = session.selectList("com.baseballtalk.database.BoardMapper.showSsgBoard");
		session.close();
		return SsgBoard;
		
	}
	
	public List<TeamBoardDTO> showNcBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> NcBoard = session.selectList("com.baseballtalk.database.BoardMapper.showNcBoard");
		session.close();
		return NcBoard;
		
	}
	
	public List<TeamBoardDTO> showHanwhaBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> HanwhaBoard = session.selectList("com.baseballtalk.database.BoardMapper.showHanwhaBoard");
		session.close();
		return HanwhaBoard;
		
	}
	
	public List<TeamBoardDTO> showLotteBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> LotteBoard = session.selectList("com.baseballtalk.database.BoardMapper.showLotteBoard");
		session.close();
		return LotteBoard;
		
	}
	
	public List<TeamBoardDTO> showKtBoard(){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> ktBoard = session.selectList("com.baseballtalk.database.BoardMapper.showKtBoard");
		session.close();
		return ktBoard;
		
	}
	
	public NoticeBoardDTO noticeDetail(int notice_idx) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		NoticeBoardDTO noticeBoard = session.selectOne("com.baseballtalk.database.BoardMapper.NoticeBoardDetail", notice_idx);
		session.close();
		return noticeBoard;
		
	}
	
	public FreeBoardDTO FreeDetail(int board_idx) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		FreeBoardDTO FreeBoard = session.selectOne("com.baseballtalk.database.BoardMapper.FreeBoardDetail", board_idx);
		session.close();
		return FreeBoard;
		
	}
	
	public TeamBoardDTO TeamDetail(int board_idx) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		TeamBoardDTO TeamBoard = session.selectOne("com.baseballtalk.database.BoardMapper.TeamBoardDetail", board_idx);
		session.close();
		return TeamBoard;
		
	}
	
	public List<TeamBoardDTO> myteamBoard(String mem_id){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<TeamBoardDTO> myteamBoard = session.selectList("com.baseballtalk.database.BoardMapper.myteamBoard",mem_id);
		session.close();
		return	myteamBoard;
	}
	
	public List<FreeBoardDTO> myfreeBoard(String mem_id){
		
		SqlSession session = sqlSessionFactory.openSession(true);
		List<FreeBoardDTO> myfreeBoard = session.selectList("com.baseballtalk.database.BoardMapper.myfreeBoard",mem_id);
		session.close();
		return	myfreeBoard;
	}
	


}
