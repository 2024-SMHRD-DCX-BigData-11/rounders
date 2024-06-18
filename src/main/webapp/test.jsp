<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
<style>

table {
	margin: auto;
	padding: 7px;
	background-color: white;
	border: 1px solid #ffffff;
	text-align: center;
	width: 100%;
	height: 100%;
}

img {
	image-rendering: auto;
}

#hot_board {
	padding: 10px;
	position: absolute;
	top: 100px;
	right: 10px;
	width: 35%;
	height: 600px;
	background-color: blue;
	text-align: center;
}

#h_board {
	padding: 8px;
	height: 20px;
}

#rank {
	padding: 10px;
	position: absolute;
	top: 100px;
	left: 10px;
	width: 37%;
	height: 600px;
	text-align: center;
}

#rank_name {
	padding: 8px;
	height: 20px;
}

.rank_box {
	border-collapse: collapse;
}

.table_th {
	padding: 10px;
	font-size: 14px;
	font-weight: lighter;
	text-align: center;
	background-color: lightgray;
	height: 10px;
}

.table_td {
	text-align: center;
	font-size: 12px;
}

.team {
	font-size: 15px;
}

.pitcher {
	font-size: 12px;
}

#schedule_wrap {
	padding: 8px;
	position: absolute;
	top: 100px;
	left: 40%;
	margin: auto;
	width: 300px;
	heigth: 100px;
	text-align: center;
	font-size: 15px;
	border-style: solid;
	border-width: medium;
}

#hotplayer {
	padding: 10px;
	position: absolute;
	top: 500px;
	left: 40%;
	margin: auto;
	width: 300px;
	height: 200px;
	background-color: yellow;
	text-align: center;
}

#match_date {
	border-bottom: 1px solid;
}

.team_wrap01 {
	padding: 10px;
	position: absolute;
	top: 750px;
	left: 2%;
	margin: auto;
	width: 90%;
	height: 200px;
	background-color: #00421f;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	align-content: center;
}

.team_wrap02 {
	padding: 10px;
	position: absolute;
	top: 300px;
	left: 2%;
	margin: auto;
	width: 90%;
	height: 200px;
	background-color: #00421f;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	align-content: center;
}

.team_board {
	width: 150px;
	height: 100px;
	margin: 5px;
}

@media ( width <=768px) {
	.team {
		font-size: 20px;
	}
	.pitcher {
		font-size: 15px;
	}
	#schedule_wrap {
		position: absolute;
		top: 70px;
		left: 30%;
		padding: 10px;
		width: 40%;
		heigth: 200px;
		text-align: center;
		font-size: 20px;
		border-style: solid;
		border-width: medium;
	}
	#schedule_wrap.active {
		margin-top: 200px;
	}
	#match_date {
		border-bottom: 1px solid;
	}
	#schedule_wrap.active {
		margin-top: 200px;
	}
	#rank {
		padding: 10px;
		position: absolute;
		top: 300px;
		left: 20%;
		width: 60%;
		height: 500px;
		background-color: red;
		margin-top: 150px;
	}
	#rank.active {
		margin-top: 350px;
	}
	#hotplayer {
		padding: 10px;
		position: absolute;
		top: 600px;
		left: 10%;
		width: 80%;
		height: 300px;
		background-color: yellow;
		margin-top: 400px;
	}
	#hotplayer.active {
		margin-top: 600px;
	}
	#team_wrap1.active {
		margin-top: 650px;
	}
	#team_wrap2.active {
		margin-top: 750px;
	}
	#hot_board {
		padding: 10px;
		position: absolute;
		top: 1200px;
		left: 10%;
		width: 80%;
		height: 300px;
		background-color: blue;
		margin-top: 350px;
	}
	#hot_board.active {
		margin-top: 550px;
	}
}

@media (768 px <width<=1200px) {
	#schedule_wrap {
		padding: 10px;
		position: absolute;
		top: 100px;
		left: 0%;
		margin: auto;
		width: 20%;
		heigth: 200px;
		text-align: center;
		font-size: 20px;
		border-style: solid;
		border-width: medium;
	}
	#match_date {
		border-bottom: 1px solid;
	}
	#hot_board {
		padding: 10px;
		position: absolute;
		top: 100px;
		left: 25%;
		width: 43%;
		height: 300px;
		background-color: blue;
	}
	#rank {
		padding: 10px;
		position: absolute;
		top: 100px;
		left: 72%;
		margin: auto;
		width: 25%;
		height: 500px;
		background-color: red;
		align-content: center;
	}
	#hotplayer {
		padding: 10px;
		position: absolute;
		top: 500px;
		left: 35%;
		margin: auto;
		width: 30%;
		height: 300px;
		background-color: yellow;
	}
	#team_wrap {
		padding: 10px;
		position: absolute;
		top: 500px;
		left: 0%;
		margin: auto;
		width: 30%;
		height: 150px;
		background-color: green;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
		align-content: center;
	}
	.team_board {
		width: 20%;
		height: 20%;
		margin: 5px;
	}
	.team_box {
		
	}
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<c:if test="${empty match}">
		<%
		response.sendRedirect("TestCon");
		%>
	</c:if>
	<%
	MemberDTO member = (MemberDTO) session.getAttribute("login_member");
	%>
	<div id="schedule_wrap">
		<table>
			<tr>
				<th colspan="3" id="match_date">오늘의 경기<br> <span>${match.get(0).getMatch_date()}</span></th>
			</tr>
			<c:forEach var="i" begin="0" end="4" step="1">
				<tr>
					<td><span class="team">${match.get(i).getAway_team()}</span><br>
						<span class="pitcher">${match.get(i).getAway_pitcher() }</span></td>
					<td>${match.get(i).getMatch_time() }</td>
					<td><span class="team">${match.get(i).getHome_team() }</span><br>
						<span class="pitcher">${match.get(i).getHome_pitcher() }</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
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
				<tr>
					<td>1</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>5</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>7</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>8</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>9</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>10</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</tbody>
		</table>
	</div>

	<div id="h_board">
		<div id="hot_board" style="background-color: #f07d0c">
			핫게시글
			<table class="hot_board_box">
				<thead class="table_th">
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>3</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>5</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>6</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>7</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>8</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>9</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>10</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<%=member%>

	<!-- 팀 로고 클릭 시 팀게시판으로 링크 윗줄 5개 'team_wrap01' -->
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
		<div >
		<%@ include file="Footer.jsp"%>
		</div>
	</div>

	<div id="hotplayer">핫플레이어</div>

	<script type="text/javascript">
		const toggleBtn = document.querySelector('.navbar__toggleBtn');
		const menu = document.querySelector('.navbar__menu');
		const links = document.querySelector('.navbar__links');
		const schedule = document.querySelector('#schedule_wrap');
		const rank = document.querySelector('#rank');
		const hotplayer = document.querySelector('#hotplayer');
		const team_wrap01 = document.querySelector('#team_wrap01');
		const team_wrap02 = document.querySelector('#team_wrap02');
		const hotboard = document.querySelector('#hot_board');

		toggleBtn.addEventListener('click', function() {
			menu.classList.toggle('active');
			links.classList.toggle('active');
			schedule.classList.toggle('active');
			rank.classList.toggle('active');
			hotplayer.classList.toggle('active');
			team_wrap01.classList.toggle('active');
			team_wrap02.classList.toggle('active');
			hotboard.classList.toggle('active');
		})
	</script>
	
</body>

</html>