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

@WebServlet("/RecoredCommentDeleteCon")
	
	public class RecoredCommentDeleteCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
			

			String rcmt_content = request.getParameter("rcmt_content");
			

			System.out.println("rcmt_content : " + rcmt_content);
			
			RecoredCommentDTO recoredComment = new RecoredCommentDTO(rcmt_content);
						
			
			
			int d_cnt = new CommentDAO().deleteRecoredComment(recoredComment);
			
			if(d_cnt > 0) {
				System.out.println("기록페이지 댓글 수정 성공!!");
				RequestDispatcher rd1 = request.getRequestDispatcher("Hitter_stat.jsp");
			}else {
				System.out.println("기록페이지 댓글 수정 실패...ㅠㅠ");
				RequestDispatcher rd2 = request.getRequestDispatcher("Hitter_stat.jsp");
	
			}
			
			
		}

		
		}
					
			