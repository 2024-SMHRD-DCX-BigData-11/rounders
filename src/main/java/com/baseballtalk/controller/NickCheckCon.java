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
		
		String input_nick = request.getParameter("input_nick");
		
		System.out.println(input_nick);
	
		boolean result = new MemberDAO().nickCheck(input_nick);
		
		System.out.println(result);
		
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
