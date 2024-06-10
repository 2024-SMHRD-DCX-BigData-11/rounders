package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.frontcontroller.Command;
import com.baseballtalk.model.MemberDAO;

public class EmailCheckCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String inputEmail = request.getParameter("inputEmail");
		
		System.out.println(inputEmail);
	
		boolean result1 = new MemberDAO().emailCheck(inputEmail);
		
		System.out.println(result1);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
