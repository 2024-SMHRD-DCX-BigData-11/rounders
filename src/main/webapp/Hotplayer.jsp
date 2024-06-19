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

#team_select{
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#team_select h2{
 	margin-right: 10px;
}

#team_select10{
 	height: 20px;
 	margin-top: 25px;
}



</style>
</head>

<body>
<% 
	String team = request.getParameter("team");
	int idx = 0;
	if(team == null){
		MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
		if(login_member == null){
			idx = 1;
		}else{
		idx = login_member.getTeam_idx();
		}
	}else{
		idx = Integer.parseInt(team);
	}
	System.out.println(idx);
	List<PlayerDTO> pi = new HotPlayerDAO().selectPlayer(idx);
	for(PlayerDTO p : pi){
	System.out.println(p.getPlayer_name());
	}
	%>
	<div id="team_select">
		<h2>팀선택</h2>
		<select id="team_select10" onchange="if(this.value) location.href=(this.value);">
			<option value="">팀을 선택하세요.</option>
			<option value="Hotplayer.jsp?team=1">기아</option>
			<option value="Hotplayer.jsp?team=3">삼성</option>
			<option value="Hotplayer.jsp?team=8">롯데</option>
			<option value="Hotplayer.jsp?team=6">NC</option>
			<option value="Hotplayer.jsp?team=9">KT</option>
			<option value="Hotplayer.jsp?team=7">한화</option>
			<option value="Hotplayer.jsp?team=10">키움</option>
			<option value="Hotplayer.jsp?team=3">두산</option>
			<option value="Hotplayer.jsp?team=2">엘지</option>
			<option value="Hotplayer.jsp?team=5">SSG</option>
		</select>
	</div>
	<div id="hotplayer_box">
	<p id="selected-player">선택한 선수:</p>
	<form>
		<div class="hotplayer_table">
			<table>
				<thead>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="radio" name="player" value='1,김도영'
							onclick="toggleRadio(this)"></td>
					</tr>
				</tbody>

			</table>
		</div>
		<div><input type="submit" value = "투표하기"></div>
		</form>
	
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
			const selectedPlayerElement = document.getElementById('selected-player');
			selectedPlayerElement.textContent = selectedPlayerName ? `선택한 선수: ${selectedPlayerName}`
					: '선택한 선수: ';
		}
	</script>

</body>
</html>