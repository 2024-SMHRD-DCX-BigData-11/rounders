package com.baseballtalk.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;

@WebServlet("/kakaologin")
public class kakaologin extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		
		System.out.println(email + " " + nick);
		
		MemberDTO member = new MemberDTO("k-"+email, "0","k-"+nick, "k-"+nick, "0", 1);
		MemberDTO kakao_member = new MemberDAO().login(member);
		System.out.println(member.toString());
		System.out.println(kakao_member);
		if(kakao_member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login_member",kakao_member);
		}else{
			int cnt = new MemberDAO().join(member);
			if(cnt == 1) {
				System.out.println("카카오 가입 성공");
			}else {
				System.out.println("카카오 가입 실패");
			}
		}
	}
}

