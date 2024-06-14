package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;


public class SearchPwCon{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		MemberDTO member = new MemberDTO(id, name, tel);
		
		System.out.println(id + " " + name + " " + tel);
	
		int SearchPw = new MemberDAO().SerchPw(member);
		
		if(SearchPw > 0) {
			System.out.println("비밀번호 찾기 성공!!");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("SearchPw", SearchPw);
			
			response.sendRedirect("searchPwSuccess.jsp");
			
			
		}
		else {
			System.out.println("비밀번호 찾기 실패 ㅠㅠ");
		}
		
		response.sendRedirect("Login.jsp");
		
	}

}
