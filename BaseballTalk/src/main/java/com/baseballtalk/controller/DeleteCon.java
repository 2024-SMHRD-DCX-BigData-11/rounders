package com.baseballtalk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.frontcontroller.Command;
import com.baseballtalk.model.MemberDAO;

public class DeleteCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		// System.out.println(email);
		
		int cnt = new MemberDAO().delete(email);
	
		if(cnt == 1) {
			System.out.println("회원삭제 성공");
		}else {
			System.out.println("회원삭제 실패");
		}
		
		return "ShowMember.jsp";
	}

}
