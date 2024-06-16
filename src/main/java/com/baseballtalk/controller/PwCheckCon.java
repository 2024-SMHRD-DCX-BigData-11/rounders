package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.model.MemberDAO;


public class PwCheckCon{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputPw1 = request.getParameter("???");
		String inputPw2 = request.getParameter("???");
		
		System.out.println(inputPw1);
		System.out.println(inputPw2);
	
		boolean result = new MemberDAO().pwCheck(inputPw1, inputPw2);
		
		System.out.println(result);
		
		if(result) {
			// 비밀번호가 일치합니다.
		}
		else {
			// 비밀번호가 일치하지 않습니다.
		}
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
