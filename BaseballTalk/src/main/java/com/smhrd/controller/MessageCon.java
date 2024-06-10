package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Message;
import com.smhrd.model.MessageDAO;

public class MessageCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String sender = request.getParameter("sender");
		String recipient = request.getParameter("recipient");
		String message = request.getParameter("message");
		
		// System.out.println(sender + recipient + message);
 		Message m = new Message(sender, recipient, message);
 		
 		int cnt = new MessageDAO().insertMessage(m);
 		
 		if(cnt == 1) {
 			System.out.println("메세지 전송 성공!");
 			return "Main.jsp";
 		}else {
 			System.out.println("메세지 전송 실패..");
 			return "Main.jsp";
 		}
		
		
	}

}
