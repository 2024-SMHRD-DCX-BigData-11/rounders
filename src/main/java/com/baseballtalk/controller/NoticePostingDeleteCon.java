package com.baseballtalk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.BoardDAO;
import com.baseballtalk.model.MemberDAO;

@WebServlet("/NoticePostingDeleteCon")
	
	public class NoticePostingDeleteCon extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
			
			int cnt = new BoardDAO().deleteNoticeBoard(notice_idx);
			
			if(cnt == 1) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			response.sendRedirect("FreeBoard.jsp");
	}
}
