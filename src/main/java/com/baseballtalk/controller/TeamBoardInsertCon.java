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

@WebServlet("/TeamBoardInsertCon")
	
	public class TeamBoardInsertCon extends HttpServlet {


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
			
			int board_idx = Integer.parseInt(multi.getParameter("board_idx"));
			int team_idx = Integer.parseInt(multi.getParameter("team_idx"));
			String board_category = multi.getParameter("board_category");
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			String board_file = multi.getParameter("board_file");
			String mem_id = multi.getParameter("mem_id");
			
			TeamBoardDTO TeamBoard = new TeamBoardDTO(board_idx, team_idx, board_category, board_title, board_content, board_file, mem_id);
			
			int i_cnt = new BoardDAO().insertTeamBoard(TeamBoard); //i_cnt = insert_cnt
			
			
			if(i_cnt > 0 && team_idx == 1) {
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("KiaTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 2){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("LgTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 3){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("SamsungTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 4){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("DoosanTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 5){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("SsgTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 6){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("NcTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 7){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("HanwhaTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 8){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("LotteTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 9){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("KtTeamPage.jsp");
			}
			else if(i_cnt > 0 && team_idx == 10){
				System.out.println("팀 게시글 업로드 성공");
				response.sendRedirect("KiwoomTeamPage.jsp");
			}
			else {
				System.out.println("팀 게시글 업로드 실패");
				System.out.println("TeamPosingWrite.jsp");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
}
					
			