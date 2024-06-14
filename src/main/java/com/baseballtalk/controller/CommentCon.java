package com.baseballtalk.controller;

import java.io.IOException;

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

@WebServlet("/BoardCon")
	
	public class CommentCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
			
			int comment_Num = Integer.parseInt(request.getParameter("comment_Num"));
			int board_Num = Integer.parseInt(request.getParameter("board_Num"));
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			int c_likes = Integer.parseInt(request.getParameter("c_likes"));
			String c_date = request.getParameter("c_date");
			
			System.out.println(comment_Num + "" + board_Num + "" + writer + "" + content + "" + c_date);
			
			RecoredCommentDTO recoredComment = new RecoredCommentDTO(comment_Num, board_Num, writer, content, c_date);
			
			FreeBoardCommentDTO freeBoardComment = new FreeBoardCommentDTO(comment_Num, board_Num, writer, content, c_date);
			
			TeamBoardCommentDTO teamBoardComment = new TeamBoardCommentDTO(comment_Num, board_Num, writer, content, c_date);
			
			// System.out.println(member.toString());
			
			int i_cnt1 = new CommentDAO().insertRecoredComment(recoredComment);//i_cnt = insert_cnt
			
			int i_cnt2 = new CommentDAO().insertFreeBoardComment(freeBoardComment); 
			
			int i_cnt3 = new CommentDAO().insertTeamBoardComment(teamBoardComment);
			
			if(i_cnt1 > 0) {
				System.out.println("자유게시판 댓글 달기 성공!!");
				
				response.sendRedirect("FreeBoardDetail.jsp");
			}
			else {
				System.out.println("자유게시판 댓글 달기 실패 ㅠㅠ");
			}
			
			response.sendRedirect("FreeBoardDetail.jsp");
			
		}

		
		}
					
			