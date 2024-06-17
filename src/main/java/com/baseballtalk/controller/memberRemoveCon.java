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

@WebServlet("/memberRemoveCon")
public class memberRemoveCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		MemberDTO member = (MemberDTO)session.getAttribute("login_member");
		int cnt = new MemberDAO().memberRemove(member);
		if(cnt == 1) {
			System.out.println("회원탈퇴 완료");
			session.removeAttribute("login_member");
		}else {
			System.out.println("회원탈퇴 실패");
		}
	}

}
