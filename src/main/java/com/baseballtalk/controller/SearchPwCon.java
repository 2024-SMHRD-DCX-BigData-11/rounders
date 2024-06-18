package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;

@WebServlet("/SearchPwCon")
public class SearchPwCon extends HttpServlet{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("email");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		MemberDTO member = new MemberDTO(id, name, tel);
		
		System.out.println(id + " " + name + " " + tel);
	
		MemberDTO SearchPw = new MemberDAO().SerchPw(member);
		
		if(SearchPw != null) {
			System.out.println("비밀번호 찾기 성공!!");
			
			request.setAttribute("SearchPw", SearchPw);
			
			 RequestDispatcher rd = request.getRequestDispatcher("SearchPwSuccess.jsp");
			 rd.forward(request, response);
		}
		else {
			System.out.println("비밀번호 찾기 실패 ㅠㅠ");
		}
		
		response.sendRedirect("SerchPassword.jsp");
		
	}

}
