package com.baseballtalk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baseballtalk.model.MemberDTO;
import com.baseballtalk.model.PlayerDTO;
import com.baseballtalk.model.HotPlayerDAO;
import com.baseballtalk.model.HotPlayerDTO;
import com.baseballtalk.model.MatchDAO;
import com.baseballtalk.model.MatchDTO;
import com.baseballtalk.model.MemberDAO;

@WebServlet("/HotplayerCon")

public class HotPlayerCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		int idx = Integer.parseInt(request.getParameter("index"));
		MemberDTO login_member = (MemberDTO) session.getAttribute("login_member");
		String selectPlayer = request.getParameter("player");
		PrintWriter out = response.getWriter();
		if(selectPlayer == null) {
			out.println("<script>alert('선수를 선택하셔야 합니다.');" + "location.href='Hotplayer.jsp';</script>");
		}
		String[] s_player = selectPlayer.split(",");
		
		int player_idx = Integer.parseInt(s_player[0]);
		
		System.out.println(login_member);

		if (login_member == null) {
			out.println("<script>alert('로그인이 필요한 서비스입니다.');" + "location.href='Login.jsp';</script>");
		} else if (login_member != null) {
			String time = new MatchDAO().match_time(idx);

			if (time.contains("종료")) {
				out.println("<script>alert('해당 경기는 종료되었습니다.');" + "location.href='Hotplayer.jsp';</script>");
			} else if (time.contains("취소")) {
				out.println("<script>alert('해당 경기는 취소되었습니다.');" + "location.href='Hotplayer.jsp';</script>");
			} else if (time.contains("회")) {
				out.println("<script>alert('진행중인 경기입니다.');" + "location.href='Hotplayer.jsp';</script>");
			} else {
				Date today = new Date();
				String to = today.toString();
				Calendar now = Calendar.getInstance();
				time = now.get(Calendar.YEAR) + "-" +  time;
				SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date date = null;
				try {
					date = fo.parse(time);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				System.out.println(date);
				System.out.println(today);

				int compare = date.compareTo(today);
				System.out.println(compare);
				if (compare < 0) {
					out.println("<script>alert('투표가 불가능합니다.');" + "location.href='Hotplayer.jsp';</script>");
				} else {
					boolean result1 = new HotPlayerDAO().VoteCheck(login_member.getMem_id());

					if (result1 == true) {
						out.println("<script>alert('중복투표는 불가능합니다.');" + "location.href='Hotplayer.jsp';</script>");
					} else {
						HotPlayerDTO hotPlayer = new HotPlayerDTO(login_member.getMem_id(), player_idx);
						int insert_hotPlayer = new HotPlayerDAO().insertHotPlayer(hotPlayer);
						if (insert_hotPlayer > 0) {
							int player_likes = new HotPlayerDAO().selectLikes(player_idx);
							player_likes+=1;
							PlayerDTO player = new PlayerDTO(player_idx, player_likes);
							System.out.println(player);
							int cnt = new HotPlayerDAO().updateLikes(player);
							if(cnt == 1) {
							out.println("<script>alert('투표가 완료되었습니다.');" + "location.href='Hotplayer.jsp';</script>");
							}else {
							out.println("<script>alert('투표 오류가 발생했습니다.');" + "location.href='Hotplayer.jsp';</script>");
							}
						} else {
							out.println("<script>alert('투표에 실패했습니다. 다시 시도해주세요.');"
									+ "location.href='Hotplayer.jsp';</script>");
						}
					}
				}

			}
		}
	}
}
