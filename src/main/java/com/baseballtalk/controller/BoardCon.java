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
			
			int notice_idx = Integer.parseInt(multi.getParameter("notice_idx"));
			int board_idx = Integer.parseInt(multi.getParameter("board_idx"));
			int team_idx = Integer.parseInt(multi.getParameter("team_idx"));
			String notice_category = multi.getParameter("notice_category");
			String board_category = multi.getParameter("board_category");
			String notice_title = multi.getParameter("notice_title");
			String board_title = multi.getParameter("board_title");
			String notice_content = multi.getParameter("notice_content");
			String board_content = multi.getParameter("board_content");
			String created_at = multi.getParameter("created_at");
			int notice_views = Integer.parseInt(multi.getParameter("notice_views"));
			int board_views = Integer.parseInt(multi.getParameter("board_views"));
			int board_likes = Integer.parseInt(multi.getParameter("board_likes"));;
			String board_file = multi.getParameter("board_file");
			String mem_id = multi.getParameter("mem_id");
			
			NoticeBoardDTO noticeBoard = new NoticeBoardDTO(notice_idx, notice_title, notice_content, notice_views, mem_id, notice_category, created_at);
			
			FreeBoardDTO freeBoard = new FreeBoardDTO(board_idx, board_title, board_content, created_at, board_views, board_likes, board_file, mem_id);
			
			TeamBoardDTO teamBoard = new TeamBoardDTO(board_idx, team_idx, board_category, board_title, board_content, created_at, board_views, board_likes, board_file, mem_id);
			
			int i_cnt1 = new BoardDAO().insertNoticeBoard(noticeBoard); //i_cnt = insert_cnt
			
			int i_cnt2 = new BoardDAO().insertFreeBoard(freeBoard);
			
			int i_cnt3 = new BoardDAO().insertTeamBoard(teamBoard);
			
			if(i_cnt3 == 1) {
				System.out.println("팀게시글 업로드 성공");
				response.sendRedirect("test.jsp");
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
					
			