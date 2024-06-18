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

#team_select h6 {
    display: inline-block; 
    width : 40px;
	height : 20px;
}
</style>
</head>

<body>
	<div id="team_select">
		<h6>팀선택</h6>
		<select id="team_select10">
			<option value="kia">기아</option>
			<option value="samsung">삼성</option>
			<option value="lotte">롯데</option>
			<option value="nc">NC</option>
			<option value="kt">KT</option>
			<option value="hanwha">한화</option>
			<option value="kiwoom">키움</option>
			<option value="doosan">두산</option>
			<option value="lg">엘지</option>
			<option value="ssg">SSG</option>
		</select>
	</div>
	<div id="hotplayer_box">
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
						<td><input type="radio" name="player" value="player1"
							onclick="toggleRadio(this)"></td>
					</tr>
				</tbody>

			</table>

		</div>
	</div>

	<p id="selected-player">선택한 선수:</p>

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
				updateSelectedPlayer(radio.parentNode.nextElementSibling.textContent);
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