package com.baseballtalk.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.frontcontroller.Command;
import com.baseballtalk.model.Member;
import com.baseballtalk.model.MemberDAO;

public class JoinCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
	
		Member member = new Member(email, pw, tel, address);
		
		int cnt = new MemberDAO().join(member);
		
		if(cnt == 1) {
			System.out.println("회원가입 성공!!");
			RequestDispatcher rd = request.getRequestDispatcher("JoinSuccess.jsp");
			// request.setAttribute("email", member.getEmail());
			// rd.forward(request, response);
			return "JoinSuccess.jsp?email="+member.getEmail();
		}else {
			System.out.println("회원가입 실패..");
			return "Main.jsp";
		}
		
	}

}
