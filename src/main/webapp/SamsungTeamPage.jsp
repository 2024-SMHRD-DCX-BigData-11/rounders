<%@page import="com.baseballtalk.model.MatchDAO"%>
<%@page import="com.baseballtalk.model.MatchDTO"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼성 팀 페이지</title>
<link href="./css/TeamPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	List<TeamBoardDTO> showSamsungBoard = new BoardDAO().showSamsungBoard();
	MatchDTO mymatch = new MatchDAO().myView(3);
	
	String category = request.getParameter("category");
	if(category != null){
	if(category.equals("전체")){
		category = "전체";
		System.out.println(category);
		showSamsungBoard = new BoardDAO().showKiaBoard();
	}else if(category.equals("잡담")){
		category = "잡담";
		System.out.println(category);
		TeamBoardDTO myboard= new TeamBoardDTO(category,3);
		showSamsungBoard = new BoardDAO().selectTeamBoardCategory(myboard);
	}
	else if(category.equals("정보")){
		category = "정보";
		TeamBoardDTO myboard= new TeamBoardDTO(category,3);
		showSamsungBoard = new BoardDAO().selectTeamBoardCategory(myboard);
	}
	else if(category.equals("직관모임")){
		category = "직관모임";
		TeamBoardDTO myboard= new TeamBoardDTO(category,3);
		showSamsungBoard = new BoardDAO().selectTeamBoardCategory(myboard);
	}
	System.out.println(category);
	}
	
	
	%>
	<%@ include file="header.jsp"%>
	<div class="container">
		<img alt="logo" src="./image/samsungimg.png" class="img">
		<div id="smhrd">
			<div id="sm_logo">
				<a target="_blank" href="https://smhrd.or.kr/"> <img alt="logo"
					src="./image/sm.jpg" id="img">
				</a>
				<div id="sm_text">
					<p>↑↑↑↑↑↑↑↑↑↑↑↑</p>
					<p>개발자가 되고싶다면!!</p>
				</div>
			</div>
		</div>
	</div>

	<div class="wrap">
		<div class="all">
			<div class="left">
				<div id="team">
					<h1>
						삼성 라이온즈 게시판 <select>
							<option value="SamsungTeamPage.jsp?category=전체">전체</option>
							<option value="SamsungTeamPage.jsp?category=잡담">잡담</option>
							<option value="SamsungTeamPage.jsp?category=정보">정보</option>
							<option value="SamsungTeamPage.jsp?category=직관모임">직관모임</option>
						</select>
					</h1>
					<table class="table">
						<span style="color: red">!! 지금 핫한 게시물 !! >>></span>
						<colgroup>
							<col width="60px">
							<col width>
							<col width="50px">
							<col width="110px">
							<col width="70px">
							<col width="50px">
						</colgroup>
						<thead>
							<tr>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
								<th>좋아요</th>
								<th>첨부파일</th>
							</tr>
						</thead>
						<%
						for (TeamBoardDTO tb : showSamsungBoard) {
						%>
						<%
						String mem_nick = new MemberDAO().getNick(tb.getMem_id());
						%>
						<tbody>
							<tr>
								<td><%=tb.getBoard_category()%></td>
								<td
									onclick="location.href='TeamBoardPostingDetail.jsp?board_idx=<%=tb.getBoard_idx()%>'"><%=tb.getBoard_title()%></td>
								<td><%=mem_nick%></td>
								<td><%=tb.getCreated_at()%></td>
								<td><%=tb.getBoard_views()%></td>
								<td><%=tb.getBoard_likes()%></td>
								<td><%=tb.getBoard_file()%></td>
							</tr>
						</tbody>
						<%
						}
						%>
					</table>
				</div>
			</div>
			<div class="right">
				<div class="rightone">
					<table id="schedule_wrap" style="border: 3px solid #ea0029">
						<tr>
							<th colspan="3" id="match_date">오늘의 경기<br> <span><%=mymatch.getMatch_date() %></span></th>
						</tr>
							<tr>
								<td><span class="team"><%=mymatch.getAway_team() %></span><br>
									<span class="pitcher"><%=mymatch.getAway_pitcher() %></span></td>
								<td><%=mymatch.getMatch_time() %></td>
								<td><span class="team"><%= mymatch.getHome_team() %></span><br>
									<span class="pitcher"><%=mymatch.getHome_pitcher() %></span></td>
							</tr>
						
					</table>
				</div>
				<!-- 버튼 -->
				<div class="rightone">
					<input style="background: #074ca1" type="button" value="응원하기"
						onclick="openPopup()">
				</div>
			</div>
		</div>
		<div class="write_wrap">
			<div class="write">
				<%
				MemberDTO mem_login = (MemberDTO) session.getAttribute("login_member");
				int team_idx  = 0;
				if(mem_login != null){
				team_idx= mem_login.getTeam_idx();
				}
				if(mem_login == null){%>
				<a href="Login.jsp"><input style="background: #ea0029"
						type="button" name="write" value="글 쓰기" id="write"></a>
				<%}else if(mem_login != null && team_idx == 3){%>
				<a href="TeamPostingWrite.jsp"><input style="background: #ea0029"
						type="button" name="write" value="글 쓰기" id="write"></a>
				<%}else if(mem_login != null && team_idx != 3){%>
				<a href="javascript:window.history.back();"><input style="background: #ea0029"
						type="button" name="write" value="글 쓰기" id="write"></a>
			<%}%>
			</div>
		</div>
		<div class="page_wrap">
			<div class="page">
				<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
				<a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a>
				<a href="#">9</a> <a href="#">10</a> <a href="#" class="next"
					title="다음"><input type="button" name="next" value="다음"></a>
			</div>
		</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
	</div>
	<!-- 팝업 창 -->
	<div class="overlay" id="overlay"></div>
	<div class="popup" id="popup">
		<h2>응원하기</h2>
		<div>팀 응원가</div>
		<div>
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/ciNNnn7corY?si=cUNtg7nXLMQXVIeN"
				title="YouTube video player" frameborder="0"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
				referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</div>
		<a target="_blank" href="https://samsunglionsmall.com/"><img
			id="logo" src="./image/samsung.svg"></a> <span><< 굿즈 사러가기 </span> <span
			style="color: red">CLICK!</span>
		<button style="background: #074ca1" onclick="closePopup()">닫기</button>
	</div>


	<script>
		function openPopup() {
			document.getElementById('overlay').style.display = 'block';
			document.getElementById('popup').style.display = 'block';
		}

		function closePopup() {
			document.getElementById('overlay').style.display = 'none';
			document.getElementById('popup').style.display = 'none';
		}
	</script>
</body>
</html>