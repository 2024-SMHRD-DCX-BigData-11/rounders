<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/1b2fc50a32.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<title>Nav bar</title>
<style type="text/css">
body {
	margin: 0;
	font-family: "Noto Sans KR", sans-serif;
}

img {
	width: 80%;
	height: 80px;
}

ul li{
		list-style: none;
		font-size: 20px;
	}
.navbar__menu>li{
	position: relative;
}
.navbar__menu>li>ul{
		padding: 0;
		float:left;
		display:none;
		position:absolute;
		width:100%;
		font-size:15px;
		background-color:#00421f;
		z-index : 1;
		flex-direction: column;
		text-align: center;
}

.navbar__menu> li:hover > ul {
		display:flex;
	}
.navbar__menu > li > ul > li:hover {
		background: orange;
		transition: ease 1s;
		}

a {
	padding : 10px;
	text-decoration: none;
	color: white;
	text-align: center;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #00421f;
/* 	width: 100%; */
}

.navbar__logo {
	color: white;
}

.navbar__menu {
	display: flex; /* 내부 요소들을 Flexbox로 배치 */
	list-style-type: none; /* 리스트의 기본 마커를 제거 */
	padding: 0; /* 내부 패딩 초기화 */
}

.navbar__menu li:hover {
	background-color: grey;
	border-radius: 4px;
}

.navbar__links {
	list-style: none;
	padding-left: 0;
	color: teal;
	display: flex;
}

.navbar__links li {
	padding: 8px 12px;
}

.navbar__toggleBtn {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
}

@media screen and (width<=768px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 12px;
	}
	img {
		width: 80%;
		height: 50px;
	}
	.navbar__menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar__menu li {
		width: 100%;
		text-align: center;
		margin-right: 0px;
		margin-bottom: 15px;
	}
	.navbar__links {
		display: none;
		justify-content: center;
		width: 100%;
	}
	.navbar__toggleBtn {
		display: block;
	}
	.navbar__menu.active, .navbar__links.active {
		display: flex;
	}
	.navbar__menu>li>ul{
		width: 100%;
	}
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<a href="Main.jsp"><img alt="logo" src="./image/logo.jpg"></a>
		</div>
		<ul class="navbar__menu">
			<li><a href="Hitter_Stat.jsp">기록실</a>
				<ul>
					<li><a href="Hitter_Stat.jsp">타자</a></li>
					<li><a href="Pitcher_Stat.jsp">투수</a></li>
				</ul>
			</li>
			<li><a href="Notice.jsp">공지사항</a></li>
			<li><a href="FreeBoard.jsp">자유게시판</a></li>
			<li><a href="Hotplayer.jsp">핫플레이어</a></li>
			<li><a href="">팀 페이지</a>
				<ul>
					<li><a href="KiaTeamPage.jsp">기아</a></li>
					<li><a href="LgTeamPage.jsp">엘지</a></li>
					<li><a href="SamsungTeamPage.jsp">삼성</a></li>
					<li><a href="DoosanTeamPage.jsp">두산</a></li>
					<li><a href="SsgTeamPage.jsp">SSG</a></li>
					<li><a href="NcTeamPage.jsp">NC</a></li>
					<li><a href="HanwhaTeamPage.jsp">한화</a></li>
					<li><a href="LotteTeamPage.jsp">롯데</a></li>
					<li><a href="KtTeamPage.jsp">kt</a></li>
					<li><a href="KiwoomTeamPage.jsp">키움</a></li>
				</ul>
			</li>
		</ul>
		<ul class="navbar__links">
			<%MemberDTO lm = (MemberDTO)session.getAttribute("login_member");
			if(lm == null){%>
			<li><a href="Join.jsp">회원가입</a></li>
			<li><a href="Login.jsp">로그인</a></li>
			<%}else if(lm != null){%>
			<li><a href="MyPagehome.jsp">회원정보</a></li>
			<li><a href="LogoutCon">로그아웃</a></li>
			<%}%>
		</ul>


		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</nav>
	<!-- 헤더 수정완료 -->
	<script type="text/javascript">
		const toggleBtn = document.querySelector('.navbar__toggleBtn');
		const menu = document.querySelector('.navbar__menu');
		const links = document.querySelector('.navbar__links');

		toggleBtn.addEventListener('click', function() {
			menu.classList.toggle('active');
			links.classList.toggle('active');
		})
	</script>

</body>
</html>