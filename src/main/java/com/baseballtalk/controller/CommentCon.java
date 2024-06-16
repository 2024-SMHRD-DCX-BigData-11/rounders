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

@WebServlet("/CommentCon")
	
	public class CommentCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
			
			int rcmt_idx = Integer.parseInt(request.getParameter("rcmt_idx"));
			int cmt_idx = Integer.parseInt(request.getParameter("cmt_idx"));
			int board_idx = Integer.parseInt(request.getParameter("board_idx"));
			String mem_id = request.getParameter("mem_id");
			String rcmt_content = request.getParameter("rcmt_content");
			String cmt_content = request.getParameter("cmt_content");
			String created_at = request.getParameter("create_at");
			
			System.out.println(rcmt_idx + "" + cmt_idx + "" + mem_id + "" + rcmt_content + "" + cmt_content + "" + created_at);
			
			RecoredCommentDTO recoredComment = new RecoredCommentDTO(rcmt_idx, rcmt_content, created_at, mem_id);
			
			FreeBoardCommentDTO freeBoardComment = new FreeBoardCommentDTO(cmt_idx, board_idx, cmt_content, created_at, mem_id);
			
			TeamBoardCommentDTO teamBoardComment = new TeamBoardCommentDTO(cmt_idx, board_idx, cmt_content, created_at, mem_id);
			
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
					
			