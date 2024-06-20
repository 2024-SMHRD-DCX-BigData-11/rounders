package com.baseballtalk.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.BoardDAO;
import com.baseballtalk.model.FreeBoardDTO;
import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;

@WebServlet("/FreeUpCon")
public class FreeUpCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberDTO l_mem = (MemberDTO)session.getAttribute("login_member");
		if(l_mem == null) {
			out.println("<script>alert('로그인이 필요한 서비스입니다.');" + "location.href='Login.jsp';</script>");
		}else {
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		int Likes = new BoardDAO().showFreeLike(board_idx);
		Likes++;
		FreeBoardDTO frbd = new FreeBoardDTO("", board_idx, Likes);
		int cnt = new BoardDAO().updateFreeLikes(frbd);
		System.out.println(cnt);
		MemberDTO mem = new BoardDAO().showFreeWriter(board_idx);
		int getpoint = new MemberDAO().getPoint(mem.getMem_id());
		getpoint += 5;
		System.out.println(getpoint);
		MemberDTO updatemem = mem;
		if(getpoint >= 200) {
			updatemem= new MemberDTO(mem.getMem_id(),mem.getMem_pw(),
					mem.getMem_name(),mem.getMem_nick(),mem.getMem_tel(),
					mem.getTeam_idx(),"minor",getpoint);
			int updategrade = new MemberDAO().updateGrade(updatemem);
		}else if(getpoint>=1000){
			updatemem= new MemberDTO(mem.getMem_id(),mem.getMem_pw(),
					mem.getMem_name(),mem.getMem_nick(),mem.getMem_tel(),
					mem.getTeam_idx(),"major",getpoint);
			int updategrade = new MemberDAO().updateGrade(updatemem);
		}else if(getpoint>=5000) {
			updatemem= new MemberDTO(mem.getMem_id(),mem.getMem_pw(),
					mem.getMem_name(),mem.getMem_nick(),mem.getMem_tel(),
					mem.getTeam_idx(),"allstar",getpoint);
			int updategrade = new MemberDAO().updateGrade(updatemem);
		}else if(getpoint>=10000) {
			updatemem= new MemberDTO(mem.getMem_id(),mem.getMem_pw(),
					mem.getMem_name(),mem.getMem_nick(),mem.getMem_tel(),
					mem.getTeam_idx(),"worldclass",getpoint);
			int updategrade = new MemberDAO().updateGrade(updatemem);
		}else {
			updatemem= new MemberDTO(mem.getMem_id(),mem.getMem_pw(),
					mem.getMem_name(),mem.getMem_nick(),mem.getMem_tel(),
					mem.getTeam_idx(),"rookie",getpoint);
			int updategrade = new MemberDAO().updateGrade(updatemem);
		}
		System.out.println(updatemem);
		int updatePoint = new MemberDAO().updatePoint(updatemem);
		if(updatePoint == 1) {
			System.out.println("추천성공");
		}else {
			System.out.println("추천실패");
		}
		response.sendRedirect("FreeBoardPostingDetail.jsp?board_idx="+board_idx);
		
		}

}
}
