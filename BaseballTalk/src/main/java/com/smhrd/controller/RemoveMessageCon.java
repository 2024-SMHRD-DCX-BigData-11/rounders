package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MessageDAO;

public class RemoveMessageCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
	
 		int cnt = new MessageDAO().deleteAllMessage(email);
 		
 		if(cnt >= 1) {
 			System.out.println("메세지 전체 삭제 성공!");
 			return "Main.jsp";
 		}else {
 			System.out.println("메세지 삭제 실패...");
 			return "Main.jsp";
 		}
		
		
		
	}

}
