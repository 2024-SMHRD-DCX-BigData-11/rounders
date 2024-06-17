
package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.MemberDTO;

@WebServlet("/PwCheckCon")
public class PwCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String pw = request.getParameter("pw");
		MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
		
		boolean result = true;
		if(pw.equals(login_member.getMem_pw())) {
			result = true;
		}else {
			result = false;
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
