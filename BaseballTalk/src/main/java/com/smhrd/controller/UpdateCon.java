package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member update_member = new Member(email, pw, tel, address);
		
		int cnt = new MemberDAO().update(update_member);
		
		if(cnt == 1) {
			System.out.println("회원정보 수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("login_member", update_member);
			
		}else {
			System.out.println("회원정보 수정 실패..");
		}
	
		return "Main.jsp";
		
		
		
	}

}
