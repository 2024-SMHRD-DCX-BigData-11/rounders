package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.model.MemberDAO;


public class NickCheckCon{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputNick = request.getParameter("inputNick");
		
		System.out.println(inputNick);
	
		boolean result = new MemberDAO().nickCheck(inputNick);
		
		System.out.println(result);
		
		if(result) {
			// 사용가능한 닉네임 입니다.
		}
		else {
			// 사용중인 닉네임 입니다.
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
