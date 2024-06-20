package com.baseballtalk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.BoardDAO;
import com.baseballtalk.model.CommentDAO;
import com.baseballtalk.model.FreeBoardCommentDTO;
import com.baseballtalk.model.FreeBoardDTO;
import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.NoticeBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FreeBoardUpdateCon")
public class FreeBoardUpdateCon extends HttpServlet {
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
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			String board_file = multi.getParameter("board_file");
			String mem_id = multi.getParameter("mem_id");
			int board_idx = Integer.parseInt(request.getParameter("board_idx"));
			
			FreeBoardDTO nb = new BoardDAO().FreeDetail(board_idx);
			System.out.println(board_idx);
			FreeBoardDTO freeBoard = new FreeBoardDTO(board_idx,board_title, board_content, nb.getMem_id());
			System.out.println(freeBoard);
			int i_cnt = new BoardDAO().updateFreeBoard(freeBoard); //i_cnt = insert_cnt
			
			System.out.println(board_title + " " + board_content + " " + nb.getMem_id());
			
			
			if(i_cnt == 1) {
				System.out.println("공지사항 게시글 수정 성공");
				response.sendRedirect("FreeBoardPostingDetail.jsp?board_idx="+board_idx);
			}
			else {
				System.out.println("공지사항 게시글 수정 실패");
				response.sendRedirect("FreeBoardPostingDetail.jsp?board_idx="+board_idx);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}		
	}
