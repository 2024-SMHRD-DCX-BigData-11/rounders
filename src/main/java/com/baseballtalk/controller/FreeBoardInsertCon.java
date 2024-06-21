package com.baseballtalk.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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

@WebServlet("/FreeBoardInsertCon")
	
	public class FreeBoardInsertCon extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
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
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			String board_file = multi.getFilesystemName("board_file");
			System.out.println(board_file);
			String mem_id = multi.getParameter("mem_id");
			
			
			FreeBoardDTO freeBoard = new FreeBoardDTO(board_title, board_content, board_file, mem_id);
			System.out.println(freeBoard);
			
			int i_cnt = new BoardDAO().insertFreeBoard(freeBoard); //i_cnt = insert_cnt
			int getpoint = new MemberDAO().getPoint(mem_id);
			MemberDTO updatemem = login_member;
			getpoint += 20;
			System.out.println(getpoint);
			if(getpoint >= 200) {
				updatemem= new MemberDTO(login_member.getMem_id(),login_member.getMem_pw(),
						login_member.getMem_name(),login_member.getMem_nick(),login_member.getMem_tel(),
						login_member.getTeam_idx(),"minor",getpoint);
				int updategrade = new MemberDAO().updateGrade(updatemem);
			}else if(getpoint>=1000){
				updatemem= new MemberDTO(login_member.getMem_id(),login_member.getMem_pw(),
						login_member.getMem_name(),login_member.getMem_nick(),login_member.getMem_tel(),
						login_member.getTeam_idx(),"major",getpoint);
				int updategrade = new MemberDAO().updateGrade(updatemem);
			}else if(getpoint>=5000) {
				updatemem= new MemberDTO(login_member.getMem_id(),login_member.getMem_pw(),
						login_member.getMem_name(),login_member.getMem_nick(),login_member.getMem_tel(),
						login_member.getTeam_idx(),"allstar",getpoint);
				int updategrade = new MemberDAO().updateGrade(updatemem);
			}else if(getpoint>=10000) {
				updatemem= new MemberDTO(login_member.getMem_id(),login_member.getMem_pw(),
						login_member.getMem_name(),login_member.getMem_nick(),login_member.getMem_tel(),
						login_member.getTeam_idx(),"worldclass",getpoint);
				int updategrade = new MemberDAO().updateGrade(updatemem);
			}else {
				updatemem= new MemberDTO(login_member.getMem_id(),login_member.getMem_pw(),
						login_member.getMem_name(),login_member.getMem_nick(),login_member.getMem_tel(),
						login_member.getTeam_idx(),"rookie",getpoint);
				int updategrade = new MemberDAO().updateGrade(updatemem);
			}
			System.out.println(updatemem);
			int updatePoint = new MemberDAO().updatePoint(updatemem);
			System.out.println(updatePoint);
			session.setAttribute("login_member", updatemem);
			
			if(i_cnt == 1) {
				System.out.println("자유 게시판글 업로드 성공");
				response.sendRedirect("FreeBoard.jsp");
			}
			else {
				System.out.println("자유 게시판글 업로드 실패");
				response.sendRedirect("FreeBoard.jsp");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
}
					
			