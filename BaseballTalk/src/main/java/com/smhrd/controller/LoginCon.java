package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class LoginCon implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
	
		Member member = new Member(email, pw);
	
		Member login_member = new MemberDAO().login(member);
		
		if(login_member != null) {
			// 로그인 성공
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("login_member", login_member);
		}else {
			// 로그인 실패
			System.out.println("로그인 실패..");
		}
		
		// response.sendRedirect("Main.jsp");
		return "Main.jsp";
		
	}
	

}
