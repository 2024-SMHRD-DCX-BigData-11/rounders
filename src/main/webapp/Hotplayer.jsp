<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.PlayerDTO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="com.baseballtalk.model.HotPlayerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f0f0f0;
	padding: 20px;
}

img {
	image-rendering: auto;
	width: 100px;
	heigth: 100px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

td input[type="radio"] {
	margin: 0;
}

td label {
	cursor: pointer;
}

td label:hover {
	background-color: #f9f9f9;
}

p#selected-player {
	font-weight: bold;
	margin-top: 10px;
}

#team_select {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#team_select h2 {
	margin-right: 10px;
}

#team_select10 {
	height: 20px;
	margin-top: 25px;
}

.playerview{
display: flex;
flex-direction: row;
justify-content: space-between;
}

.buttonwrap {
	display: flex;
	flex-direction: row;
	width: 100%;
	justify-content: center;
}

.smitbutton {
	width: 30%;
	height: 100%;
	background: black;
	color: white;
}

#voted{
font-weight: bold;
	margin-top: 10px;
}
</style>
</head>

<body>
   	 <%@ include file = "header.jsp" %>
	<%
	MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
	String team = request.getParameter("team");
	int idx = 0;
	if (team == null) {
		if (login_member == null) {
			idx = 1;
		} else {
			if (login_member.getTeam_idx() == null) {
		idx = 1;
			} else {
		idx = login_member.getTeam_idx();
			}
		}
	} else {
		idx = Integer.parseInt(team);
	}
	System.out.println(idx);
	List<PlayerDTO> pi = new HotPlayerDAO().selectPlayer(idx);
	%>
	<div id="team_select">
		<h2>팀선택</h2>
		<select id="team_select10"
			onchange="if(this.value) location.href=(this.value);">
			<option value="">팀을 선택하세요.</option>
			<option value="Hotplayer.jsp?team=1">기아</option>
			<option value="Hotplayer.jsp?team=3">삼성</option>
			<option value="Hotplayer.jsp?team=8">롯데</option>
			<option value="Hotplayer.jsp?team=6">NC</option>
			<option value="Hotplayer.jsp?team=9">KT</option>
			<option value="Hotplayer.jsp?team=7">한화</option>
			<option value="Hotplayer.jsp?team=10">키움</option>
			<option value="Hotplayer.jsp?team=4">두산</option>
			<option value="Hotplayer.jsp?team=2">엘지</option>
			<option value="Hotplayer.jsp?team=5">SSG</option>
		</select>
	</div>
	<div id="hotplayer_box">
		<%String votedPlayer = "";
		if(login_member == null){
			votedPlayer = "로그인이 필요합니다.";
		}else{
			votedPlayer = new HotPlayerDAO().votedPlayer(login_member.getMem_id());
			if(votedPlayer == null){
				votedPlayer = "없음";
			}
			
		}
		 %>
		<div class="playerview"><div><p id="selected-player">선택한 선수:</p></div><div><p id="voted">내가 투표한 선수: 
		<%=votedPlayer%></p></div></div>
		<form action="HotplayerCon" method="post">
			<div class="hotplayer_table">
				<table>
					<thead>
						<th>선수 사진</th>
						<th>소속팀</th>
						<th>이름</th>
						<th>포지션</th>
						<th>생년월일</th>
						<th>등번호</th>
						<th>투표수</th>
						<th>선택</th>
					</thead>
					<tbody>
						<%
						for (PlayerDTO p : pi) {
						%>
						<tr>
							<%
							if (idx != 7) {
							%>
							<td><img src=<%=p.getPlayer_img()%>></td>
							<%
							} else {
							%>
							<td><img src="./hanwha/<%=p.getPlayer_img()%>"></td>
							<%
							}
							%>
							<td><%=p.getPlayer_name()%></td>
							<td><%=p.getTeam_name()%></td>
							<td><%=p.getPlayer_position()%></td>
							<td><%=p.getPlayer_born()%></td>
							<td><%=p.getPlayer_number()%></td>
							<td><%=p.getPlayer_likes()%></td>
							<td><input type="radio" name="player" 
								value='<%=p.getPlayer_idx()%>,<%=p.getPlayer_name()%>'
								onclick="toggleRadio(this)"></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<input type="hidden" value=<%=idx%> name="index">
			</div>
			<div class="buttonwrap">
				<input class="smitbutton" type="submit" value="투표하기">
			</div>
		</form>
	<div>
   	 <%@ include file = "Footer.jsp" %>
   </div> 
	</div>

	<script>
		let lastSelectedPlayer = null; // 마지막 선택된 선수 저장 변수
		// 라디오 버튼 선택 토글 함수
		function toggleRadio(radio) {
			if (radio === lastSelectedPlayer && radio.checked) {
				radio.checked = false;
				lastSelectedPlayer = null;
				updateSelectedPlayer(null);
			} else {
				lastSelectedPlayer = radio;
				let radioval = radio.value.split(",");
				let Name = radioval[1]
				updateSelectedPlayer(Name);
			}
		}

		// 선택된 선수 업데이트 함수
		function updateSelectedPlayer(selectedPlayerName) {
			const selectedPlayerElement = document
					.getElementById('selected-player');
			selectedPlayerElement.textContent = selectedPlayerName ? `선택한 선수: ${selectedPlayerName}`
					: '선택한 선수: ';
		}
	</script>

</body>
</html>