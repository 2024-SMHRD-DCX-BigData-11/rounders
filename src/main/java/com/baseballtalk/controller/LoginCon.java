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

@WebServlet("/LoginCon")
	
	public class LoginCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("email");
			String pw = request.getParameter("pw");
			
			// System.out.println(id + " " + pw);
			
			MemberDTO member = new MemberDTO(id, pw);
			
			//System.out.println(member.toString());
			
			MemberDTO login_member = new MemberDAO().login(member);
			
			if(login_member != null) {
				System.out.println("로그인 성공!!");
				
				HttpSession session = request.getSession();
				
				session.setAttribute("login_member", login_member);
			}
			else {
				System.out.println("로그인 실패ㅠㅠ");
			}
			
			response.sendRedirect("test.jsp");
			
		}

	}
