package com.baseballtalk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.FreeBoardDTO;
import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.NoticeBoardDTO;
import com.baseballtalk.model.RecoredCommentDTO;
import com.baseballtalk.model.TeamBoardCommentDTO;
import com.baseballtalk.model.TeamBoardDTO;
import com.baseballtalk.model.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.baseballtalk.model.BoardDAO;
import com.baseballtalk.model.CommentDAO;
import com.baseballtalk.model.FreeBoardCommentDTO;
import com.baseballtalk.model.TeamBoardCommentDTO;

@WebServlet("/CommentCon")
	
	public class CommentCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
			
			int board_idx = Integer.parseInt(request.getParameter("board_idx"));
			String mem_id = request.getParameter("nick");
			String cmt_content = request.getParameter("cmt_content");
			
			System.out.println(mem_id + "" + cmt_content);
			
			
			
			FreeBoardCommentDTO freeBoardComment = new FreeBoardCommentDTO(board_idx, cmt_content, mem_id);
			
			TeamBoardCommentDTO teamBoardComment = new TeamBoardCommentDTO(board_idx, cmt_content, mem_id);
			
			// System.out.println(member.toString());
			
			
			int i_cnt1 = new CommentDAO().insertFreeBoardComment(freeBoardComment); //i_cnt = insert_cnt
			
			int i_cnt2 = new CommentDAO().insertTeamBoardComment(teamBoardComment);
			
			
			if(i_cnt1 > 0) {
				System.out.println("댓글 작성 성공!!");
				String stat = (String)request.getParameter("stat");
				System.out.println(stat);
				RequestDispatcher rd1 = request.getRequestDispatcher("Hitter_stat.jsp");
			}else {
				System.out.println("댓글 작성 실패...ㅠㅠ");
				RequestDispatcher rd2 = request.getRequestDispatcher("Hitter_stat.jsp");
	
			}
			
			int u_cnt1 = new CommentDAO().updateFreeBoardComment(freeBoardComment);
			int u_cnt2 = new CommentDAO().updateTeamBoardComment(teamBoardComment);
			
			if(u_cnt1 > 0) {
				System.out.println("댓글 수정 성공!!");
				RequestDispatcher rd1 = request.getRequestDispatcher("Hitter_stat.jsp");
			}else {
				System.out.println("댓글 수정 실패...ㅠㅠ");
				RequestDispatcher rd2 = request.getRequestDispatcher("Hitter_stat.jsp");
	
			}
			
			int d_cnt1 = new CommentDAO().deleteFreeBoardComment(freeBoardComment);
			int d_cnt2 = new CommentDAO().deleteTeamBoardComment(teamBoardComment);
			
			if(d_cnt1 > 0) {
				System.out.println("댓글 수정 성공!!");
				RequestDispatcher rd1 = request.getRequestDispatcher("Hitter_stat.jsp");
			}else {
				System.out.println("댓글 수정 실패...ㅠㅠ");
				RequestDispatcher rd2 = request.getRequestDispatcher("Hitter_stat.jsp");
	
			}
			
			
		}

		
		}
					
			