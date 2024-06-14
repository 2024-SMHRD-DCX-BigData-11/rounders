package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.model.MatchDTO;
import com.baseballtalk.model.TestDAO;

@WebServlet("/TestCon")
public class TestCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		List<MatchDTO> match = new TestDAO().View();

		RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
		request.setAttribute("match", match);
		rd.forward(request, response);
	}

}
