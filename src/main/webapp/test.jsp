<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>베이스볼톡</title>
<style>
	table{
		margin: auto;
	}
	
	.team{
		font-size: 20px;
	}
	
	.pitcher{
		font-size: 15px;
	}
	
	#schedule_wrap{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 5%;
		margin:auto;
		width: 200px;
		heigth:200px;
		text-align: center;
		font-size:20px;
		border-style: solid;
		border-width: medium;
		
		
	}
	
	#match_date{
		border-bottom: 1px solid;
	}
	
	#hot_board{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 25%;
		margin:auto;
		width: 40%;
		height: 300px;
		background-color: blue;
	}
	
	#rank{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 70%;
		margin:auto;
		width: 25%;
		height: 500px;
		background-color: red;
	}
	
	#hotplayer{
		padding:10px;
		position:absolute;
		top : 500px;
		left : 35%;
		margin:auto;
		width: 30%;
		height: 300px;
		background-color: yellow;
	}
	
	#team_wrap{
		padding:10px;
		position:absolute;
		top : 500px;
		left : 2%;
		margin:auto;
		width: 30%;
		height: 150px;
		background-color: green;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap; 
		align-content: center;

	}
	
	.team_board{
		width:15%;
		height:50px;
		height: 50px;
		background-color: cyan;
		margin: 5px;
	}
	
	
	@media (width<=768px) {
	.team{
		font-size:20px;
	}
	
	.pitcher{
		font-size: 15px;
	}
	
	#schedule_wrap{
		position: absolute;
		top:70px;
		left : 30%;
		padding:10px;
		width: 40%;
		heigth: 200px;
		text-align: center;
		font-size:20px;
		border-style: solid;
		border-width: medium;
	}
	
	#schedule_wrap.active{
		margin-top: 200px;
	}
	
	#match_date{
	border-bottom: 1px solid;
	}
	
	#schedule_wrap.active{
		margin-top: 200px;
	}
	
	#rank{
		padding:10px;
		position:absolute;
		top : 300px;
		left : 20%;
		width: 60%;
		height: 500px;
		background-color: red;
		margin-top: 150px;
	}
	
	#rank.active{
		margin-top: 350px;
	}
	
	#hotplayer{
		padding:10px;
		position:absolute;
		top : 600px;
		left : 10%;
		width: 80%;
		height: 300px;
		background-color: yellow;
		margin-top: 400px;
	}
	
	#hotplayer.active{
		margin-top: 600px;
	}
	
	#team_wrap{
		padding:10px;
		position:absolute;
		top : 900px;
		left : 15%;
		width: 70%;
		height: 150px;
		background-color: green;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap; 
		align-content: center;
		margin-top: 450px;
	}
	
	#team_wrap.active{
		margin-top: 650px;
	}
	
	.team_board{
		width:15%;
		height:50px;
		height: 50px;
		background-color: cyan;
		margin: 5px;
	}
	
	#hot_board{
		padding:10px;
		position:absolute;
		top : 1200px;
		left : 10%;
		width: 80%;
		height: 300px;
		background-color: blue;
		margin-top: 350px;
	}
	
	#hot_board.active{
		margin-top: 550px;
	}
}

@media (768px<width<=1200px){

		#schedule_wrap{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 0%;
		margin:auto;
		width: 20%;
		heigth:200px;
		text-align: center;
		font-size:20px;
		border-style: solid;
		border-width: medium;
		
		
	}
	
	#match_date{
		border-bottom: 1px solid;
	}
	
	#hot_board{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 25%;
		width: 43%;
		height: 300px;
		background-color: blue;
	}
	
	#rank{
		padding:10px;
		position:absolute;
		top : 100px;
		left : 72%;
		margin:auto;
		width: 25%;
		height: 500px;
		background-color: red;
	}
	
	#hotplayer{
		padding:10px;
		position:absolute;
		top : 500px;
		left : 35%;
		margin:auto;
		width: 30%;
		height: 300px;
		background-color: yellow;
	}
	
	#team_wrap{
		padding:10px;
		position:absolute;
		top : 500px;
		left : 0%;
		margin:auto;
		width: 30%;
		height: 150px;
		background-color: green;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap; 
		align-content: center;

	}
	
	.team_board{
		width:15%;
		height:50px;
		height: 50px;
		background-color: cyan;
		margin: 5px;
	}
}

</style>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<c:if test="${empty match}">
	<%
		response.sendRedirect("TestCon");
	%>
	
	</c:if>
	<div id = "schedule_wrap">
	<table>
	<tr>
	<th colspan="3" id="match_date">오늘의 경기<br>
	<span>${match.get(0).getDate()}</span></th>
	</tr>
	<c:forEach var="i" begin="0" end="4" step="1">
		<tr>
		<td><span class="team">${match.get(i).getAway()}</span><br>
			<span class = "pitcher">${match.get(i).getAwayPitcher() }</span></td>
		<td>${match.get(i).getTime() }</td>
		<td><span class = "team">${match.get(i).getHome() }</span><br>
			<span class = "pitcher">${match.get(i).getHomePitcher() }</span></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<div id = "hot_board">핫게시글
	</div>
	<div id = "rank">순위표
	</div>
	<div id = 'team_wrap'>
	<div class = 'team_board'>기아</div>
	<div class = 'team_board'>한화</div>
	<div class = 'team_board'>kt</div>
	<div class = 'team_board'>키움</div>
	<div class = 'team_board'>두산</div>
	<div class = 'team_board'>lg</div>
	<div class = 'team_board'>삼성</div>
	<div class = 'team_board'>NC</div>
	<div class = 'team_board'>SSG</div>
	<div class = 'team_board'>롯데</div>
	</div>
	<div id = "hotplayer">핫플레이어</div>


<script type="text/javascript">
	const toggleBtn = document.querySelector('.navbar__toggleBtn');
	const menu = document.querySelector('.navbar__menu');
	const links = document.querySelector('.navbar__links');
	const schedule = document.querySelector('#schedule_wrap');
	const rank = document.querySelector('#rank');
	const hotplayer = document.querySelector('#hotplayer');
	const team_wrap = document.querySelector('#team_wrap');
	const hotboard = document.querySelector('#hot_board');
	
	toggleBtn.addEventListener('click', function(){
    	menu.classList.toggle('active');
    	links.classList.toggle('active');	
    	schedule.classList.toggle('active');
    	rank.classList.toggle('active');
    	hotplayer.classList.toggle('active');
    	team_wrap.classList.toggle('active');
    	hotboard.classList.toggle('active');
})
</script>
	
</body>
</html>