package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.model.MemberDAO;

@WebServlet("/NickCheckCon")
public class NickCheckCon extends HttpServlet{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setCharacterEncoding("UTF-8");
		
		String input_nick = request.getParameter("nick");
		
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
