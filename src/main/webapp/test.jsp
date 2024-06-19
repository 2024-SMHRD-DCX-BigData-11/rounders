<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.TeamDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@page import="com.baseballtalk.model.RankDAO"%>
<%@page import="com.baseballtalk.model.RankDTO"%>
<%@page import="com.baseballtalk.model.MatchDAO"%>
<%@page import="com.baseballtalk.model.MatchDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>베이스볼톡</title>
<link href="./css/Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	List<MatchDTO> match = new MatchDAO().View();
	List<RankDTO> rank = new RankDAO().View();
	MemberDTO member = (MemberDTO) session.getAttribute("login_member");
	List<TeamBoardDTO> teamboard = new BoardDAO().selectTeamBoard();
	%>
	<div id="wrap1">
		<div id="rank">
			<div id="rank_name" style="background-color: #f07d0c">팀순위</div>
			<table class="rank_box">
				<thead class="table_th">
					<th>순위</th>
					<th>팀</th>
					<th>G</th>
					<th>승</th>
					<th>무</th>
					<th>패</th>
					<th>승차</th>
					<th>승률</th>
					<th>득점</th>
					<th>실점</th>
				</thead>
				<tbody>
				<%for(RankDTO rk : rank){%>
					<tr>
						<td><%=rk.getTeam_rank() %></td>
						<td><%=rk.getTeam_name() %></td>
						<td><%=rk.getGame_playerd() %></td>
						<td><%=rk.getTeam_win() %></td>
						<td><%=rk.getTeam_drw() %></td>
						<td><%=rk.getTeam_lose() %></td>
						<td><%=rk.getGame_behind() %></td>
						<td><%=rk.getWin_percentage()%></td>
						<td><%=rk.getRun_score() %></td>
						<td><%=rk.getLose_score() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		<div id="wrap1_sub">
			<div id="schedule_wrap">
				<table>
					<tr>
						<th colspan="3" id="match_date">오늘의 경기<br> <span><%=match.get(0).getMatch_date()%></span></th>
					</tr>
					<%for(MatchDTO mt : match) {%>
						<tr>
							<td><span class="team"><%=mt.getAway_team() %></span><br>
								<span class="pitcher"><%=mt.getAway_pitcher() %></span></td>
							<td><%=mt.getMatch_time() %></td>
							<td><span class="team"><%=mt.getHome_team() %></span><br>
								<span class="pitcher"><%=mt.getHome_pitcher() %></span></td>
						</tr>
					<%} %>
				</table>
			</div>
			<div id="hotplayer">
				<div id="rank_name" style="background-color: #f07d0c"><a href="hotplayer.jsp" style="color:black">지금 핫한 선수</a></div>
				<div id="hotplayer_link"><a href="test.jsp?view=1">전체</a><a href="test.jsp?view=2">my</a></div>
				<div class="hp_wrap">
					<div class="player">
						<div class ="p_rank">순위</div>
						<div class="p_name">
							<span>선수이름</span>
						</div>
						<div class="p_info">
							<div class="p_img">
								<img src="./image/kia.svg">
							</div>
							<div class="p_detail">
								<div>팀</div>
								<div>포지션</div>
								<div>등번호</div>
							</div>
						</div>
						<div class="vote">투표수</div>
					</div>
					<div class="player">
						<div class ="p_rank">순위</div>
						<div class="p_name">
							<span>선수이름</span>
						</div>
						<div class="p_info">
							<div class="p_img">
								<img src="./image/kia.svg">
							</div>
							<div class="p_detail">
								<div>팀</div>
								<div>포지션</div>
								<div>등번호</div>
							</div>
						</div>
						<div class="vote">투표수</div>
					</div>
					<div class="player">
						<div class ="p_rank">순위</div>
						<div class="p_name">
							<span>선수이름</span>
						</div>
						<div class="p_info">
							<div class="p_img">
								<img src="./image/kia.svg">
							</div>
							<div class="p_detail">
								<div>팀</div>
								<div>포지션</div>
								<div>등번호</div>
							</div>
						</div>
						<div class="vote">투표수</div>
					</div>
				</div>
			</div>
		</div>

			<div id="hot_board">
				<div id="rank_name" style="background-color: #f07d0c">핫게시글</div>
				<table class="hot_board_box">
					<thead class="table_th">
						<th>게시판</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성시간</th>
						<th>조회</th>
						<th colspan="5">추천</th>
					</thead>
					<tbody>
					<%for(TeamBoardDTO tb:teamboard){ 
					int idx = tb.getTeam_idx();
					String team_name = new TeamDAO().getTeamName(idx);
					String nick = new MemberDAO().getNick(tb.getMem_id());
					%>
						<tr>
							<td><%= team_name%></td>
							<td><%= tb.getBoard_title()%></td>
							<td><%= nick %></td>
							<td><%= tb.getCreated_at() %></td>
							<td><%= tb.getBoard_views() %></td>
							<td><%= tb.getBoard_likes() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 팀 로고 클릭 시 팀게시판으로 링크 윗줄 5개 'team_wrap01' -->
		<div id="warp2">
			<div class='team_wrap01'>
				<div class='team_board'>
					<a href="#"> <img src="./image/kia.svg" alt="기아로고" id="kia">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/samsung.svg" alt="삼성로고"
						id="samsung">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/lotte.svg" alt="롯데로고" id="lotte">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/nc.svg" alt="엔씨로고" id="nc">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/kt.svg" alt="케이티로고" id="kt">
					</a>
				</div>
			</div>

			<!--       팀 로고 두번째 줄 5개  'team_wrap02'      -->
			<div class='team_wrap02'>
				<div class='team_board'>
					<a href="#"> <img src="./image/hanwha.svg" alt="한화로고"
						id="hanwha">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/kiwoom.svg" alt="키움로고"
						id="kiwoom">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/doosan.svg" alt="두산로고"
						id="doosan">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/lg.svg" alt="엘지로고" id="lg">
					</a>
				</div>
				<div class='team_board'>
					<a href="#"> <img src="./image/ssg.svg" alt="에스에스지로고" id="ssg">
					</a>
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="Footer.jsp"%>
		</div>

		
</body>

</html>