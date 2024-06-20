package com.baseballtalk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.MemberDAO;

@WebServlet("/UpdateKakaoCon")
	
	public class UpdateKakaoCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
			int team_Num = Integer.parseInt(request.getParameter("team_Num"));
			
			 MemberDTO member = new MemberDTO(login_member.getMem_id(), login_member.getMem_pw(),login_member.getMem_name(), 
					 login_member.getMem_nick(),login_member.getMem_tel(), team_Num,login_member.getMem_grade(),login_member.getMem_point());
			 System.out.println(member.toString());
				 
				 int update_member = new MemberDAO().updateMemberTeam(member);
				
				if(update_member ==1) { System.out.println("정보 수정 성공!!");
				
				session.setAttribute("login_member", member);
				
				 response.sendRedirect("Main.jsp"); } else { System.out.println("회원정보 수정 실패ㅠㅠ");
				 response.sendRedirect("Main.jsp"); }
			 
			
		}

	}
