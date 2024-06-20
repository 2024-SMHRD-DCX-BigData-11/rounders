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

@WebServlet("/UpdateCon")
	
	public class UpdateCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			session.getAttribute("login_member");
			MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
			String id = login_member.getMem_id();
			String pw = request.getParameter("update_pw");
			String nick = request.getParameter("update_nick");
			String tel = request.getParameter("update_tel");
			int team_Num = Integer.parseInt(request.getParameter("team_Num"));
			
			System.out.println(id + "" + pw + "" + nick + "" + tel + "" + team_Num);
			System.out.println(nick);
			
			 MemberDTO member = new MemberDTO(id, pw,login_member.getMem_name(), nick,
					 tel, team_Num,login_member.getMem_grade(),login_member.getMem_point());
			 System.out.println(member.toString());
				 
				 int update_member = new MemberDAO().updateMember(member);
				
				if(update_member ==1) { System.out.println("정보 수정 성공!!");
				
				session.setAttribute("login_member", member);
				
				 response.sendRedirect("Main.jsp"); } else { System.out.println("회원정보 수정 실패ㅠㅠ");
				 response.sendRedirect("Main.jsp"); }
			 
			
		}

	}
