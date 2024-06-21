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

@WebServlet("/TeamPostingDeleteCon")
	
	public class TeamPostingDeleteCon extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int board_idx = Integer.parseInt(request.getParameter("board_idx"));
			int team_idx = Integer.parseInt(request.getParameter("team_idx"));
			int cnt = new BoardDAO().deleteTeamBoard(board_idx);
			
			if(cnt == 1) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			switch (team_idx) {
			case 1:
				response.sendRedirect("KiaTeamPage.jsp");
				break;
			case 2:
				response.sendRedirect("LgTeamPage.jsp");
				break;

			case 3:
				response.sendRedirect("SamsungTeamPage.jsp");
				break;

			case 4:
				response.sendRedirect("DoosanTeamPage.jsp");
				break;

			case 5:
				response.sendRedirect("SsgTeamPage.jsp");
				break;

			case 6:
				response.sendRedirect("NcTeamPage.jsp");
				break;

			case 7:
				response.sendRedirect("HanwhaTeamPage.jsp");
				break;

			case 8:
				response.sendRedirect("LotteTeamPage.jsp");
				break;

			case 9:
				response.sendRedirect("KtTeamPage.jsp");
				break;

			case 10:
				response.sendRedirect("KiwoomTeamPage.jsp");
				break;


			default:
				break;
			}
			
	}
}
