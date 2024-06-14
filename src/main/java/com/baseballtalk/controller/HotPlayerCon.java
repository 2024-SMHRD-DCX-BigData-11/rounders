package com.baseballtalk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.HotPlayerDAO;
import com.baseballtalk.model.HotPlayerDTO;
import com.baseballtalk.model.MemberDAO;

@WebServlet("/HotplayerCon")
	
	public class HotPlayerCon extends HttpServlet {


		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			
			int hot_pid = Integer.parseInt(request.getParameter("hot_pid"));
			String id = request.getParameter("nick");
			int player_id = Integer.parseInt(request.getParameter("player_id"));
			String v_date = request.getParameter("v_date");
			
			
			
			HotPlayerDTO hotPlayer = new HotPlayerDTO(hot_pid, id, player_id, v_date);
			
			int insert_hotPlayer = new HotPlayerDAO().insertHotPlayer(hotPlayer);
			
			if(insert_hotPlayer > 0) {
				System.out.println("투표 성공!!");
				
				HttpSession session = request.getSession();
				
				session.setAttribute("HotPlayer", hotPlayer);
			}
			else {
				System.out.println("투표 실패 ㅠㅠ");
			}
			
			response.sendRedirect("HotPlayer.jsp");
			
		}

	}
