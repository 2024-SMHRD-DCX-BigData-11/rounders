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
import com.baseballtalk.model.TeamBoardDTO;
import com.baseballtalk.model.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.baseballtalk.model.BoardDAO;

@WebServlet("/BoardCon")
	
	public class BoardCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			// 파일 업로드를 위한 변수 설정
			// 1. request
			// 2. 파일을 저장할 경로(상대경로)
			String path = request.getServletContext().getRealPath("./file");
			System.out.println(path);
			
			// 3. 파일 허용 용량
			int maxSize = 10*1024*1024; // 10MB
			
			// 4. 인코딩 방식
			String encoding = "UTF-8";
			
			// 5. 중복제거
			DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
			
			MultipartRequest multi;
		try {
			
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			
			request.setCharacterEncoding("UTF-8");
			
			int board_Num = Integer.parseInt(multi.getParameter("board_Num"));
			int team_Num = Integer.parseInt(multi.getParameter("team_Num"));
			String category = multi.getParameter("category");
			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			String content = multi.getParameter("content");
			String filename = multi.getParameter("filename");
			int views = Integer.parseInt(multi.getParameter("views"));
			int likes = Integer.parseInt(multi.getParameter("likes"));;
			String b_date = multi.getParameter("b_date");
			
			NoticeBoardDTO noticeBoard = new NoticeBoardDTO(board_Num, category, title, writer, content, filename, views, b_date);
			
			FreeBoardDTO freeBoard = new FreeBoardDTO(board_Num, category, title, writer, content, filename, likes, views, b_date);
			
			TeamBoardDTO teamBoard = new TeamBoardDTO(board_Num, team_Num, category, title, writer, content, filename, views, likes, b_date);
			
			int i_cnt1 = new BoardDAO().insertNoticeBoard(noticeBoard); //i_cnt = insert_cnt
			
			int i_cnt2 = new BoardDAO().insertFreeBoard(freeBoard);
			
			int i_cnt3 = new BoardDAO().insertTeamBoard(teamBoard);
			
			if(i_cnt3 == 1) {
				System.out.println("팀게시글 업로드 성공");
				response.sendRedirect("NoticeBoard.jsp");
			}
			else {
				System.out.println("팀게시글 업로드 실패");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
}
					
			