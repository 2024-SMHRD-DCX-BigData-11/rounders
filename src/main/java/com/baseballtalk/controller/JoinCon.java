package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.MemberDAO;

@WebServlet("/JoinCon")
	
	public class JoinCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("email");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String nick = request.getParameter("nick");
			String tel = request.getParameter("tel");
			int team_Num = Integer.parseInt(request.getParameter("team_Num"));
			
			System.out.println(id + "" + pw + "" + name + "" + nick + "" + tel + "" + team_Num);
			System.out.println(nick);
			
			 MemberDTO member = new MemberDTO(id, pw, name, nick, tel, team_Num);
			 PrintWriter out = response.getWriter();
			 System.out.println(member.toString());
				
				System.out.println(member.toString());
				 
				 int join_member = new MemberDAO().join(member);
				
				if(join_member > 0) { System.out.println("회원가입 성공!!");
				
				HttpSession session = request.getSession();
				
				session.setAttribute("join_member", join_member);
				
				out.println("<script>alert('회원가입 성공!!');" + "location.href='Login.jsp';</script>");} else { System.out.println("회원가입 실패ㅠㅠ");
				 out.println("<script>alert('회원가입에 실패하였습니다.');" + "location.href='Join.jsp';</script>");
				 }
			 
			
		}

	}
