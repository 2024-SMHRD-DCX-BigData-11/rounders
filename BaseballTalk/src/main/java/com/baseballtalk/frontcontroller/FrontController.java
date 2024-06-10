package com.baseballtalk.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.controller.BoardCon;
import com.baseballtalk.controller.DeleteCon;
import com.baseballtalk.controller.EmailCheckCon;
import com.baseballtalk.controller.JoinCon;
import com.baseballtalk.controller.LoginCon;
import com.baseballtalk.controller.LogoutCon;
import com.baseballtalk.controller.MessageCon;
import com.baseballtalk.controller.RemoveMessageCon;
import com.baseballtalk.controller.UpdateCon;
import com.baseballtalk.model.Board;
import com.baseballtalk.model.BoardDAO;
import com.baseballtalk.model.Member;
import com.baseballtalk.model.MemberDAO;
import com.baseballtalk.model.Message;
import com.baseballtalk.model.MessageDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("*.do")
public class FrontController extends HttpServlet {


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// url mapping 값 : *.do
		// * : 전체
		// .do : .do 라는 확장자가 붙으면 전부 FrontController로 모이게 된다.
		System.out.println("FrontController");
		
		request.setCharacterEncoding("UTF-8");
		
		// 어디서 요청이 들어왔는지 확인
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		
		// ContextPath 확인
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		
		
		// 문자열 자르기(substring)
		String result = requestURI.substring(contextPath.length()+1);
		System.out.println("요청 서블릿 : " + result);
		
		
		Command service = null;
		
		if(result.equals("LoginCon.do")) {
			
			service = new LoginCon();
		}
		
		else if(result.equals("JoinCon.do")) {
			
			service = new JoinCon();
			
		}
		
		else if(result.equals("LogoutCon.do")) {
			
			service = new LogoutCon();
		
		}
		
		else if(result.equals("EmailCheckCon.do")) {
			
			service = new EmailCheckCon();
			
		}
		
		else if(result.equals("DeleteCon.do")) {
			
			service = new DeleteCon();
			
		}
		
		else if(result.equals("BoardCon.do")) {
			
			service = new BoardCon();
			
		}
		
		else if(result.equals("MessageCon.do")) {
			
			service = new MessageCon();
			
		}
		
		else if(result.equals("RemoveMessageCon.do")) {
			
			service = new RemoveMessageCon();
				
		}
		
		else if(result.equals("UpdateCon.do")) {
			
			service = new UpdateCon();
			
		}
		
		
		String moveURI = service.execute(request, response);
		if(moveURI != null) {
			response.sendRedirect(moveURI);
		}
		
			
				
		}
	}

